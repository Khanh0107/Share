# Chan PMOD J2 tren carrier KV260 (bank HD 3.3V).
#
#   PMOD J2          FPGA   Tin hieu trong thiet ke
#   pin 1  (HDA11)   H12    pl_hello_tx     <- hello_pl.v tu gui "Hello World" -> RXD cua CH340
#   pin 9, 10                GND            -> GND cua CH340
#   pin 11, 12               3.3V           (KHONG noi vao CH340)

set_property PACKAGE_PIN H12      [get_ports pl_hello_tx]
set_property IOSTANDARD  LVCMOS33 [get_ports pl_hello_tx]
