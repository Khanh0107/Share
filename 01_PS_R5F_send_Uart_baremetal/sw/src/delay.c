/*
 * delay.c - dung PMCCNTR (Performance Monitor Cycle Counter) cua Cortex-R5,
 * dem tung chu ky clock CPU, truy cap qua coprocessor CP15.
 */
#include "reg.h"
#include "delay.h"

#define PMCR_E      (1u << 0)   /* bat bo dem */
#define PMCR_C      (1u << 2)   /* reset cycle counter */
#define PMCNTEN_C   (1u << 31)  /* bat rieng cycle counter */

void delay_init(void)
{
    uint32_t pmcr;
    __asm__ volatile("mrc p15, 0, %0, c9, c12, 0" : "=r"(pmcr));
    pmcr |= PMCR_E | PMCR_C;
    __asm__ volatile("mcr p15, 0, %0, c9, c12, 0" :: "r"(pmcr));
    __asm__ volatile("mcr p15, 0, %0, c9, c12, 1" :: "r"(PMCNTEN_C));
}

uint32_t cycles_now(void)
{
    uint32_t c;
    __asm__ volatile("mrc p15, 0, %0, c9, c13, 0" : "=r"(c));
    return c;
}

/* Phep tru khong dau van dung khi bo dem 32-bit tran (~8 giay o 533 MHz) */
void delay_us(uint32_t us)
{
    uint32_t start = cycles_now();
    uint32_t ticks = us * (CPU_R5_CLK_HZ / 1000000u);
    while ((uint32_t)(cycles_now() - start) < ticks)
        ;
}

void delay_ms(uint32_t ms)
{
    while (ms--)
        delay_us(1000);
}
