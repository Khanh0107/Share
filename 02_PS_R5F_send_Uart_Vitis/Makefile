# Can source moi truong Xilinx truoc:
#   source /home/bo/AMD/2026.1/Vitis/settings64.sh

.PHONY: hw ide console clean

# Vivado: thiet ke PS -> XSA (chua psu_init.tcl)
hw: build/kv260_ps.xsa
build/kv260_ps.xsa: hw/create_hw.tcl
	mkdir -p build
	cd build && vivado -mode batch -nojournal -nolog -source ../hw/create_hw.tcl
	unzip -o build/kv260_ps.xsa psu_init.tcl -d build/hw

# Mo Vitis IDE voi workspace vitis/ (tao platform + app, build trong IDE)
ide:
	vitis -w vitis

console:
	picocom -b 115200 /dev/ttyUSB1

# Chi xoa ket qua Vivado; workspace vitis/ chua code cua ban nen khong xoa
clean:
	rm -rf build .Xil
