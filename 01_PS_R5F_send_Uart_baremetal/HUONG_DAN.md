# KV260 – Hello World bare-metal trên Cortex-R5F

Tài liệu tổng hợp toàn bộ quá trình: kết nối board, cài công cụ, cấu trúc project, build, nạp bằng JTAG (xsdb), các lỗi đã gặp và cách sửa.

Kết quả cuối cùng trên UART (`/dev/ttyUSB1`, 115200 8N1):

```
==============================
 Hello World from Cortex-R5F
 Board: Kria KV260 (bare-metal)
==============================
MPIDR = 0xc0000100 (core 0)
CPU clock  = 533328003 Hz
UART ref   = 99999001 Hz
tick 0
tick 1
...
```

---

## Mục lục

1. [Tổng quan](#1-tổng-quan)
2. [Kết nối board với máy tính](#2-kết-nối-board-với-máy-tính)
3. [Cài đặt công cụ](#3-cài-đặt-công-cụ)
4. [Cấu trúc project và công dụng từng file](#4-cấu-trúc-project-và-công-dụng-từng-file)
5. [Build](#5-build)
6. [Nạp và chạy bằng xsdb](#6-nạp-và-chạy-bằng-xsdb)
7. [Bản đồ bộ nhớ và luồng khởi động](#7-bản-đồ-bộ-nhớ-và-luồng-khởi-động)
8. [Các lỗi đã gặp và cách sửa](#8-các-lỗi-đã-gặp-và-cách-sửa)
9. [Các thanh ghi quan trọng](#9-các-thanh-ghi-quan-trọng)
10. [Terminal serial: minicom và picocom](#10-terminal-serial-minicom-và-picocom)
11. [Lệnh debug xsdb hay dùng](#11-lệnh-debug-xsdb-hay-dùng)
12. [Bước tiếp theo](#12-bước-tiếp-theo)

---

## 1. Tổng quan

**Mục tiêu:** chạy chương trình trên lõi **Cortex-R5F #0** (RPU) của chip Zynq UltraScale+ trên KV260, in chữ ra **PS UART1**, chỉ dùng phần PS (không dùng PL/FPGA).

**Cách tiếp cận "từ gốc":**

| Thành phần | Dùng gì | Không dùng |
|---|---|---|
| Phần cứng PS | Vivado tạo block design, xuất XSA + `psu_init.tcl` | – |
| Phần mềm | Tự viết `startup.S`, `linker.ld`, driver UART bằng thanh ghi | Vitis IDE, BSP, `xil_printf` |
| Compiler | `armr5-none-eabi-gcc` (đi kèm Vitis) + Makefile thuần | – |
| Nạp / debug | `xsdb` gõ tay qua JTAG | Script chạy tự động |
| Thẻ SD | Không cần | – |

**Ai làm gì:**

- `psu_init` (sinh từ Vivado): cấu hình PLL, clock, DDR, pin MIO, nhả reset ngoại vi.
- Code của mình: vector table, stack, khởi tạo bộ nhớ, lập trình bộ điều khiển UART, đếm thời gian.

---

## 2. Kết nối board với máy tính

### Dây cần cắm

| Cổng trên KV260 | Dùng để | Ghi chú |
|---|---|---|
| Jack nguồn 12V/3A | Cấp nguồn | Bộ adapter đi kèm starter kit |
| **micro-USB J4** | UART + JTAG | Chip FTDI FT4232H, tạo ra 4 cổng `/dev/ttyUSB0..3` |
| RJ45 Ethernet | Mạng (SSH khi chạy Linux) | Không cần cho bài bare-metal |

### Các cổng ttyUSB

Chip FT4232H có 4 kênh. Trên KV260:

- **`/dev/ttyUSB1`** = PS UART1 (MIO 36/37), là console mà bài này dùng.
- Một kênh khác được dùng cho JTAG. `hw_server` truy cập kênh này trực tiếp qua `/dev/bus/usb/...`, không qua ttyUSB.

### Máy ảo VMware

Máy Ubuntu đang chạy trong **VMware** (địa chỉ MAC bắt đầu bằng `00:0c:29`). Vì vậy:

- Khi cắm board, phải gắn thiết bị USB vào VM: **VM → Removable Devices → Future Technology Devices → Connect**.
- Sau khi máy reset, thường phải kết nối lại USB theo cách trên.
- License Vivado gắn với MAC `00:0C:29:65:88:85`. Nên đặt **MAC cố định** trong *VM Settings → Network Adapter → Advanced*, để license không mất hiệu lực khi copy hoặc di chuyển VM.

Kiểm tra board đã vào VM chưa:

```bash
lsusb | grep 0403           # FT4232H: 0403:6011
ls /dev/ttyUSB*             # phải có ttyUSB0..3
```

---

## 3. Cài đặt công cụ

### 3.1 Tải bộ cài

- Tải từ trang download của AMD, chọn **bản 2026.1**, file **`FPGAs_AdaptiveSoCs_Unified_SDI_2026.1_..._Lin64.bin`** (khoảng 413 MB, là web installer).
- Các file `.digests`, `.sig` và `xilinx-master-signing-key.asc` **không phải bộ cài**, chúng chỉ dùng để kiểm tra file.
- Kiểm tra file tải về không bị lỗi:

```bash
sha256sum FPGAs_AdaptiveSoCs_Unified_SDI_2026.1_*_Lin64.bin    # so với dòng SHA256 trong .digests
gpg --import xilinx-master-signing-key.asc
gpg --verify *.bin.sig FPGAs_AdaptiveSoCs_Unified_SDI_2026.1_*_Lin64.bin   # "Good signature from Xilinx"
```

- Nếu trang tải báo `Internal Server Error ... edgesuite.net`, đó là lỗi CDN của AMD. Hãy thử lại sau, dùng cửa sổ ẩn danh, tắt VPN, hoặc điền đầy đủ form xuất khẩu.

### 3.2 Lựa chọn trong bộ cài

| Màn hình | Chọn |
|---|---|
| Select Product | **Vitis** (gói này có cả Vivado) |
| Design Tools | Vitis, Vivado, Vitis HLS (bắt buộc), bỏ DocNav |
| Devices | ☑ **Install Devices for Kria SOMs and Starter Kits**, ☑ **SoCs → Zynq UltraScale+ MPSoCs**, bỏ hết các mục khác |
| Cable Drivers | Bị mờ trên Linux, sẽ cài tay sau |
| Thư mục cài | Bộ cài chạy bằng user thường nên đã cài vào **`/home/bo/AMD/2026.1`** |

Bản cài cần khoảng **137 GB**. Ổ đĩa lúc đầu không đủ chỗ nên đã dọn `~/linux/yocto/build/tmp` (121 GB). Trước khi dọn, image Raspberry Pi đã được sao lưu sang `~/yocto-images/`.

### 3.3 License (bắt buộc từ bản 2026.1)

Nếu không có license, `vivado` báo: `a valid license was not found`.

1. Vào **AMD Product Licensing** → *Create New Licenses*, tích:
   - **Vivado Basic Tier License, Node Locked License** (miễn phí, hỗ trợ chip `xck26`)
   - **Vitis HLS License** (miễn phí)
2. *Generate Node-Locked License*:
   - Host Name: `bo`
   - Operating System: Linux 64-bit
   - Host ID Type: **Ethernet MAC**
   - Host ID Value: **`000C29658885`** (MAC của `ens33`, xem bằng `cat /sys/class/net/ens33/address`)
3. Tải file `Xilinx.lic` và đặt vào thư mục mặc định:

```bash
mkdir -p ~/.Xilinx && mv Xilinx.lic ~/.Xilinx/
```

License hiện có: Vivado Basic (Synthesis, Implementation, Simulation) dùng đến **22/10/2027**, Vitis HLS vĩnh viễn.

### 3.4 Các bước cần sudo sau khi cài

```bash
# Driver JTAG: cài udev rules để user thường truy cập được chip FTDI
cd /home/bo/AMD/2026.1/data/xicom/cable_drivers/lin64/install_script/install_drivers
sudo ./install_drivers
# -> tạo /etc/udev/rules.d/52-xilinx-ftdi-usb.rules
# Sau đó PHẢI ngắt và kết nối lại USB (hoặc chạy: sudo udevadm control --reload-rules && sudo udevadm trigger)

# Cho user dùng /dev/ttyUSB* không cần sudo (logout rồi login lại mới có hiệu lực)
sudo usermod -aG dialout bo

# Thư viện hệ thống cho Vivado/Vitis (có kèm Xvfb, thứ mà xsct cần)
sudo /home/bo/AMD/2026.1/Vitis/scripts/installLibs.sh
```

Kiểm tra quyền JTAG: thiết bị FTDI trong `/dev/bus/usb/...` phải có quyền `crw-rw-rw-`.

### 3.5 Nạp môi trường

Mỗi terminal mới đều phải chạy:

```bash
source /home/bo/AMD/2026.1/Vitis/settings64.sh   # thêm vivado, xsdb, armr5-none-eabi-gcc vào PATH
```

| Công cụ | Đường dẫn |
|---|---|
| `vivado` | `/home/bo/AMD/2026.1/Vivado/bin/vivado` |
| `xsdb` | `/home/bo/AMD/2026.1/Vitis/bin/xsdb` |
| `armr5-none-eabi-gcc` | `/home/bo/AMD/2026.1/Vitis/gnu/armr5/lin/gcc-arm-none-eabi/bin/` |
| `hw_server` | `/home/bo/AMD/2026.1/Vitis/bin/hw_server` (xsdb tự khởi động) |

---

## 4. Cấu trúc project và công dụng từng file

```
~/linux/KV260/
├── Makefile              Điều phối: make hw / make sw / make console / make clean
├── README.md             Tóm tắt ngắn + trình tự lệnh xsdb
├── HUONG_DAN.md          Tài liệu này
├── hw/
│   └── create_hw.tcl     Script Vivado: tạo thiết kế PS, xuất XSA, sinh hw_config.h
├── sw/
│   ├── Makefile          Build bare-metal bằng armr5-none-eabi-gcc
│   ├── linker.ld         Bản đồ bộ nhớ (ATCM / BTCM)
│   └── src/
│       ├── startup.S     Code khởi động: vector, MPU/cache, VFP, ECC, stack, .data
│       ├── reg.h         Macro truy cập thanh ghi + tần số clock
│       ├── uart.h/.c     Driver UART1 bằng thanh ghi + printf mini
│       ├── delay.h/.c    Tạo độ trễ bằng bộ đếm chu kỳ PMU của R5
│       └── main.c        Chương trình chính: Hello World + tick
└── build/                (sinh ra khi build, không sửa tay)
    ├── kv260_ps.xsa      Hardware handoff từ Vivado
    ├── hw/psu_init.tcl   Script khởi tạo PS, giải nén từ XSA
    ├── hw_config.h       Tần số clock thật của UART1 và R5
    └── vivado/           Project Vivado (mở bằng GUI để xem block design)
```

### 4.1 `Makefile` (thư mục gốc)

| Target | Làm gì |
|---|---|
| `make hw` | Chạy `vivado -mode batch -source hw/create_hw.tcl`, sau đó `unzip` để lấy `psu_init.tcl` ra khỏi XSA |
| `make sw` | Gọi `make -C sw` để build file ELF |
| `make console` | Mở `minicom -D /dev/ttyUSB1 -b 115200` |
| `make clean` | Xóa `build/` và `sw/build/` |

### 4.2 `hw/create_hw.tcl`: thiết kế phần cứng PS

Các bước trong script:

1. **Board file KV260:** nếu chưa có thì tải từ Xilinx Board Store (`xhub::install`). Vivado đã nhận `xilinx.com:kv260_som:part0:2.0`.
2. **Tạo project** với chip `xck26-sfvc784-2LV-c`, gắn board part SOM và carrier.
3. **Block design** chỉ gồm IP `zynq_ultra_ps_e`, áp **board preset** (`apply_board_preset 1`). Preset cấu hình đúng DDR4, clock, MIO cho KV260.
4. **Tinh chỉnh:**
   - Tắt `M_AXI_GP0/1/2`, vì không dùng PL nên không cần cấp clock cho các cổng này.
   - Tắt UART0, bật **UART1 trên MIO 36..37**.
5. `validate_bd_design`, `generate_target`, `make_wrapper`.
6. **`write_hw_platform -fixed`** xuất ra `build/kv260_ps.xsa`. File này thực chất là zip chứa `psu_init.tcl`, `psu_init.c`, `.hwh`… Không có bitstream vì không dùng PL.
7. **Sinh `build/hw_config.h`:** đọc thuộc tính `PSU__CRL_APB__UART1_REF_CTRL__ACT_FREQMHZ` và `PSU__CRL_APB__CPU_R5_CTRL__ACT_FREQMHZ`, rồi ghi thành `#define`.

Kiểm tra trong `psu_init.tcl` đã xác nhận: `MIO_PIN_36/37` có `L3_SEL = 6` (chức năng UART1), và thanh ghi `UART1_REF_CTRL @ 0xFF5E0078` được cấu hình.

### 4.3 `build/hw_config.h`: tần số clock thật

```c
#define UART1_REF_CLK_HZ  99999001u
#define CPU_R5_CLK_HZ     533328003u
```

| Hằng số | Dùng ở | Nếu sai |
|---|---|---|
| `UART1_REF_CLK_HZ` | `uart_set_baud()` tính CD và BDIV | Baud lệch, minicom hiện **ký tự rác** |
| `CPU_R5_CLK_HZ` | `delay_us()` đổi µs thành số chu kỳ | `tick` không đúng 1 giây |

Nếu thiếu file này, `reg.h` dùng giá trị mặc định: 100 MHz và 533.33 MHz. Khi đổi clock trong Vivado thì chỉ cần chạy lại `make hw`.

### 4.4 `sw/Makefile`: build bare-metal

- Tự chọn toolchain: dùng `armr5-none-eabi-` nếu có (Vitis), nếu không thì dùng `arm-none-eabi-`.
- Cờ CPU: `-mcpu=cortex-r5 -marm -mfpu=vfpv3-d16 -mfloat-abi=hard`.
- Cờ C: `-ffreestanding -fno-builtin` (không có thư viện chuẩn), `-ffunction-sections -fdata-sections`.
- Cờ link:
  - `-nostdlib -nostartfiles`: không dùng crt0 hay libc, startup là của mình.
  - `-T linker.ld`: dùng linker script riêng.
  - `--gc-sections`: bỏ các hàm không dùng.
  - **`--build-id=none`**: xem [lỗi #7](#8-các-lỗi-đã-gặp-và-cách-sửa).
  - `-Map=...map`: sinh file map.
  - `-lgcc`: hàm hỗ trợ của compiler.
- Kết quả trong `sw/build/`:
  - `hello_r5.elf`: file để nạp.
  - `hello_r5.map`: cho biết từng hàm và biến nằm ở địa chỉ nào, chiếm bao nhiêu byte.
  - `hello_r5.lst` (sinh bằng `make -C sw disasm`): mã máy disassembly để đối chiếu PC khi debug.

### 4.5 `sw/linker.ld`: bản đồ bộ nhớ

| Vùng | Địa chỉ (nhìn từ R5) | Kích thước dùng | Chứa |
|---|---|---|---|
| **ATCM** | `0x0000_0000` | 64 KB | `.vectors` (bắt buộc ở 0x0), `.text`, `.rodata`, bản gốc của `.data` (LMA) |
| **BTCM** | `0x0002_0000` | 64 KB | `.data` (VMA), `.bss`, `.stack` |

Địa chỉ global (khi truy cập từ A53 hoặc JTAG): ATCM `0xFFE0_0000`, BTCM `0xFFE2_0000`.

Các điểm chính:

- `ENTRY(_vectors)`: lệnh `dow` đặt PC = `0x0`.
- **Mọi section đều `ALIGN(8)` ở cả đầu và cuối**, vì TCM có ECC 64-bit (xem [lỗi #8](#8-các-lỗi-đã-gặp-và-cách-sửa)).
- `.data` dùng cặp `> BTCM AT > ATCM`. Đây là minh họa **LMA và VMA**: dữ liệu được nạp vào ATCM, rồi `startup.S` copy sang BTCM.
- Stack riêng cho từng mode: FIQ, IRQ, ABT, UND, SVC mỗi mode 1 KB, **SYS 8 KB** (`main()` chạy ở mode SYS).
- Xuất các ký hiệu `__btcm_start/__btcm_end`, `__data_load/start/end`, `__*_stack_top` cho `startup.S` dùng.
- `/DISCARD/` bỏ `.ARM.exidx`, `.comment`, `.note.gnu.build-id`.

Ở chế độ **Lock Step** (mặc định), TCM của 2 lõi được gộp lại: ATCM và BTCM mỗi vùng 128 KB. Layout 64 KB của mình vẫn nằm gọn bên trong.

### 4.6 `sw/src/startup.S`: code khởi động

```
_vectors (0x00):  b _reset / undef / svc / pabort / dabort / nop / irq / fiq
_reset:
  1. cpsid if                  tắt IRQ và FIQ
  2. SCTLR: tắt M (MPU), C (D-cache), I (I-cache), V (dùng vector ở 0x0)
     invalidate D-cache (lệnh riêng của R5: c15,c5,0) và I-cache
  3. Bật VFP: CPACR cho phép CP10/CP11, FPEXC.EN = 1
  4. Xóa toàn bộ BTCM bằng strd (8 byte mỗi lần)  -> khởi tạo ECC, đồng thời .bss = 0
  5. Đặt stack cho từng mode: cps #mode ; ldr sp, =__xxx_stack_top
     Kết thúc ở mode SYS
  6. Copy .data: __data_load (ATCM) -> __data_start..__data_end (BTCM)
  7. bl main  (nếu main trả về thì wfi lặp vô hạn)
default_handler: b default_handler   (mọi exception rơi vào đây, khai báo .weak)
```

Khi debug: nếu `rrd pc` cho thấy CPU đang ở `default_handler` thì đã xảy ra exception. Đọc thanh ghi `lr` để tìm lệnh gây lỗi.

### 4.7 `sw/src/reg.h`

- `REG32(addr)`, `reg_write()`, `reg_read()`: truy cập thanh ghi qua con trỏ `volatile`.
- Dùng `__has_include("hw_config.h")` để lấy tần số thật nếu có, nếu không thì dùng giá trị mặc định.

### 4.8 `sw/src/uart.c`: driver UART1 bằng thanh ghi

UART của ZynqMP là IP **Cadence UART**, base address của UART1 là **`0xFF010000`**.

Hàm `uart_init(115200)`:

1. `CR = TXDIS | RXDIS`: tắt bộ phát và bộ thu trước khi đổi cấu hình.
2. `IDR = 0x3FFF`, `ISR = 0x3FFF`: tắt mọi ngắt và xóa cờ ngắt cũ.
3. `MR = 0x20`: 8 bit dữ liệu, không parity, 1 stop bit, chế độ normal.
4. `uart_set_baud()`: tìm cặp **CD, BDIV** cho sai số nhỏ nhất theo công thức `baud = ref_clk / (CD × (BDIV + 1))`, thử BDIV từ 4 đến 254.
5. `CR = TXRST | RXRST`, rồi chờ phần cứng tự xóa hai bit này (reset FIFO).
6. `CR = TXEN | RXEN | STOPBRK`: bật lại bộ phát và bộ thu.

Các hàm còn lại:

- `uart_putc()`: chờ khi `SR.TXFULL` (bit 4) còn bằng 1, sau đó ghi vào `FIFO` (offset 0x30). Ký tự `\n` được tự đổi thành `\r\n`.
- `uart_puts()`, `uart_flush()`: `uart_flush()` chờ đến khi `SR.TXEMPTY` (bit 3) bằng 1.
- `uart_printf()`: printf tự viết, hỗ trợ `%c %s %d %u %x %p %%` và độ rộng kiểu `%08x`. Dùng `stdarg.h`, không cần libc.

Phần **clock UART1_REF, pin mux MIO và nhả reset UART** vẫn do `psu_init` đảm nhiệm.

### 4.9 `sw/src/delay.c`: độ trễ bằng PMU cycle counter

- `delay_init()`: bật `PMCR.E` và reset bộ đếm (`PMCR.C`) qua `mcr p15,0,..,c9,c12,0`, rồi bật cycle counter (`PMCNTENSET` bit 31).
- `cycles_now()`: đọc `PMCCNTR` qua `mrc p15,0,..,c9,c13,0`.
- `delay_us()`: số chu kỳ cần chờ = `us × (CPU_R5_CLK_HZ / 1e6)`. Phép trừ không dấu nên vẫn đúng khi bộ đếm 32-bit tràn (khoảng 8 giây ở 533 MHz).

### 4.10 `sw/src/main.c`

- Gọi `uart_init(115200)` và `delay_init()`.
- In banner, giá trị **MPIDR** (đọc qua `mrc p15,0,..,c0,c0,5`), tần số CPU và tần số UART.
- Lặp mãi: in `tick N`, rồi `delay_ms(1000)`.

Giải mã `MPIDR = 0xC0000100`: Aff0 = 0 là **lõi 0**, Aff1 = 1 là cụm RPU.

---

## 5. Build

```bash
cd ~/linux/KV260
source /home/bo/AMD/2026.1/Vitis/settings64.sh

make hw             # khoảng 1-2 phút: build/kv260_ps.xsa, build/hw/psu_init.tcl, build/hw_config.h
make sw             # sw/build/hello_r5.elf (+ .map)
make -C sw disasm   # sw/build/hello_r5.lst
```

Kiểm tra bố cục ELF trước khi nạp (nên làm mỗi khi đổi toolchain hoặc linker script):

```bash
armr5-none-eabi-readelf -hS sw/build/hello_r5.elf | grep -E "Entry|\] \."
```

Kết quả đúng:

```
Entry point address:  0x0
[1] .vectors  00000000  size 0x020
[2] .text     00000020  size 0x7a0
[3] .rodata   000007c0  size 0x0e0
[6] .stack    00020000  size 0x3400
```

Cần thấy: entry = 0, `.vectors` ở 0x0, kích thước mỗi section là bội số của 8, **không có** `.note.gnu.build-id`.

---

## 6. Nạp và chạy bằng xsdb

Dùng **`xsdb`** (không cần Xvfb). `xsct` chỉ chạy được khi đã cài Xvfb, các lệnh debug của hai công cụ giống nhau.

**Terminal 1**, xem UART:

```bash
picocom -b 115200 /dev/ttyUSB1      # hoặc: minicom -D /dev/ttyUSB1 -b 115200
```

**Terminal 2:**

```bash
cd ~/linux/KV260
source /home/bo/AMD/2026.1/Vitis/settings64.sh
xsdb
```

### Bước 0: Kết nối

```tcl
connect          ;# tự khởi động hw_server tại TCP:127.0.0.1:3121
targets
```

Kết quả lúc board vừa bật (đang boot từ QSPI):

```
  1  PS TAP
     2  PMU                         <- MicroBlaze quản lý nguồn
     3  PL                          <- FPGA
  4  PSU                            <- toàn bộ PS
     5  RPU (Reset)
        6  Cortex-R5 #0 (No Power)  <- lõi sẽ nạp code
        7  Cortex-R5 #1 (No Power)
     8  APU
        9..12  Cortex-A53 #0..#3 (Running)
```

### Bước 1: Chuyển sang boot JTAG và reset hệ thống

```tcl
targets -set -filter {name =~ "PSU"}
mwr 0xff5e0200 0x0100        ;# CRL_APB.BOOT_MODE_USER: chọn chế độ boot thay thế là JTAG
rst -system
after 2000
targets                      ;# các A53 chuyển sang (APU Reset)
```

KV260 **không có công tắc chọn chế độ boot**: chân MODE trên SOM K26 được nối cứng ở QSPI. Thanh ghi `BOOT_MODE_USER` giữ giá trị qua `rst -system` và chỉ bị xóa khi **rút nguồn**. Vì vậy sau mỗi lần cắm lại nguồn phải làm lại bước này. Không có gì bị ghi vĩnh viễn.

### Bước 2: Khởi tạo PS

```tcl
targets -set -filter {name =~ "APU*"}
source build/hw/psu_init.tcl  ;# chỉ nạp các hàm Tcl, chưa chạy gì
psu_init                      ;# PLL, clock, DDR, MIO, reset ngoại vi
psu_ps_pl_isolation_removal
psu_ps_pl_reset_config
```

Sau bước này R5 **vẫn hiện "No Power"**, đây là bình thường. `psu_init` không bật nguồn cho RPU.

### Bước 3: Bật nguồn RPU và TCM qua PMU

```tcl
targets -set -filter {name =~ "PSU"}
mrd 0xffd80100                ;# PMU_GLOBAL.PWR_STATE, trước khi bật: 0x00DF008F
mwr 0xffd80118 0x0000F400     ;# REQ_PWRUP_INT_EN: bit 10 (RPU), bit 12-15 (TCM0A/0B/1A/1B)
mwr 0xffd80120 0x0000F400     ;# REQ_PWRUP_TRIG: kích hoạt yêu cầu
after 500
mrd 0xffd80100                ;# sau khi bật: 0x00DFFC8F (bit 10-15 = 1)
targets                       ;# R5 #0 (Reset), R5 #1 (Lock Step Mode)
```

Trong quy trình bình thường, PMU firmware bật nguồn cho các vùng này. Ở boot JTAG không có PMU firmware, nên ta gửi yêu cầu power-up trực tiếp cho **PMU ROM**.

### Bước 4: Nạp ELF vào R5 #0 và chạy

```tcl
targets -set -filter {name =~ "*R5*#0"}
rst -processor                ;# "Stopped at 0xffff0000 (Suspended)"
dow sw/build/hello_r5.elf     ;# ghi vào ATCM, đặt PC = 0x0
con                           ;# chạy -> UART hiện Hello World
```

Kết quả `dow` đúng:

```
section, .vectors: 0x00000000 - 0x0000001f
section, .text:    0x00000020 - 0x000007bf
section, .rodata:  0x000007c0 - 0x0000089f
Setting PC to Program Start Address 0x00000000
Successfully downloaded .../hello_r5.elf
```

### Sửa code rồi nạp lại (board chưa bị rút nguồn)

```bash
make sw
```

```tcl
targets -set -filter {name =~ "*R5*#0"}
rst -processor
dow sw/build/hello_r5.elf
con
```

Không cần chạy lại bước 1 đến 3.

### Thoát

```tcl
disconnect
exit
```

---

## 7. Bản đồ bộ nhớ và luồng khởi động

```
          Địa chỉ R5 local
0x0000_0000 ┌──────────────────────┐ ATCM
            │ .vectors (0x20)      │ <- PC = 0 sau dow
0x0000_0020 │ .text                │ _reset, main, uart_*, delay_*
0x0000_07C0 │ .rodata              │ chuỗi ký tự
            │ (.data LMA)          │
            │        ...           │
0x0001_0000 └──────────────────────┘
0x0002_0000 ┌──────────────────────┐ BTCM (xóa bằng 0 trong startup)
            │ .data (VMA)          │
            │ .bss                 │
            │ stack FIQ/IRQ/ABT/   │
            │       UND/SVC 1KB    │
            │ stack SYS 8KB        │ <- __sys_stack_top = 0x0002_3400
0x0003_0000 └──────────────────────┘

0xFF01_0000   UART1 (Cadence UART)
0xFF5E_0000   CRL_APB (clock/reset LPD, BOOT_MODE_USER @ +0x200)
0xFF18_0000   IOU_SLCR (pin mux MIO)
0xFFD8_0000   PMU_GLOBAL (PWR_STATE, REQ_PWRUP_*)
0xFFE0_0000   ATCM (địa chỉ global)
0xFFE2_0000   BTCM (địa chỉ global)
```

Luồng chạy:

```
JTAG dow -> PC = 0x0 -> _vectors: b _reset
  -> _reset: tắt ngắt, tắt MPU/cache, vector thấp, bật VFP
  -> xóa BTCM (ECC) -> stack từng mode -> copy .data
  -> main(): uart_init -> delay_init -> in banner -> lặp tick
```

---

## 8. Các lỗi đã gặp và cách sửa

| # | Hiện tượng | Nguyên nhân | Cách sửa |
|---|---|---|---|
| 1 | `ls /dev/ttyUSB*` không có gì | Board chưa cắm, hoặc USB chưa gắn vào VM | Cắm micro-USB J4. Trong VMware: VM → Removable Devices → FTDI → Connect |
| 2 | Không thoát được minicom | Terminal VSCode bắt phím `Ctrl+A` | Dùng terminal Ubuntu riêng, hoặc `pkill minicom` |
| 3 | Bộ cài báo cần 156 GB, ổ không đủ | Chọn quá nhiều họ chip | Chỉ giữ Kria + Zynq UltraScale+ MPSoC, dọn `yocto/build/tmp` |
| 4 | `vivado`: *valid license was not found* | Bản 2026.1 bắt buộc có license | Xin license **Vivado Basic Tier** (miễn phí), đặt vào `~/.Xilinx/` |
| 5 | `xsdb` → `targets` trống | Thiếu udev rules, USB có quyền `rw-rw-r-- root` | `sudo ./install_drivers`, rồi **ngắt và kết nối lại USB** |
| 6 | `xsct`: *Xvfb is not available* | xsct cần màn hình ảo | Dùng **`xsdb`**, hoặc `sudo apt install xvfb` |
| 7 | `dow` hiện `.note.gnu.build-id` ở 0x0, `.vectors` bị đẩy xuống 0x24 | Toolchain Xilinx tự thêm build-id | `-Wl,--build-id=none` + đưa `*(.note.gnu.build-id)` vào `/DISCARD/` |
| 8 | `dow`: *Memory write error at 0x8C4, Fault status 0x19* | TCM có **ECC 64-bit**, ghi thiếu 2 byte cuối `.rodata` vào ô chưa khởi tạo | `. = ALIGN(8);` ở đầu và cuối mọi section trong `linker.ld` |
| 9 | `rst -processor`: *APB AP transaction error, DAP status 0x30000021*, R5 "No Power" | Boot JTAG không có PMU firmware, RPU và TCM chưa được cấp nguồn | Ghi `0xF400` vào `0xFFD80118` và `0xFFD80120` (bước 3) |

---

## 9. Các thanh ghi quan trọng

| Thanh ghi | Địa chỉ | Dùng để |
|---|---|---|
| `CRL_APB.BOOT_MODE_USER` | `0xFF5E0200` | Ghi `0x0100` để boot JTAG (giữ qua system reset) |
| `CRL_APB.UART1_REF_CTRL` | `0xFF5E0078` | Clock UART1 (psu_init cấu hình, khoảng 100 MHz) |
| `IOU_SLCR.MIO_PIN_36/37` | `0xFF180090/94` | Pin mux: `L3_SEL = 6` là UART1 TX/RX |
| `PMU_GLOBAL.PWR_STATE` | `0xFFD80100` | Đọc trạng thái nguồn từng vùng (bit 10-15: RPU và TCM) |
| `PMU_GLOBAL.REQ_PWRUP_INT_EN` | `0xFFD80118` | Cho phép yêu cầu power-up |
| `PMU_GLOBAL.REQ_PWRUP_TRIG` | `0xFFD80120` | Kích hoạt power-up |
| `UART1.CR` | `0xFF010000` | Bật/tắt và reset TX/RX |
| `UART1.MR` | `0xFF010004` | Khung dữ liệu (8N1 = `0x20`) |
| `UART1.IDR / ISR` | `0xFF01000C / 14` | Tắt ngắt / xóa cờ ngắt |
| `UART1.BAUDGEN` (CD) | `0xFF010018` | Bộ chia baud |
| `UART1.SR` | `0xFF01002C` | bit 1 RXEMPTY, bit 3 TXEMPTY, bit 4 TXFULL |
| `UART1.FIFO` | `0xFF010030` | Ghi để gửi, đọc để nhận |
| `UART1.BAUDDIV` (BDIV) | `0xFF010034` | Bộ chia baud |

Thanh ghi hệ thống của R5 (truy cập qua CP15):

| Thanh ghi | Lệnh | Dùng để |
|---|---|---|
| SCTLR | `mrc/mcr p15,0,rX,c1,c0,0` | Bật/tắt MPU, cache, chọn vị trí vector |
| CPACR | `p15,0,rX,c1,c0,2` | Cho phép truy cập VFP |
| MPIDR | `p15,0,rX,c0,c0,5` | Số hiệu lõi |
| PMCR / PMCNTENSET / PMCCNTR | `c9,c12,0` / `c9,c12,1` / `c9,c13,0` | Bộ đếm chu kỳ |

Tài liệu tra cứu: **UG1085** (ZynqMP TRM), **UG1087** (Register Reference), **ARM Cortex-R5 TRM**.

---

## 10. Terminal serial: minicom và picocom

| | minicom | picocom |
|---|---|---|
| Mở | `minicom -D /dev/ttyUSB1 -b 115200` | `picocom -b 115200 /dev/ttyUSB1` |
| Thoát | `Ctrl+A` rồi `X` (hoặc `Q`) | `Ctrl+A` rồi `Ctrl+X` |
| Hardware flow control | **Bật mặc định**, phải tắt: `Ctrl+A O` → Serial port setup → `F` | Tắt mặc định |
| Đặc điểm | Có menu, ghi log, gửi file (xmodem) | Gọn nhẹ, cấu hình bằng tham số dòng lệnh |
| Cài | đã có | `sudo apt install picocom` |

Với bare-metal thì **picocom gọn hơn**. Nhóm `dialout` đã được thêm nên không cần `sudo`.

---

## 11. Lệnh debug xsdb hay dùng

```tcl
targets                       ;# liệt kê và xem trạng thái các lõi
targets -set -filter {...}    ;# chọn lõi
stop / con                    ;# dừng / chạy tiếp
state                         ;# trạng thái lõi đang chọn
rrd                           ;# đọc tất cả thanh ghi
rrd pc                        ;# đọc PC, đối chiếu với sw/build/hello_r5.lst
bt                            ;# call stack
bpadd -addr &main             ;# đặt breakpoint
bplist / bpremove <id>
stp / nxt                     ;# chạy từng lệnh (vào hàm / qua hàm)
mrd 0xff010000 14             ;# đọc 14 thanh ghi UART1
mwr <addr> <value>            ;# ghi thanh ghi hoặc bộ nhớ
dow <file.elf>                ;# nạp chương trình
rst -processor / rst -system
```

---

## 12. Bước tiếp theo

1. **Debug sâu:** đặt breakpoint trong `uart_set_baud()`, xem giá trị CD và BDIV được chọn, đối chiếu với `mrd 0xff010018` và `mrd 0xff010034`.
2. **UART nhận dữ liệu:** đọc `FIFO` khi `SR.RXEMPTY = 0` để làm echo.
3. **Ngắt:** cấu hình GIC và timer TTC, viết `irq_handler` bằng C (startup đã khai báo `.weak`).
4. **Tự làm phần của psu_init:** clock `UART1_REF_CTRL`, pin mux MIO, nhả reset UART bằng thanh ghi (tra UG1087).
5. **MPU và cache:** bật MPU, chia vùng nhớ, bật I/D-cache, rồi đo tốc độ chạy trước và sau.
6. **Sang PL:** thêm AXI GPIO trong Vivado, R5 điều khiển LED hoặc chân PMOD.
7. **R5 chạy song song với Linux:** để A53 chạy Linux, nạp firmware cho R5 qua `remoteproc`.
