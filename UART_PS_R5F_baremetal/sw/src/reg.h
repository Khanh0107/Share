/* reg.h - truy cap thanh ghi memory-mapped */
#ifndef REG_H
#define REG_H

#include <stdint.h>

#define REG32(addr)          (*(volatile uint32_t *)(uintptr_t)(addr))
#define reg_write(addr, val) (REG32(addr) = (uint32_t)(val))
#define reg_read(addr)       (REG32(addr))

/* Tan so clock lay tu thiet ke Vivado (create_hw.tcl sinh ra build/hw_config.h).
   Gia tri mac dinh duoi day la cau hinh preset cua KV260. */
#if __has_include("hw_config.h")
#include "hw_config.h"
#endif
#ifndef UART1_REF_CLK_HZ
#define UART1_REF_CLK_HZ  100000000u   /* UART1_REF_CTRL: 100 MHz */
#endif
#ifndef CPU_R5_CLK_HZ
#define CPU_R5_CLK_HZ     533333333u   /* CPU_R5_CTRL: 533.33 MHz */
#endif

#endif
