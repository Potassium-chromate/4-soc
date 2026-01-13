// SPDX-License-Identifier: MIT
// Direct Buffer Access Version (No Structs, No Mul)
// Hardware Resolution: 64x64

#include <stdint.h>
#include <stdlib.h> 

// ==========================================
// 1. MMIO Definitions
// ==========================================
#define VGA_BASE        0x20000000u
#define VGA_UPLOAD_ADDR (VGA_BASE + 0x10)
#define VGA_STREAM_DATA (VGA_BASE + 0x14)
#define VGA_CTRL        (VGA_BASE + 0x20)
#define VGA_PALETTE(n)  (VGA_BASE + 0x24 + ((n) << 2))

#define MOUSE_BASE      0x60000000
#define MOUSE_X    (*(volatile uint32_t *)(MOUSE_BASE + 0x00))
#define MOUSE_Y    (*(volatile uint32_t *)(MOUSE_BASE + 0x04))

// ==========================================
// 2. Constants & Global Data
// ==========================================
#define W 64
#define H 64
#define FRAME_SIZE (W * H) // 4096 bytes

#define ABS(x) ((x) > 0 ? (x) : -(x))
enum {
    C_BLACK = 0,
    C_RED   = 1,
    C_WHITE = 2,
    C_BLUE  = 3,
    C_MAGENTA = 4,
    C_MOUSE = 5
};

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

void init_palette() {
    vga_write32(VGA_PALETTE(C_BLACK), 0x00); // 0: Black
    vga_write32(VGA_PALETTE(C_RED), 0x30); // 1: Red
    vga_write32(VGA_PALETTE(C_WHITE), 0x3F); // 2: White
    vga_write32(VGA_PALETTE(C_BLUE), 0x03); // 3: Blue
    vga_write32(VGA_PALETTE(C_MAGENTA), 0x33); // 4: Magenta
    vga_write32(VGA_PALETTE(C_MOUSE), 0x3F); // 5: Mouse (White)
}

static inline int __attribute__((always_inline)) square_bitwise(int n) {
    unsigned int v = (n < 0) ? -n : n; 
    unsigned int result = 0;
    unsigned int shifted_v = v;

    while (v > 0) {
        if (v & 1) {
            result += shifted_v;
        }
        shifted_v <<= 1; 
        v >>= 1;
    }

    return (int)result;
}
// ==========================================
// 4. Direct Drawing Functions
// ==========================================

// Set pixel (Directly operate on global variable)
static inline void __attribute__((always_inline)) draw_pixel(int x, int y, uint8_t c) {
    // Boundary check: x, y must be between 0~63
    if ((x & ~63) == 0 && (y & ~63) == 0) {
        frame_buffer[(y << 6) + x] = c;
    }
}

static void draw_rect(int x, int y, int w, int h, uint8_t c) {
    for (int row = 0; row < h; row++) {
        for (int col = 0; col < w; col++) {
            draw_pixel(x + col, y + row, c);
        }
    }
}
// Draw line (Bresenham)
static void draw_line(int x0, int y0, int x1, int y1, uint8_t c) {
    // calculate absolute value
    int dx = (x1 > x0) ? (x1 - x0) : (x0 - x1);
    int dy = (y1 > y0) ? (y1 - y0) : (y0 - y1);
    

    // Standard Bresenham: err = dx - dy
    int err = dx - dy;


    for (int i = 0; i < 200; i++) {
        draw_pixel(x0, y0, c);

        if (x0 == x1 && y0 == y1) break;

        if ((err << 1) > -dy) {
            err -= dy;
            x0 += (x0 < x1) ? 1 : -1;
        }

        if ((err << 1) < dx) {
            err += dx;
            y0 += (y0 < y1) ? 1 : -1;
        }
    }
}

// clang-format off
static uint16_t font5x3[] = {0x0000,0x2092,0x002d,0x5f7d,0x279e,0x52a5,0x7ad6,0x0012,0x4494,0x1491,0x017a,0x05d0,0x1400,0x01c0,0x0400,0x12a4,0x2b6a,0x749a,0x752a,0x38a3,0x4f4a,0x38cf,0x3bce,0x12a7,0x3aae,0x49ae,0x0410,0x1410,0x4454,0x0e38,0x1511,0x10e3,0x73ee,0x5f7a,0x3beb,0x624e,0x3b6b,0x73cf,0x13cf,0x6b4e,0x5bed,0x7497,0x2b27,0x5add,0x7249,0x5b7d,0x5b6b,0x3b6e,0x12eb,0x4f6b,0x5aeb,0x388e,0x2497,0x6b6d,0x256d,0x5f6d,0x5aad,0x24ad,0x72a7,0x6496,0x4889,0x3493,0x002a,0xf000,0x0011,0x6b98,0x3b79,0x7270,0x7b74,0x6750,0x95d6,0xb9ee,0x5b59,0x6410,0xb482,0x56e8,0x6492,0x5be8,0x5b58,0x3b70,0x976a,0xcd6a,0x1370,0x38f0,0x64ba,0x3b68,0x2568,0x5f68,0x54a8,0xb9ad,0x73b8,0x64d6,0x2492,0x3593,0x03e0};
// clang-format on
static inline void draw_char_simple(int x, int y, char chr, uint8_t c) {
    // Basic check: VGA font usually starts from Space (32)
    if (chr < 32) return;


    // Assumes font5x3 is a global variable or defined above
    uint16_t bmp = font5x3[chr - 32];

    for (int dy = 0; dy < 5; dy++) {
        for (int dx = 0; dx < 3; dx++) {
            // Check if LSB is 1
            if (bmp & 1) {
                draw_pixel(x + dx, y + dy, c);
            }
            // Shift bitmap right by 1, ready to check next pixel
            bmp >>= 1;
        }
    }
}

static void draw_circle(int x, int y, int r, uint8_t c) {
  for (int dy = -r; dy <= r; dy++) {
    for (int dx = -r; dx <= r; dx++) {

      int dis = square_bitwise(dx);
      dis += square_bitwise(dy);
      int r2 = square_bitwise(r);
      if (dis <= r2)
          draw_pixel(x + dx, y + dy, c);
    }
  }
}


// ==========================================
// 5. Hardware Flush
// ==========================================
static inline uint32_t pack8_pixels(const uint8_t *pixels) {
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
// 6. Main Function
// ==========================================
int main(void) {
    // Initialization
    init_palette();
    vga_write32(VGA_CTRL, 0x01); // Enable

    // 2. 滑鼠虛擬讀取
    //volatile int32_t dummy = (int32_t)MOUSE_X;
    //(void)dummy;

    int cursor_x = W / 2;
    int cursor_y = H / 2;
    int acc_x = cursor_x << 4; 
    int acc_y = cursor_y << 4;
    int heartbeat = 0;

    while (1) {
        // --- Input ---
        int32_t dx = (int32_t)MOUSE_X;
        int32_t dy = (int32_t)MOUSE_Y;
        
        acc_x += dx;
        acc_y += dy;

        // Clamp 0 ~ 63
        if (acc_x < 0) acc_x = 0;
        if (acc_x > (63 << 4)) acc_x = (63 << 4);
        if (acc_y < 0) acc_y = 0;
        if (acc_y > (63 << 4)) acc_y = (63 << 4);

        cursor_x = acc_x >> 4;
        cursor_y = acc_y >> 4;

        // --- Clear Screen ---
        uint32_t *ptr = (uint32_t *)frame_buffer;
        for(int i = 0; i < 1024; i++) {
            ptr[i] = 0; 
        }
	
        // --- Draw ---
        // House
        draw_rect(16, 30, 32, 25, C_RED);
        // Door
        draw_rect(32, 40, 10, 15, C_WHITE);
        // Window
        draw_circle(24, 40, 4, C_WHITE);

        // Roof fill
        for(int i = 0; i < 8; i++)
            draw_line(11+i, 29-i, 53-i, 29-i, C_MAGENTA);
        for(int i = 0; i < 10; i++)
            draw_line(21+i, 21-i, 43-i, 21-i, C_MAGENTA);
	draw_pixel(32, 11, C_MAGENTA);
        
        // Roof outline
        draw_line(10, 30, 32, 10, C_WHITE);
        draw_line(54, 30, 32, 10, C_WHITE);
        
        // Draw characters
        draw_char_simple(2, 2, 'H', C_WHITE);
        draw_char_simple(6, 2, 'O', C_WHITE);
        draw_char_simple(10, 2, 'U', C_WHITE);
        draw_char_simple(14, 2, 'S', C_WHITE);
        draw_char_simple(18, 2, 'E', C_WHITE);
	
        // Cursor
        draw_pixel(cursor_x, cursor_y, C_MOUSE);
	
        // --- Heartbeat ---
        heartbeat++;
        if (heartbeat & 0x1)
            draw_pixel(0, 0, C_WHITE);
        else
            draw_pixel(0, 0, C_RED);

        // --- Flush ---
        vga_flush();
        
        delay(5000); 
    }
}
