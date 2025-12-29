// SPDX-License-Identifier: MIT
// MyCPU Simulation Host Code - Fixed Timing
// Features: Correct Instruction Fetch, Memory RW, Fast VGA, Mouse

#include <verilated.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <iomanip>

#include "VTop.h"

#ifdef ENABLE_SDL2
#include <SDL2/SDL.h>
#endif

// ============================================================================
// Memory Class (支援載入 binary 與讀寫)
// ============================================================================
class Memory {
    std::vector<uint32_t> mem;

public:
    explicit Memory(size_t size_bytes = 2 * 1024 * 1024) : mem(size_bytes / 4, 0) {}

    uint32_t read(uint32_t addr) {
        size_t idx = addr >> 2;
        if (idx < mem.size()) return mem[idx];
        return 0;
    }

    void write(uint32_t addr, uint32_t val, uint8_t strobe) {
        size_t idx = addr >> 2;
        if (idx >= mem.size()) return;
        uint32_t mask = 0;
        if (strobe & 1) mask |= 0x000000FF;
        if (strobe & 2) mask |= 0x0000FF00;
        if (strobe & 4) mask |= 0x00FF0000;
        if (strobe & 8) mask |= 0xFF000000;
        mem[idx] = (mem[idx] & ~mask) | (val & mask);
    }

    void load_binary(const char* filename, size_t load_address = 0x1000) {
        std::ifstream file(filename, std::ios::binary | std::ios::ate);
        if (!file) throw std::runtime_error(std::string("Cannot open file: ") + filename);
        size_t size = file.tellg();
        file.seekg(0, std::ios::beg);
        
        size_t start_idx = load_address >> 2;
        if (start_idx + (size + 3) / 4 > mem.size()) throw std::runtime_error("File too large");
        
        if (!file.read(reinterpret_cast<char*>(&mem[start_idx]), size)) throw std::runtime_error("Read error");
        std::cout << "Loaded " << size << " bytes from " << filename << " to address 0x" << std::hex << load_address << std::dec << std::endl;
    }
};

// Global simulation time
vluint64_t main_time = 0;
double sc_time_stamp() { return main_time; }

// ============================================================================
// Main Function
// ============================================================================
int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);
    VTop* top = new VTop;
    Memory ram(2 * 1024 * 1024); // 2MB RAM

    const char* instruction_file = nullptr;
    for (int i = 1; i < argc; ++i) {
        std::string arg = argv[i];
        if (arg == "-i" && i + 1 < argc) instruction_file = argv[++i];
    }

    if (!instruction_file) {
        std::cerr << "Error: No instruction file specified." << std::endl;
        return 1;
    }

    try {
        // 載入 Binary 到 0x0000
        ram.load_binary(instruction_file, 0x1000);
    } catch (const std::exception& e) {
        std::cerr << "Loader Error: " << e.what() << std::endl;
        return 1;
    }

#ifdef ENABLE_SDL2
    if (SDL_Init(SDL_INIT_VIDEO) < 0) return 1;
    SDL_Window* window = SDL_CreateWindow("MyCPU (Correct Timing)", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 480, SDL_WINDOW_SHOWN);
    SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    SDL_Texture* texture = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STREAMING, 640, 480);
    uint32_t* pixels = new uint32_t[640 * 480];
    memset(pixels, 0, 640 * 480 * sizeof(uint32_t));
#endif

    // Init Signals
    top->clock = 0;
    top->reset = 1;
    top->io_mouse_x = 0;
    top->io_mouse_y = 0;
    
    // Reset Sequence
    for(int i=0; i<10; i++) {
        top->clock = !top->clock;
        top->eval();
    }
    top->reset = 0;
    
    // *** 關鍵修正 1: 先讀取第一道指令 (PC=0) ***
    uint32_t inst = ram.read(0x1000);

    bool quit = false;
    static bool prev_vsync = false;

    while (!Verilated::gotFinish() && !quit) {
        
        // 1. 設定輸入 (指令)
        top->io_instruction = inst;
        top->io_instruction_valid = 1;

        // 2. 切換時鐘
        top->clock = !top->clock;

        // 3. 在 Clock High 時處理 Data Memory (模擬同步 RAM 行為)
        if (top->clock) {
            // Memory Write
            if (top->io_mem_slave_write) {
                uint8_t strobe = (top->io_mem_slave_write_strobe_0) |
                                 (top->io_mem_slave_write_strobe_1 << 1) |
                                 (top->io_mem_slave_write_strobe_2 << 2) |
                                 (top->io_mem_slave_write_strobe_3 << 3);
                ram.write(top->io_mem_slave_address, top->io_mem_slave_write_data, strobe);
            }
            // Memory Read (這是 Nyan Cat 圖片出不來的主因，這裡修好了)
            if (top->io_mem_slave_read) {
                top->io_mem_slave_read_data = ram.read(top->io_mem_slave_address);
                top->io_mem_slave_read_valid = 1;
            } else {
                top->io_mem_slave_read_valid = 0;
            }
        }

        // 4. VGA Clock (跟隨系統時鐘)
        top->io_vga_pixclk = top->clock; 

        // 5. 滑鼠輸入 (每 4096 cycles 更新一次)
        if ((main_time & 0xFFF) == 0) {
            SDL_Event e;
            while (SDL_PollEvent(&e)) {
                if (e.type == SDL_QUIT) quit = true;
                if (e.type == SDL_KEYDOWN && e.key.keysym.sym == SDLK_ESCAPE) quit = true;
            }
            int mx, my;
            uint32_t buttons = SDL_GetMouseState(&mx, &my);
            if (mx < 0) mx = 0; if (mx > 639) mx = 639;
            if (my < 0) my = 0; if (my > 479) my = 479;
            top->io_mouse_x = (uint16_t)mx;
            top->io_mouse_y = (uint16_t)my;
            top->io_mouse_left_button   = (buttons & SDL_BUTTON(SDL_BUTTON_LEFT)) ? 1 : 0;
            top->io_mouse_right_button  = (buttons & SDL_BUTTON(SDL_BUTTON_RIGHT)) ? 1 : 0;
            top->io_mouse_middle_button = (buttons & SDL_BUTTON(SDL_BUTTON_MIDDLE)) ? 1 : 0;
        }

        // 6. 硬體計算 (Eval)
        // 這一步會更新 PC，並產生新的 Memory Request
        top->eval();

        // *** 關鍵修正 2: 在 Eval 之後讀取「下一道」指令 ***
        // 這樣下一個 Cycle 開始時，inst 變數裡放的才是正確的指令
        inst = ram.read(top->io_instruction_address);

        // 7. VGA 輸出 (Buffer + VSYNC Update)
#ifdef ENABLE_SDL2
        if (top->clock == 1) {
            if (top->io_vga_activevideo) {
                int x = top->io_vga_x_pos;
                int y = top->io_vga_y_pos;
                if (x >= 0 && x < 640 && y >= 0 && y < 480) {
                    uint8_t raw = (uint8_t)top->io_vga_rrggbb;
                    uint8_t r = (raw >> 4) & 0x3;
                    uint8_t g = (raw >> 2) & 0x3;
                    uint8_t b = raw & 0x3;
                    uint32_t color = (0xFF << 24) | (r * 85 << 16) | (g * 85 << 8) | (b * 85);
                    pixels[y * 640 + x] = color;
                }
            }
            // 只有在一幀結束 (VSYNC 邊緣) 時才更新畫面，速度極快
            if (!prev_vsync && top->io_vga_vsync) {
                SDL_UpdateTexture(texture, NULL, pixels, 640 * sizeof(uint32_t));
                SDL_RenderClear(renderer);
                SDL_RenderCopy(renderer, texture, NULL, NULL);
                SDL_RenderPresent(renderer);
            }
            prev_vsync = top->io_vga_vsync;
        }
#endif
        main_time++;
    }

    delete top;
#ifdef ENABLE_SDL2
    delete[] pixels;
    SDL_DestroyTexture(texture);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
#endif
    return 0;
}
