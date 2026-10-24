/*
 * uart.c - dieu khien PS UART1 bang thanh ghi (khong dung BSP).
 * Tai lieu: UG1087 (ZynqMP Register Reference), module UART.
 *
 * UART1 noi ra MIO 36/37 -> chip FTDI -> /dev/ttyUSB1 tren PC.
 * Clock UART1_REF va pin mux MIO da duoc psu_init cau hinh;
 * file nay chi lap trinh bo dieu khien UART.
 */
#include <stdarg.h>
#include "reg.h"
#include "uart.h"

#define UART1_BASE      0xFF010000u

/* Offset thanh ghi */
#define UART_CR         0x00    /* Control */
#define UART_MR         0x04    /* Mode */
#define UART_IDR        0x0C    /* Interrupt disable */
#define UART_ISR        0x14    /* Interrupt status (ghi 1 de xoa) */
#define UART_BAUDGEN    0x18    /* Baud rate generator: CD */
#define UART_RXTOUT     0x1C    /* Receiver timeout */
#define UART_SR         0x2C    /* Channel status */
#define UART_FIFO       0x30    /* TX/RX FIFO */
#define UART_BAUDDIV    0x34    /* Baud rate divider: BDIV */

/* Control register bits */
#define CR_RXRST        (1u << 0)
#define CR_TXRST        (1u << 1)
#define CR_RXEN         (1u << 2)
#define CR_RXDIS        (1u << 3)
#define CR_TXEN         (1u << 4)
#define CR_TXDIS        (1u << 5)
#define CR_STOPBRK      (1u << 8)

/* Mode register: 8 bit data, khong parity, 1 stop bit, che do normal */
#define MR_CHRL_8BIT    (0u << 1)
#define MR_PAR_NONE     (4u << 3)
#define MR_NBSTOP_1     (0u << 6)
#define MR_CHMODE_NORM  (0u << 8)

/* Status register bits */
#define SR_TXEMPTY      (1u << 3)
#define SR_TXFULL       (1u << 4)

#define UART(off)       (UART1_BASE + (off))

/*
 * baud = ref_clk / (CD * (BDIV + 1))
 * Thu moi BDIV hop le (4..254), chon cap (CD, BDIV) co sai so nho nhat.
 */
static void uart_set_baud(uint32_t ref_clk, uint32_t baud)
{
    uint32_t best_cd = 0, best_bdiv = 4, best_err = 0xFFFFFFFFu;

    for (uint32_t bdiv = 4; bdiv < 255; bdiv++) {
        uint32_t div = baud * (bdiv + 1);
        uint32_t cd = (ref_clk + div / 2) / div;    /* lam tron */
        if (cd < 2 || cd > 65535)
            continue;
        uint32_t actual = ref_clk / (cd * (bdiv + 1));
        uint32_t err = actual > baud ? actual - baud : baud - actual;
        if (err < best_err) {
            best_err = err;
            best_cd = cd;
            best_bdiv = bdiv;
        }
    }

    reg_write(UART(UART_BAUDGEN), best_cd);
    reg_write(UART(UART_BAUDDIV), best_bdiv);
}

void uart_init(uint32_t baud)
{
    /* 1. Tat TX/RX truoc khi doi cau hinh */
    reg_write(UART(UART_CR), CR_TXDIS | CR_RXDIS);

    /* 2. Tat moi ngat, xoa co ngat cu */
    reg_write(UART(UART_IDR), 0x3FFF);
    reg_write(UART(UART_ISR), 0x3FFF);

    /* 3. Khung du lieu 8N1 */
    reg_write(UART(UART_MR), MR_CHMODE_NORM | MR_NBSTOP_1 | MR_PAR_NONE | MR_CHRL_8BIT);

    /* 4. Toc do baud */
    uart_set_baud(UART1_REF_CLK_HZ, baud);
    reg_write(UART(UART_RXTOUT), 0);

    /* 5. Reset TX/RX FIFO, cho phan cung tu xoa bit reset */
    reg_write(UART(UART_CR), CR_TXRST | CR_RXRST);
    while (reg_read(UART(UART_CR)) & (CR_TXRST | CR_RXRST))
        ;

    /* 6. Bat TX/RX */
    reg_write(UART(UART_CR), CR_TXEN | CR_RXEN | CR_STOPBRK);
}

void uart_putc(char c)
{
    if (c == '\n')
        uart_putc('\r');
    while (reg_read(UART(UART_SR)) & SR_TXFULL)   /* cho FIFO con cho */
        ;
    reg_write(UART(UART_FIFO), (uint8_t)c);
}

void uart_puts(const char *s)
{
    while (*s)
        uart_putc(*s++);
}

void uart_flush(void)
{
    while (!(reg_read(UART(UART_SR)) & SR_TXEMPTY))
        ;
}

static void put_uint(uint32_t v, uint32_t base, int width, char pad)
{
    char buf[11];
    int n = 0;

    do {
        uint32_t d = v % base;
        buf[n++] = (char)(d < 10 ? '0' + d : 'a' + d - 10);
        v /= base;
    } while (v);

    while (width-- > n)
        uart_putc(pad);
    while (n--)
        uart_putc(buf[n]);
}

void uart_printf(const char *fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);

    for (; *fmt; fmt++) {
        if (*fmt != '%') {
            uart_putc(*fmt);
            continue;
        }
        fmt++;

        /* do rong toi thieu, vd %08x */
        char pad = ' ';
        int width = 0;
        if (*fmt == '0') {
            pad = '0';
            fmt++;
        }
        while (*fmt >= '0' && *fmt <= '9')
            width = width * 10 + (*fmt++ - '0');

        switch (*fmt) {
        case 'c':
            uart_putc((char)va_arg(ap, int));
            break;
        case 's': {
            const char *s = va_arg(ap, const char *);
            uart_puts(s ? s : "(null)");
            break;
        }
        case 'd': {
            int32_t v = va_arg(ap, int32_t);
            if (v < 0) {
                uart_putc('-');
                put_uint((uint32_t)-v, 10, width ? width - 1 : 0, pad);
            } else {
                put_uint((uint32_t)v, 10, width, pad);
            }
            break;
        }
        case 'u':
            put_uint(va_arg(ap, uint32_t), 10, width, pad);
            break;
        case 'x':
            put_uint(va_arg(ap, uint32_t), 16, width, pad);
            break;
        case 'p':
            uart_puts("0x");
            put_uint(va_arg(ap, uint32_t), 16, 8, '0');
            break;
        case '%':
            uart_putc('%');
            break;
        case '\0':
            fmt--;
            break;
        default:
            uart_putc('%');
            uart_putc(*fmt);
            break;
        }
    }

    va_end(ap);
}
