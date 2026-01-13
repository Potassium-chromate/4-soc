#include <stdint.h>

// ============================================================================
// 32-bit Integer Multiply (__mulsi3)
// ============================================================================
long __mulsi3(long a, long b) {
    long res = 0;
    while (b) {
        if (b & 1) res += a;
        a <<= 1;
        b >>= 1; // Note: Assumes unsigned logic or positive numbers. 
                 // A full implementation would handle sign bits explicitly.
    }
    return res;
}

// ============================================================================
// 32-bit Unsigned Integer Division (__udivsi3)
// ============================================================================
long __udivsi3(unsigned long num, unsigned long den) {
    if (den == 0) return 0; // Prevent division by zero
    unsigned long res = 0;
    for (int i = 31; i >= 0; i--) {
        if ((num >> i) >= den) {
            res |= (1 << i);
            num -= (den << i);
        }
    }
    return res;
}

// ============================================================================
// 32-bit Signed Integer Division (__divsi3)
// ============================================================================
long __divsi3(long num, long den) {
    // 1. Determine the sign of the result
    // If (num < 0) XOR (den < 0) is true, the result is negative.
    int negative = (num < 0) ^ (den < 0);

    // 2. Convert to absolute values (cast to unsigned to handle INT_MIN safely)
    unsigned long u_num = (num < 0) ? -(unsigned long)num : (unsigned long)num;
    unsigned long u_den = (den < 0) ? -(unsigned long)den : (unsigned long)den;

    // 3. Perform unsigned division using your existing function
    unsigned long u_res = __udivsi3(u_num, u_den);

    // 4. Apply the sign and return
    return negative ? -(long)u_res : (long)u_res;
}

// ============================================================================
// 32-bit Signed Integer Modulo (__modsi3) - [NEW]
// Required for operations like: int x = y % 600;
// ============================================================================
long __modsi3(long a, long b) {
    int neg = 0;
    // 1. Handle signs: result of modulo usually takes the sign of the dividend (a)
    if (a < 0) { a = -a; neg = 1; }
    if (b < 0) { b = -b; }

    unsigned long num = (unsigned long)a;
    unsigned long den = (unsigned long)b;

    if (den == 0) return 0;

    // 2. Perform Modulo (Remainder) calculation
    for (int i = 31; i >= 0; i--) {
        if ((num >> i) >= den) {
            num -= (den << i);
            // We don't need to store the quotient bit here, just reduce 'num'
        }
    }
    
    // 3. Restore sign
    return neg ? -(long)num : (long)num;
}

// ============================================================================
// 32-bit Unsigned Integer Modulo (__umodsi3) - [Optional but Recommended]
// Required for operations like: unsigned int x = y % 600;
// ============================================================================
unsigned long __umodsi3(unsigned long num, unsigned long den) {
    if (den == 0) return 0;
    for (int i = 31; i >= 0; i--) {
        if ((num >> i) >= den) {
            num -= (den << i);
        }
    }
    return num;
}

// ============================================================================
// 64-bit Integer Multiply (__muldi3)
// Required for fenster_sleep (long long operations)
// ============================================================================
long long __muldi3(long long a, long long b) {
    long long res = 0;
    while (b) {
        if (b & 1) res += a;
        a <<= 1;
        b >>= 1; // Simplified version
    }
    return res;
}
