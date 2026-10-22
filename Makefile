# Can source moi truong Xilinx truoc, vi du:
#   source /home/bo/AMD/2026.1/Vivado/settings64.sh

.PHONY: all hw sw console clean

all: hw sw

# Vivado: thiet ke PS -> XSA (chua psu_init.tcl) + build/hw_config.h
hw: build/kv260_ps.xsa
build/kv260_ps.xsa: hw/create_hw.tcl
	mkdir -p build
	cd build && vivado -mode batch -nojournal -nolog -source ../hw/create_hw.tcl
	unzip -o build/kv260_ps.xsa psu_init.tcl -d build/hw

# Bare-metal R5F: startup.S + linker.ld + driver thanh ghi -> sw/build/hello_r5.elf
sw:
	$(MAKE) -C sw

console:
	minicom -D /dev/ttyUSB1 -b 115200

clean:
	rm -rf build .Xil
	$(MAKE) -C sw clean
