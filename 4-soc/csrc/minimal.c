// SPDX-License-Identifier: MIT
// Fenster "Munching Squares" Demo Ported to Bare-metal SOC
// Hardware Resolution: 64x64

#include <stdint.h>
#include <stdlib.h> 

// ==========================================
// 1. MMIO Definitions (Verified)
// ==========================================
#define VGA_BASE        0x20000000u
#define VGA_UPLOAD_ADDR (VGA_BASE + 0x10)
#define VGA_STREAM_DATA (VGA_BASE + 0x14)
#define VGA_CTRL        0x20000000u + 0x20
#define VGA_PALETTE(n)  (VGA_BASE + 0x24 + ((n) << 2))

// ==========================================
// 2. Constants & Global Data
// ==========================================
#define W 64
#define H 64
#define FRAME_SIZE (W * H) 

// Global frame buffer
static uint8_t frame_buffer[FRAME_SIZE];

// ==========================================
// 3. Helper Functions
// ==========================================
static inline void vga_write32(uint32_t addr, uint32_t val) {
    *(volatile uint32_t *) addr = val;
}

static inline void delay(uint32_t cycles) {
    for (volatile uint32_t i = 0; i < cycles; i++);
}

// Initialize extended palette: Fill color indices 0-15
void init_full_palette() {
    uint8_t base_colors[] = {
        0x00, // 0: Black
        0x30, // 1: Red
        0x3F, // 2: White
        0x03, // 3: Blue
        0x33, // 4: Magenta
        0x0C, // 5: Greenish/Cyan
        0x3C, // 6: Yellow
        0x15  // 7: Grey
    };

    // Repeat these 8 colors to fill palette slots 0-15
    for (int i = 0; i < 16; i++) {
        vga_write32(VGA_PALETTE(i), base_colors[i % 8]);
    }
}

// ==========================================
// 4. Drawing Functions
// ==========================================
// Set pixel (Directly operate on global variable)
static inline void __attribute__((always_inline)) draw_pixel(int x, int y, uint8_t c) {
    // Boundary check
    if ((x & ~63) == 0 && (y & ~63) == 0) {
        frame_buffer[(y << 6) + x] = c;
    }
}

// ==========================================
// 5. Hardware Flush (Verified)
// ==========================================
static inline uint32_t pack8_pixels(const uint8_t *pixels) {
    // Pack 8 pixels (4-bit index each) into one 32-bit word
    return (uint32_t) (pixels[0] & 0xF) | 
           ((uint32_t) (pixels[1] & 0xF) << 4) |
           ((uint32_t) (pixels[2] & 0xF) << 8) |
           ((uint32_t) (pixels[3] & 0xF) << 12) |
           ((uint32_t) (pixels[4] & 0xF) << 16) |
           ((uint32_t) (pixels[5] & 0xF) << 20) |
           ((uint32_t) (pixels[6] & 0xF) << 24) |
           ((uint32_t) (pixels[7] & 0xF) << 28);
}

void vga_flush() {
    vga_write32(VGA_UPLOAD_ADDR, 0); 
    
    for (int i = 0; i < FRAME_SIZE; i += 8) {
        vga_write32(VGA_STREAM_DATA, pack8_pixels(&frame_buffer[i]));
    }
}

// ==========================================
// 6. Main Function (Replicating Fenster Logic)
// ==========================================
int main(void) {
    // Initialization
    init_full_palette();
    vga_write32(VGA_CTRL, 0x01); // Enable VGA

    int t = 0; // Time counter

    while (1) {
        // Render Loop (Software Rendering)
        for (int y = 0; y < H; y++) {
            for (int x = 0; x < W; x++) {
                
                // Fenster formula: val = x ^ y ^ t
                int val = x ^ y ^ t;

                uint8_t col_idx = val & 0xF;

                draw_pixel(x, y, col_idx);
            }
        }

        // Time Update
        t++;

        // Hardware Flush
        vga_flush();
        
        // 5. Frame Rate Control
        delay(20000); 
    }
}
