// early_uart_debug.c

#define UART1_BASE 0x30860000
#define UART2_BASE 0x30890000
#define UART3_BASE 0x30880000
#define UART_TXD   0x40
#define UART_STAT  0x98

static void delay(volatile int count) {
    while (count-- > 0);
}

static void uart_putc(unsigned int base, char c) {
    while (!(*(volatile unsigned int *)(base + UART_STAT) & 0x20));
    *(volatile unsigned int *)(base + UART_TXD) = c;
}

static void uart_puts(unsigned int base, const char *s) {
    while (*s)
        uart_putc(base, *s++);
}

void early_uart_debug(void)
{
    for (int i = 0; i < 1000; ++i) {
        uart_puts(UART1_BASE, "UART1\n");
        delay(10000);

        uart_puts(UART2_BASE, "UART2\n");
        delay(10000);

        uart_puts(UART3_BASE, "UART3\n");
        delay(10000);
    }
}
