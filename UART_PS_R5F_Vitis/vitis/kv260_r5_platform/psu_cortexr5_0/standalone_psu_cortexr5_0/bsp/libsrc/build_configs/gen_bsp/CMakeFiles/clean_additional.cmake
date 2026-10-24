# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "/home/bo/linux/KV260/UART_PS_R5F_Vitis/vitis/kv260_r5_platform/psu_cortexr5_0/standalone_psu_cortexr5_0/bsp/include/sleep.h"
  "/home/bo/linux/KV260/UART_PS_R5F_Vitis/vitis/kv260_r5_platform/psu_cortexr5_0/standalone_psu_cortexr5_0/bsp/include/xiltimer.h"
  "/home/bo/linux/KV260/UART_PS_R5F_Vitis/vitis/kv260_r5_platform/psu_cortexr5_0/standalone_psu_cortexr5_0/bsp/include/xtimer_config.h"
  "/home/bo/linux/KV260/UART_PS_R5F_Vitis/vitis/kv260_r5_platform/psu_cortexr5_0/standalone_psu_cortexr5_0/bsp/lib/libxiltimer.a"
  )
endif()
