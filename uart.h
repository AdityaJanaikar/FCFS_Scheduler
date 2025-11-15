#pragma once
#include <stdarg.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

// Initialize USART1 (PA9 TX, PA10 RX) at the given baud rate.
// PCLK2 must be set to the proper value (default 72 MHz in uart.cpp).
void uart_init();

// Transmit single byte (polling)
void uart_putchar(char c);

// Transmit a NUL-terminated string
void uart_puts(const char* s);

// Transmit string then CRLF
void uart_println(const char* s);

// printf-style logging (max line length limited by internal buffer)
void uart_printf(const char* fmt, ...);

#ifdef __cplusplus
}
#endif
