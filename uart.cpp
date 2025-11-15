// uart.cpp
#include "uart.h"

#define UART0_BASE 0x4000C000
#define UARTDR     (*((volatile unsigned int*)(UART0_BASE + 0x00)))
#define UARTFR     (*((volatile unsigned int*)(UART0_BASE + 0x18)))

void uart_init()
{
    // LM3S default QEMU setup: UART0 already clocked + pins enabled.
}

void uart_putchar(char c)
{
    while (UARTFR & (1 << 5)); // TXFF (TX full)
    UARTDR = c;
}

void uart_print(const char* s)
{
    while (*s)
        uart_putchar(*s++);
}

void uart_println(const char* s)
{
    uart_print(s);
    uart_putchar('\n');
}