/* uart.h - driver toi gian cho PS UART (Cadence UART IP) cua ZynqMP */
#ifndef UART_H
#define UART_H

#include <stdint.h>

void uart_init(uint32_t baud);
void uart_putc(char c);
void uart_puts(const char *s);
void uart_printf(const char *fmt, ...);   /* ho tro %c %s %d %u %x %p %% */
void uart_flush(void);

#endif
