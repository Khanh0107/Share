# Build bare-metal cho Cortex-R5F, khong dung Vitis/BSP.
# Toolchain: armr5-none-eabi- (co trong Vitis) hoac arm-none-eabi- (apt / ARM GNU Toolchain).

CROSS ?= $(if $(shell which armr5-none-eabi-gcc 2>/dev/null),armr5-none-eabi-,arm-none-eabi-)
CC      := $(CROSS)gcc
OBJCOPY := $(CROSS)objcopy
OBJDUMP := $(CROSS)objdump
SIZE    := $(CROSS)size

TARGET  := hello_r5
BUILD   := build
SRCS    := src/startup.S src/main.c src/uart.c src/delay.c
OBJS    := $(patsubst src/%,$(BUILD)/%.o,$(SRCS))

CPUFLAGS := -mcpu=cortex-r5 -marm -mfpu=vfpv3-d16 -mfloat-abi=hard
CFLAGS   := $(CPUFLAGS) -O2 -g -Wall -Wextra -std=c11 \
            -ffreestanding -fno-builtin -ffunction-sections -fdata-sections \
            -Isrc -I../build
ASFLAGS  := $(CPUFLAGS) -g
LDFLAGS  := $(CPUFLAGS) -nostdlib -nostartfiles -T linker.ld \
            -Wl,--gc-sections -Wl,--build-id=none -Wl,-Map=$(BUILD)/$(TARGET).map
LDLIBS   := -lgcc

.PHONY: all clean disasm

all: $(BUILD)/$(TARGET).elf
	@$(SIZE) $<

$(BUILD)/$(TARGET).elf: $(OBJS) linker.ld
	$(CC) $(LDFLAGS) $(OBJS) $(LDLIBS) -o $@

$(BUILD)/%.S.o: src/%.S | $(BUILD)
	$(CC) $(ASFLAGS) -c $< -o $@

$(BUILD)/%.c.o: src/%.c src/*.h | $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD):
	mkdir -p $@

# Xem ma may da sinh ra: make disasm
disasm: $(BUILD)/$(TARGET).elf
	$(OBJDUMP) -d $< > $(BUILD)/$(TARGET).lst
	@echo "Da ghi $(BUILD)/$(TARGET).lst"

clean:
	rm -rf $(BUILD)
