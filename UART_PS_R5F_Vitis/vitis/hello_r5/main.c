/*
 * main.c - Hello World tren Cortex-R5F #0 cua KV260, dung BSP standalone cua Vitis.
 *
 * So voi ban UART_PS_R5F (tu viet bang thanh ghi):
 *   startup.S, linker.ld   -> boot.S + lscript.ld cua BSP (Vitis tu sinh)
 *   uart.c (CR/MR/CD/BDIV) -> driver XUartPs (xuartps.h)
 *   uart_printf            -> xil_printf (xil_printf.h)
 *   delay.c (PMCCNTR)      -> sleep/usleep (sleep.h), XTime_GetTime (xiltimer.h)
 *                             (thu vien xiltimer dung TTC3 @ 0xFF140000 lam dong ho)
 *   hw_config.h            -> xparameters.h (Vitis sinh tu XSA)
 */
#include "xparameters.h"
#include "xuartps.h"
#include "xil_printf.h"
#include "xiltimer.h"
#include "sleep.h"
#include "xpseudo_asm.h"

static XUartPs uart;

static int uart_init(u32 baud)
{
    XUartPs_Config *cfg;
    int status;

    /*
     * Tim thong so UART (dia chi, clock) trong bang cau hinh sinh tu XSA.
     * XSA chi bat UART1 nen no la instance duy nhat: XPAR_XUARTPS_0 = 0xFF010000.
     * (Flow SDT tu 2023.2: LookupConfig nhan dia chi base, khong nhan DeviceId.)
     */
    cfg = XUartPs_LookupConfig(XPAR_XUARTPS_0_BASEADDR);
    if (cfg == NULL)
        return XST_FAILURE;

    status = XUartPs_CfgInitialize(&uart, cfg, cfg->BaseAddress);
    if (status != XST_SUCCESS)
        return status;

    /* Driver tu tinh CD/BDIV tu cfg->InputClockHz, 8N1 la mac dinh */
    return XUartPs_SetBaudRate(&uart, baud);
}

/* Gui chuoi bang API cua driver (khong qua xil_printf) */
static void uart_send_str(const char *s)
{
    u32 len = 0;
    while (s[len])
        len++;

    u32 sent = 0;
    while (sent < len)
        sent += XUartPs_Send(&uart, (u8 *)s + sent, len - sent);
}

int main(void)
{
    if (uart_init(115200) != XST_SUCCESS)
        return XST_FAILURE;

    uart_send_str("\r\n==============================\r\n");
    uart_send_str(" Hello World from Cortex-R5F\r\n");
    uart_send_str(" Board: Kria KV260 (Vitis BSP)\r\n");
    uart_send_str("==============================\r\n");

    u32 mpidr = mfcp(XREG_CP15_MULTI_PROC_AFFINITY);
    xil_printf("MPIDR = 0x%08x (core %d)\r\n", mpidr, mpidr & 0xFF);
    xil_printf("CPU clock  = %d Hz\r\n", XPAR_CPU_CORE_CLOCK_FREQ_HZ);
    xil_printf("UART ref   = %d Hz\r\n", uart.Config.InputClockHz);
    xil_printf("Baud       = %d\r\n", uart.BaudRate);

    /*
     * XTime la u64 nhung TTC chi dem 32 bit (100 MHz -> tran sau ~43 s),
     * nen cong don tung khoang bang phep tru u32 (van dung khi tran).
     */
    XTime t;
    u32 prev, now, elapsed_ms = 0;
    XTime_GetTime(&t);
    prev = (u32)t;
    for (u32 count = 0;; count++) {
        XTime_GetTime(&t);
        now = (u32)t;
        elapsed_ms += (now - prev) / (COUNTS_PER_SECOND / 1000);
        prev = now;
        xil_printf("tick %d  (t = %d ms)\r\n", count, elapsed_ms);
        sleep(1);
    }
}
