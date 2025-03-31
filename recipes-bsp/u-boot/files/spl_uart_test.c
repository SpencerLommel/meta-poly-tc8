// spl_uart_test.c
#include <common.h>

#define UART2_BASE 0x30890000
#define UART_TXD   0x40
#define UART_STAT  0x98

static void delay(volatile int count) {
    while (count-- > 0);
}

static void uart_putc(char c) {
    volatile unsigned int *stat = (unsigned int *)(UART2_BASE + UART_STAT);
    volatile unsigned int *txd = (unsigned int *)(UART2_BASE + UART_TXD);
    while (!(*stat & 0x20));
    *txd = c;
}

static void uart_puts(const char *s) {
    while (*s)
        uart_putc(*s++);
}

// Hook into SPL init
void test_uart_spl(ulong dummy) {
    uart_puts("SPL UART TEST\n");
    while (1) delay(100000); // stay alive for visibility
}
