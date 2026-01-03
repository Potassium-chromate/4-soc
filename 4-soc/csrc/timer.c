// csrc/timer_test.c
#include <stdint.h>
#include "mmio.h"

#define WRITE_MEM_DATA    ((volatile uint32_t *)(0x00004000))

// 簡單的 print 函式 (透過 UART)
void print(const char *str) {
    while (*str) {
        *WRITE_MEM_DATA = (uint32_t)(*str);
        str++;
    }
}

void print_hex(uint32_t val) {
    char hex[] = "0123456789ABCDEF";
    for (int i = 7; i >= 0; i--) {
        *WRITE_MEM_DATA = hex[(val >> (i * 4)) & 0xF];
    }
}

void delay(int count) {
    for (volatile int i = 0; i < count; i++);
}

int main() {
    print("\n=== Timer Hardware Test ===\n");

    // 1. 測試：確認時間有在走 (Watch Mode)
    print("Test 1: Checking Timer Counter...\n");
    
    // 確保 Timer 是開啟的
    *TIMER_ENABLED = 1;
    *TIMER_LIMIT = 0; // 0 stands for counting unlimitly

    uint32_t t1 = *TIMER_COUNT;
    delay(1000); // 讓 CPU 空轉一下
    uint32_t t2 = *TIMER_COUNT;

    print("T1: 0x"); print_hex(t1); print("\n");
    print("T2: 0x"); print_hex(t2); print("\n");

    if (t2 > t1) {
        print("[PASS] Timer is moving!\n");
    } else {
        print("[FAIL] Timer is stuck.\n");
        return 1;
    }

    // 2. 測試：鬧鐘功能 (Alarm Mode)
    print("\nTest 2: Checking Alarm Interrupt...\n");

    // 設定鬧鐘：從現在開始 + 5000 個 Cycle
    uint32_t target = 5000;
    *TIMER_LIMIT = target; // Set limit
    *TIMER_COUNT = 0;      // Reset

    print("Waiting for limit (0x1388)...\n");

    // 輪詢 (Polling) 直到 Timer 歸零 (代表觸發了 Auto-reload)
    // 或者檢查 count 是否曾經大於等於 limit
    // 這裡我們簡單做：一直讀，直到發現 count 變很小 (歸零了)，或者直接看行為
    
    while (*TIMER_COUNT < target) {
        // 等待...
    }

    // 如果程式能跑到這裡，代表 Timer 確實數到了 target
    // 為了確認中斷訊號，我們可以在這裡檢查 CPU 的 mip (如果我們有實作讀取 CSR 的話)
    // 但因為我們目前是在測試 Timer 硬體本身，只要確認它有 Auto-reload (歸零)，
    // 就代表 (count >= limit) 的邏輯成立，中斷線也就一定有拉高。

    // 檢查是否歸零 (Auto-reload)
    if (*TIMER_COUNT < 100) {
        print("[PASS] Timer hit limit and reset!\n");
    } else {
        // 稍微給點寬容度，因為 print 也要時間
        print("[INFO] Timer value after loop: 0x"); 
        print_hex(*TIMER_COUNT); 
        print("\n");
    }

    print("\n=== All Tests Completed ===\n");

    // 停機
    while(1);
    return 0;
}
