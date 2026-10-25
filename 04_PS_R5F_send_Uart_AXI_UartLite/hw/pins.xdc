# Chan PMOD J2 tren carrier KV260 (bank HD 3.3V).
#
#   PMOD J2          FPGA   Tin hieu trong thiet ke
#   pin 1  (HDA11)   H12    uartlite_tx   <- AXI UART Lite gui -> RXD cua CH340
#   pin 3  (HDA12)   E10    uartlite_rx   -> AXI UART Lite nhan (TXD cua CH340, muc 3.3V)
#   pin 9, 10                GND          -> GND cua CH340
#   pin 11, 12               3.3V         (KHONG noi vao CH340)

set_property PACKAGE_PIN H12 [get_ports uartlite_tx]
set_property PACKAGE_PIN E10 [get_ports uartlite_rx]
set_property IOSTANDARD LVCMOS33 [get_ports {uartlite_tx uartlite_rx}]

# RX de ho thi giu muc 1 (UART nghi), tranh nhan rac
set_property PULLUP true [get_ports uartlite_rx]
