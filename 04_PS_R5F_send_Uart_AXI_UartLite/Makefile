# Can source moi truong Xilinx truoc:
#   source /home/bo/AMD/2026.1/Vitis/settings64.sh

.PHONY: hw ide console console-ps clean

# Vivado: Zynq + AXI UART Lite -> bitstream -> XSA
# Lay psu_init.tcl va file bitstream .bit ra khoi XSA de nap bang xsdb
hw: build/kv260_r5_uartlite.xsa
build/kv260_r5_uartlite.xsa: hw/create_hw.tcl hw/pins.xdc
	mkdir -p build
	cd build && vivado -mode batch -nojournal -nolog -source ../hw/create_hw.tcl
	unzip -o build/kv260_r5_uartlite.xsa psu_init.tcl '*.bit' -d build/hw

# Mo Vitis IDE voi workspace vitis/ (tao platform + app, build trong IDE)
ide:
	vitis -w vitis

# CH340 cam vao PMOD. Dung ten co dinh theo chip (1a86 = CH340) vi ttyUSBx doi theo thu tu cam
CH340 ?= /dev/serial/by-id/usb-1a86_USB_Serial-if00-port0
console:
	picocom -b 115200 $(CH340)

# PS UART1 (FTDI tren board): thong bao debug cua R5
console-ps:
	picocom -b 115200 /dev/ttyUSB1

# Chi xoa ket qua Vivado; workspace vitis/ chua code cua ban nen khong xoa
clean:
	rm -rf build .Xil
