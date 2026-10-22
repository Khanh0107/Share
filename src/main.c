/*
 * main.c - Hello World bare-metal tren Cortex-R5F #0 cua KV260.
 * Khong dung BSP: UART va timer duoc lap trinh truc tiep bang thanh ghi.
 */
#include "reg.h"
#include "uart.h"
#include "delay.h"

static uint32_t read_mpidr(void)
{
    uint32_t v;
    __asm__ volatile("mrc p15, 0, %0, c0, c0, 5" : "=r"(v));
    return v;
}

int main(void)
{
    uart_init(115200);
    delay_init();

    uart_puts("\n==============================\n");
    uart_puts(" Hello World from Cortex-R5F\n");
    uart_puts(" Board: Kria KV260 (bare-metal)\n");
    uart_puts("==============================\n");
    uart_printf("MPIDR = %p (core %u)\n", read_mpidr(), read_mpidr() & 0xFF);
    uart_printf("CPU clock  = %u Hz\n", CPU_R5_CLK_HZ);
    uart_printf("UART ref   = %u Hz\n", UART1_REF_CLK_HZ);

    for (uint32_t count = 0;; count++) {
        uart_printf("tick %u\n", count);
        delay_ms(1000);
    }
}
