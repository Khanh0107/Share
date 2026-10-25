# Can source moi truong Xilinx truoc:
#   source /home/bo/AMD/2026.1/Vitis/settings64.sh

.PHONY: hw console clean

# Vivado: Zynq (clock/reset) + hello_pl.v -> bitstream -> XSA
# Lay psu_init.tcl va file bitstream .bit ra khoi XSA de nap bang xsdb
hw: build/kv260_pl_uart.xsa
build/kv260_pl_uart.xsa: hw/create_hw.tcl hw/hello_pl.v hw/pins.xdc
	mkdir -p build
	cd build && vivado -mode batch -nojournal -nolog -source ../hw/create_hw.tcl
	unzip -o build/kv260_pl_uart.xsa psu_init.tcl '*.bit' -d build/hw

# CH340 cam vao PMOD. Dung ten co dinh theo chip (1a86 = CH340) vi ttyUSBx doi theo thu tu cam
# (vd. ttyUSB4, hoac ttyUSB0 khi hw_server dang chiem kenh JTAG cua FTDI)
CH340 ?= /dev/serial/by-id/usb-1a86_USB_Serial-if00-port0
console:
	picocom -b 115200 $(CH340)

clean:
	rm -rf build .Xil
