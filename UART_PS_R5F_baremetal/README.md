# KV260 – Hello World bare-metal tren Cortex-R5F (khong Vitis, khong BSP)

```
hw/create_hw.tcl     Vivado: PS only (preset KV260, UART1 MIO36/37) -> build/kv260_ps.xsa
                     + build/hw/psu_init.tcl (khoi tao clock/DDR/MIO) + build/hw_config.h (tan so clock)
sw/linker.ld         Ban do bo nho: code o ATCM (0x0), data/bss/stack o BTCM (0x20000)
sw/src/startup.S     Vector table, tat MPU/cache, bat VFP, xoa BTCM, stack cac mode, copy .data, goi main
sw/src/uart.c        Driver UART1 (0xFF010000) bang thanh ghi: 8N1, tinh baud CD/BDIV, printf mini
sw/src/delay.c       Delay bang PMU cycle counter (CP15) cua R5
sw/src/main.c        In Hello World + "tick N" moi giay
sw/Makefile          Build bang armr5-none-eabi-gcc (Vitis) hoac arm-none-eabi-gcc
```

## Yeu cau
- Vivado 2026.1 (hoac 2023.2+), cable driver JTAG:
  `sudo /home/bo/AMD/2026.1/data/xicom/cable_drivers/lin64/install_script/install_drivers/install_drivers`
- Board: nguon 12V, cap micro-USB J4. Khong can the SD.

## Build
```bash
source /home/bo/AMD/2026.1/Vivado/settings64.sh   # sua theo duong dan cai dat
make hw        # Vivado -> XSA, psu_init.tcl, hw_config.h
make sw        # -> sw/build/hello_r5.elf (+ .map); "make -C sw disasm" de xem ma may
make console   # xem UART (/dev/ttyUSB1, 115200)
```

## Nap bang xsct / xsdb
```tcl
connect
targets
targets -set -filter {name =~ "PSU"}
mwr 0xff5e0200 0x0100        ;# boot mode = JTAG
rst -system
after 2000
targets -set -filter {name =~ "APU*"}
source build/hw/psu_init.tcl
psu_init
psu_ps_pl_isolation_removal
psu_ps_pl_reset_config
# Khong co PMU firmware -> tu yeu cau PMU ROM bat nguon RPU (bit 10) + TCM (bit 12-15)
targets -set -filter {name =~ "PSU"}
mwr 0xffd80118 0x0000F400    ;# PMU_GLOBAL.REQ_PWRUP_INT_EN
mwr 0xffd80120 0x0000F400    ;# PMU_GLOBAL.REQ_PWRUP_TRIG
after 500
mrd 0xffd80100               ;# PWR_STATE: bit 10-15 phai = 1
targets -set -filter {name =~ "*R5*#0"}
rst -processor
dow sw/build/hello_r5.elf
con
```
