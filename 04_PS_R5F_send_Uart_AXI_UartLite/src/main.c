/*
 * main.c - R5F #0 gui "Hello World" ra IP AXI UART Lite trong PL.
 *
 *   R5F --AXI (M_AXI_HPM0_LPD)--> AXI UART Lite (0x80000000) --tx--> PMOD J2 chan 1 -> CH340
 *
 * Ky tu go tu picocom cua CH340 (TXD -> PMOD J2 chan 3) duoc gui nguoc lai (echo).
 * PS UART1 (/dev/ttyUSB1) chi in vai dong de biet R5 da chay toi dau.
 */
#include "xparameters.h"
#include "xuartlite.h"
#include "xil_printf.h"
#include "xiltimer.h"

static XUartLite uart_lite;

/* Gui chuoi ra AXI UART Lite. XUartLite_Send chi day vao FIFO 16 byte nen phai lap. */
static void uartlite_puts(const char *s)
{
    u32 len = 0;
    while (s[len])
        len++;

    u32 sent = 0;
    while (sent < len)
        sent += XUartLite_Send(&uart_lite, (u8 *)s + sent, len - sent);
}

/* Doi so u32 sang chuoi thap phan (khong dung sprintf cho gon) */
static void uartlite_put_u32(u32 v)
{
    char buf[11];
    int n = 0;

    do {
        buf[n++] = (char)('0' + v % 10);
        v /= 10;
    } while (v);

    char out[11];
    for (int i = 0; i < n; i++)
        out[i] = buf[n - 1 - i];
    out[n] = '\0';
    uartlite_puts(out);
}

int main(void)
{
    xil_printf("\r\n[R5] Khoi tao AXI UART Lite tai 0x%08x\r\n", XPAR_XUARTLITE_0_BASEADDR);

    /* Flow SDT: Initialize nhan dia chi base. Baud 115200 co dinh trong phan cung. */
    if (XUartLite_Initialize(&uart_lite, XPAR_XUARTLITE_0_BASEADDR) != XST_SUCCESS) {
        xil_printf("[R5] Loi: khong khoi tao duoc AXI UART Lite\r\n");
        return XST_FAILURE;
    }
    xil_printf("[R5] OK, dang gui ra PMOD J2 chan 1\r\n");

    uartlite_puts("\r\n==============================\r\n");
    uartlite_puts(" Hello World from R5F\r\n");
    uartlite_puts(" via AXI UART Lite (PL)\r\n");
    uartlite_puts("==============================\r\n");

    XTime t_last, t_now;
    XTime_GetTime(&t_last);

    for (u32 count = 0;;) {
        /* Echo: ky tu nao nhan duoc thi gui lai */
        u8 c;
        if (XUartLite_Recv(&uart_lite, &c, 1) == 1)
            XUartLite_Send(&uart_lite, &c, 1);

        /* Moi giay gui 1 dong. TTC dem 32 bit nen tru kieu u32 (dung ca khi tran). */
        XTime_GetTime(&t_now);
        if ((u32)t_now - (u32)t_last >= COUNTS_PER_SECOND) {
            t_last = t_now;
            uartlite_puts("Hello World from R5F (AXI UART Lite) #");
            uartlite_put_u32(count++);
            uartlite_puts("\r\n");
        }
    }
}
