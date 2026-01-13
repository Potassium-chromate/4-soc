// SPDX-License-Identifier: MIT
// Mouse Cursor Demo for VGA peripheral (4-soc version)
// Stripped down version: No Nyancat, only Mouse cursor.

#include <stdint.h>

// ==========================================
// VGA MMIO register addresses
// ==========================================
#define VGA_BASE 0x20000000u
#define VGA_ID (VGA_BASE + 0x00)
#define VGA_STATUS (VGA_BASE + 0x04)
#define VGA_INTR_STATUS (VGA_BASE + 0x08)
#define VGA_UPLOAD_ADDR (VGA_BASE + 0x10)
#define VGA_STREAM_DATA (VGA_BASE + 0x14)
#define VGA_CTRL (VGA_BASE + 0x20)
#define VGA_PALETTE(n) (VGA_BASE + 0x24 + ((n) << 2))

// ==========================================
// Mouse MMIO
// ==========================================
#define MOUSE_BASE 0x60000000
#define MOUSE_X    (*(volatile uint32_t *)(MOUSE_BASE + 0x00))
#define MOUSE_Y    (*(volatile uint32_t *)(MOUSE_BASE + 0x04))
#define MOUSE_BTN  (*(volatile uint32_t *)(MOUSE_BASE + 0x08))

// ==========================================
// Constants
// ==========================================
#define SCREEN_WIDTH  64
#define SCREEN_HEIGHT 64
#define FRAME_SIZE    (SCREEN_WIDTH * SCREEN_HEIGHT) // 4096 pixels
#define PIXELS_PER_WORD 8 

// Frame buffer (Only need one for single buffering)
static uint8_t frame_buffer[FRAME_SIZE];

// ==========================================
// Helper Functions
// ==========================================

static inline void vga_write32(uint32_t addr, uint32_t val)
{
    *(volatile uint32_t *) addr = val;
}

static inline uint32_t vga_read32(uint32_t addr)
{
    return *(volatile uint32_t *) addr;
}

// Simple delay function
static inline void delay(uint32_t cycles)
{
    for (uint32_t i = 0; i < cycles; i++)
        __asm__ volatile("nop");
}

// Pack 8 4-bit pixels into a 32-bit word
// (Preserved from original code to ensure hardware compatibility)
static inline uint32_t pack8_pixels(const uint8_t *pixels)
{
    return (uint32_t) (pixels[0] & 0xF) | ((uint32_t) (pixels[1] & 0xF) << 4) |
           ((uint32_t) (pixels[2] & 0xF) << 8) |
           ((uint32_t) (pixels[3] & 0xF) << 12) |
           ((uint32_t) (pixels[4] & 0xF) << 16) |
           ((uint32_t) (pixels[5] & 0xF) << 20) |
           ((uint32_t) (pixels[6] & 0xF) << 24) |
           ((uint32_t) (pixels[7] & 0xF) << 28);
}

// Initialize a simple palette
// Index 0: Black (Background)
// Index 1: White (Cursor)
void vga_init_simple_palette(void)
{
    // Palette entry format: 6-bit color (0x3F max)
    vga_write32(VGA_PALETTE(0), 0x00); // Color 0: Black
    vga_write32(VGA_PALETTE(1), 0x3F); // Color 1: White (R=11, G=11, B=11)
    
    // Fill the rest with black just in case
    for (int i = 2; i < 16; i++) {
        vga_write32(VGA_PALETTE(i), 0x00);
    }
}

// Draw a simple cursor
void draw_mouse_cursor(uint8_t *buffer, int mx, int my) {
    // Draw a 3x3 white dot (Color Index 1)
    for (int y = 0; y < 3; y++) {
        for (int x = 0; x < 3; x++) {
            int draw_x = mx + x;
            int draw_y = my + y;

            // Boundary check
            if (draw_x >= 0 && draw_x < SCREEN_WIDTH && 
                draw_y >= 0 && draw_y < SCREEN_HEIGHT) {
                buffer[draw_y * SCREEN_WIDTH + draw_x] = 0x01; 
            }
        }
    }
}

// Clear the entire buffer to background color (Index 0)
void clear_buffer(uint8_t *buffer) {
    for (int i = 0; i < FRAME_SIZE; i++) {
        buffer[i] = 0x02;
    }
}

int cursor_x = 32 << 4;
int cursor_y = 32 << 4;

// ==========================================
// Main Function
// ==========================================
int main(void)
{
    // Verify VGA peripheral presence
    uint32_t id = vga_read32(VGA_ID);
    if (id != 0x56474131) // "VGA1"
        return 1;

    // 1. Initialize Palette
    vga_init_simple_palette();

    // 2. Enable display
    vga_write32(VGA_CTRL, (0 << 4) | 0x01);

    // Dummy Read to eliminate startup jump
    volatile int32_t dummy_x = (int32_t)MOUSE_X;
    volatile int32_t dummy_y = (int32_t)MOUSE_Y;
    (void)dummy_x; (void)dummy_y;


    cursor_x = 32 << 4; 
    cursor_y = 32 << 4;
    
    while (1) {
        // Read mouse displacement
        int32_t dx = (int32_t)MOUSE_X;
        int32_t dy = (int32_t)MOUSE_Y;

        // Update coordinates
        cursor_x += dx;
        cursor_y += dy;

        // Boundary check
        int max_val = (SCREEN_WIDTH - 1) << 4; // Fix boundary to 63 (0-63)
        
        if (cursor_x < 0) cursor_x = 0;
        if (cursor_x > max_val) cursor_x = max_val;
        
        if (cursor_y < 0) cursor_y = 0;
        if (cursor_y > max_val) cursor_y = max_val;

        // Drawing coordinates
        int draw_x = cursor_x >> 4;
        int draw_y = cursor_y >> 4;
        
        // Draw
        for (int i = 0; i < FRAME_SIZE; i++) frame_buffer[i] = 0x00; 

        draw_mouse_cursor(frame_buffer, draw_x, draw_y);

        // Upload
        vga_write32(VGA_UPLOAD_ADDR, (0 << 16) | 0); 
        
        // Copy using uint32_t pointer directly to reduce loop count
        uint32_t *fb_ptr = (uint32_t *)frame_buffer;
        for (int i = 0; i < 512; i++) {
            vga_write32(VGA_STREAM_DATA, pack8_pixels(&frame_buffer[i*8]));
        }
    
        delay(5000); 
    }
}
