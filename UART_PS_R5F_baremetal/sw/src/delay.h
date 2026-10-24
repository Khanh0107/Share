/* delay.h - tre thoi gian bang bo dem chu ky (PMU cycle counter) cua Cortex-R5 */
#ifndef DELAY_H
#define DELAY_H

#include <stdint.h>

void     delay_init(void);
uint32_t cycles_now(void);
void     delay_us(uint32_t us);
void     delay_ms(uint32_t ms);

#endif
