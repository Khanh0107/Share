# KV260 – R5F gửi UART qua AXI UART Lite trong PL

Lõi **Cortex-R5F #0** (PS) chạy code C, điều khiển IP **AXI UART Lite** của Xilinx đặt trong **PL (FPGA)** qua bus **AXI**. AXI UART Lite gửi chuỗi `Hello World from R5F (AXI UART Lite) #N` mỗi giây ra **PMOD J2 chân 1**, nối vào **RXD của module CH340**, CH340 cắm vào máy tính.

Ngoài ra, ký tự gõ trên picocom của CH340 (TXD → PMOD J2 chân 3) được R5 nhận và **gửi lại (echo)**.

Kết quả mong đợi trên cổng CH340 (115200 8N1):

```
==============================
 Hello World from R5F
 via AXI UART Lite (PL)
==============================
Hello World from R5F (AXI UART Lite) #0
Hello World from R5F (AXI UART Lite) #1
Hello World from R5F (AXI UART Lite) #2
...
```

```
 ┌──────────────────────────── Zynq UltraScale+ (xck26) ────────────────────────────┐
 │  PS                                     │  PL                                    │
 │                                         │                                        │
 │  R5F #0 ──► M_AXI_HPM0_LPD ─────────────┼──► axi_smc ──► axi_uartlite_0 ── tx ───┼──► PMOD J2 chân 1 (H12) ──► RXD CH340 ──USB──► PC
 │  (code C: main.c)                       │   (SmartConnect)  0x80000000   ◄─ rx ───┼─── PMOD J2 chân 3 (E10) ◄── TXD CH340
 │                                         │                                        │    PMOD J2 chân 9 (GND)  ──── GND CH340
 │  pl_clk0 (100 MHz) ─────────────────────┼──► clock cho toàn bộ PL                │
 │  pl_resetn0 ────────────────────────────┼──► rst_ps8_0_99M (Processor Sys Reset) │
 │  UART1 (MIO 36/37) ──► /dev/ttyUSB1     │    (thông báo debug của R5)            │
 └─────────────────────────────────────────┴────────────────────────────────────────┘
```

---

## Mục lục

1. [Nối dây CH340 vào PMOD J2](#1-nối-dây-ch340-vào-pmod-j2)
2. [Cấu trúc thư mục](#2-cấu-trúc-thư-mục)
3. [Tạo bitstream bằng Vivado](#3-tạo-bitstream-bằng-vivado)
4. [Tạo Platform và Application bằng Vitis IDE](#4-tạo-platform-và-application-bằng-vitis-ide)
5. [Nạp bitstream và chương trình bằng xsdb](#5-nạp-bitstream-và-chương-trình-bằng-xsdb)
6. [Đọc code](#6-đọc-code)
7. [Các lỗi có thể gặp](#7-các-lỗi-có-thể-gặp)
8. [Tóm tắt lệnh](#8-tóm-tắt-lệnh)
9. [Bước tiếp theo](#9-bước-tiếp-theo)

---

## 1. Nối dây CH340 vào PMOD J2

### 1.1 Chân PMOD J2

Nhìn thẳng vào miệng đầu cắm J2. Hàng trên là chân lẻ, hàng dưới là chân chẵn:

```
              chân 1 (có đánh dấu trên board)
                ↓
              ┌────┬────┬────┬────┬────┬────┐
  hàng trên   │ 1  │ 3  │ 5  │ 7  │ 9  │ 11 │
              ├────┼────┼────┼────┼────┼────┤
  hàng dưới   │ 2  │ 4  │ 6  │ 8  │ 10 │ 12 │
              └────┴────┴────┴────┴────┴────┘
               TX   RX                 GND  3.3V
```

| Chân PMOD J2 | FPGA pin | Dùng trong project |
|---|---|---|
| **1** | **H12** | `uartlite_tx`: TX của AXI UART Lite |
| **3** | **E10** | `uartlite_rx`: RX của AXI UART Lite (có điện trở kéo lên) |
| **9, 10** | – | **GND** |
| 11, 12 | – | 3.3V (không dùng) |

Gán chân nằm trong `hw/pins.xdc`, mức **3.3V** (LVCMOS33).

### 1.2 Cách nối

**Tắt nguồn board trước khi cắm.** Dùng dây dupont đực–cái (đầu đực vào lỗ J2).

| CH340 | PMOD J2 | Bắt buộc? |
|---|---|---|
| **RXD** | **chân 1** | Bắt buộc: để thấy chữ R5 gửi ra |
| **GND** | **chân 9** | Bắt buộc: chung GND |
| TXD | chân 3 | Tùy chọn: để thử echo (gõ phím trên picocom) |
| VCC / 5V / 3V3 | **không nối** | CH340 lấy nguồn từ USB |

```
   KV260 J2                         CH340
   chân 1  (TX)  ──────────────►    RXD
   chân 3  (RX)  ◄──────────────    TXD    (tùy chọn, jumper CH340 phải ở 3.3V)
   chân 9  (GND) ────────────────   GND
                                    VCC    (để trống, KHÔNG nối)
```

> **Nếu nối TXD của CH340 vào chân 3:** gạt jumper của module CH340 sang **3.3V**. Mức 5V có thể làm hỏng chân FPGA.

### 1.3 Gắn CH340 và FTDI vào máy ảo

Trong VMware: **VM → Removable Devices**, Connect cả **QinHeng Electronics (CH340)** và **Future Technology Devices (FTDI, cáp micro-USB J4 của board)**. Kiểm tra:

```bash
lsusb | grep -E "1a86|0403"
ls -l /dev/serial/by-id/
```

```
Bus 001 Device ...: ID 1a86:7523 QinHeng Electronics CH340 serial converter
Bus 002 Device ...: ID 0403:6011 Future Technology Devices International, Ltd FT4232H ...

usb-1a86_USB_Serial-if00-port0 -> ../../ttyUSB4                      <- CH340
usb-Xilinx_ML_Carrier_Card_...-if01-port0 -> ../../ttyUSB1            <- PS UART1 của board
```

Tên `ttyUSBx` của CH340 có thể thay đổi (`ttyUSB4`, hoặc `ttyUSB0` nếu cắm lúc xsdb đang kết nối JTAG). Luôn mở CH340 bằng tên cố định:

```
/dev/serial/by-id/usb-1a86_USB_Serial-if00-port0
```

---

## 2. Cấu trúc thư mục

### 2.1 Trước khi build

```
04_PS_R5F_send_Uart_AXI_UartLite/
├── Makefile                  make hw / make ide / make console / make console-ps / make clean
├── README.md                 Tài liệu này
├── images/                   Ảnh chụp màn hình dùng trong README
├── hw/
│   ├── create_hw.tcl         Script Vivado: Zynq + AXI UART Lite -> bitstream -> XSA
│   └── pins.xdc              Gán chân: uartlite_tx -> H12 (chân 1), uartlite_rx -> E10 (chân 3)
└── src/
    └── main.c                Code R5: gửi "Hello World" + echo qua AXI UART Lite
```

| File | Dùng ở bước |
|---|---|
| `hw/create_hw.tcl` | `make hw` hoặc Vivado GUI (mục 3, cách A và B) |
| `hw/pins.xdc` | Vivado (mục 3) |
| `src/main.c` | Wizard tạo Application trong Vitis IDE (mục 4.2) |

### Xóa kết quả build để làm lại từ đầu

Đóng Vivado và Vitis IDE trước, rồi:

```bash
cd ~/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite
rm -rf build vitis .Xil
ls -A
```

```
hw  images  Makefile  README.md  src
```

`make clean` chỉ xóa `build/` (kết quả Vivado), **không xóa `vitis/`** vì trong đó có code bạn đã sửa (`vitis/hello_uartlite/main.c`).

### 2.2 Sau khi build

```
04_PS_R5F_send_Uart_AXI_UartLite/
├── (các file ở 2.1)
├── build/                                  ◄ make hw hoặc Vivado GUI (mục 3)
│   ├── kv260_r5_uartlite.xsa               XSA: thiết kế + bitstream (dùng cho Vitis)
│   ├── hw/
│   │   ├── psu_init.tcl                    ★ Khởi tạo PS, dùng trong xsdb
│   │   └── kv260_r5_uartlite.bit           ★ BITSTREAM, nạp vào PL bằng xsdb
│   └── vivado/kv260_r5_uartlite.xpr        Project Vivado
│
└── vitis/                                  ◄ make ide (mục 4)
    ├── kv260_r5_uartlite_platform/         Platform component (BSP có driver uartlite)
    │   └── export/kv260_r5_uartlite_platform/sw/standalone_psu_cortexr5_0/include/
    │       ├── xparameters.h               XPAR_XUARTLITE_0_BASEADDR = 0x80000000
    │       └── xuartlite.h ...
    └── hello_uartlite/                     Application component
        ├── main.c                          ★ CODE R5, sửa ở đây
        └── build/hello_uartlite.elf        ★ FILE ĐỂ NẠP vào R5
```

---

## 3. Tạo bitstream bằng Vivado

### 3.1 Thiết kế gồm những gì

| Khối | Loại | Vai trò |
|---|---|---|
| `zynq_ultra_ps_e_0` | Zynq UltraScale+ MPSoC (preset KV260) | Có R5F. Bật cổng **M_AXI_HPM0_LPD** (R5 nói chuyện với PL), **pl_clk0 = 100 MHz**, UART1 (MIO 36/37) để in debug |
| `axi_smc` | AXI SmartConnect | Nối cổng AXI của PS tới AXI UART Lite |
| `rst_ps8_0_99M` | Processor System Reset | Tạo reset đồng bộ cho PL từ `pl_resetn0` |
| `axi_uartlite_0` | AXI UART Lite | UART controller trong PL: 115200 8N1, địa chỉ **`0x80000000`** |

`axi_smc` và `rst_ps8_0_99M` được Vivado **tự thêm** khi chạy *Connection Automation*. Port `uartlite_tx`, `uartlite_rx` được `pins.xdc` gán vào H12 và E10.

### 3.2 Chọn cách tạo

Có 3 cách, kết quả giống nhau: `build/kv260_r5_uartlite.xsa`, `build/hw/kv260_r5_uartlite.bit`, `build/hw/psu_init.tcl`. Mỗi cách mất khoảng **3–5 phút**.

| Cách | Dùng gì | Khi nào nên dùng |
|---|---|---|
| A | Terminal: `make hw` | Mặc định, nhanh |
| B | Vivado GUI chạy script `create_hw.tcl` | Muốn nhìn Vivado tạo từng bước |
| C | Vivado GUI, tự bấm tay | Muốn hiểu script làm gì |

Mọi terminal đều phải nạp môi trường trước:

```bash
cd ~/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite
source /home/bo/AMD/2026.1/Vitis/settings64.sh
```

### 3.3 Cách A: Terminal (`make hw`)

```bash
make hw
```

Các dòng cuối:

```
INFO: [Vivado 12-1842] Bitgen Completed Successfully.
INFO: Da tao /home/bo/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite/build/kv260_r5_uartlite.xsa
unzip -o build/kv260_r5_uartlite.xsa psu_init.tcl '*.bit' -d build/hw
  inflating: build/hw/psu_init.tcl
  inflating: build/hw/kv260_r5_uartlite.bit
```

Kết quả build thật:

| Mục | Giá trị |
|---|---|
| Timing | **WNS = +6.911 ns** ở 100 MHz (đạt) |
| Tài nguyên | **529 LUT, 489 FF** (khoảng 0.5% chip) |
| Chân | `uartlite_tx` → **H12**, `uartlite_rx` → **E10** |
| Địa chỉ | `axi_uartlite_0` = **`0x80000000`** trên `M_AXI_HPM0_LPD` |

Nếu báo `make: Nothing to be done for 'hw'.` thì bitstream đã mới nhất. Muốn ép chạy lại: `make -B hw`.

### 3.4 Cách B: Chạy script trong Vivado GUI

```bash
cd ~/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite
source /home/bo/AMD/2026.1/Vitis/settings64.sh
mkdir -p build && cd build
vivado &
```

**Tools → Run Tcl Script…** → ô **File name** gõ `/home/bo/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite/hw/create_hw.tcl` → **Open**. Chờ Tcl Console hiện `INFO: Da tao .../build/kv260_r5_uartlite.xsa`, rồi trong terminal:

```bash
cd ~/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite
unzip -o build/kv260_r5_uartlite.xsa psu_init.tcl '*.bit' -d build/hw
```

### 3.5 Cách C: Tự bấm tay trong Vivado GUI

Mở Vivado như cách B. **Mọi ô đường dẫn đều gõ đường dẫn đầy đủ, bắt đầu bằng `/`.**

**Bước 1: Tạo project.** **File → Project → New** → Next:

| Màn hình | Chọn |
|---|---|
| Project Name | Name: `kv260_r5_uartlite`, Location: `/home/bo/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite/build/vivado`, **bỏ tích** *Create project subdirectory* |
| Project Type | **RTL Project** |
| Add Sources | Không thêm gì → Next |
| Add Constraints | **Add Files** → `/home/bo/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite/hw/pins.xdc`, bỏ tích *Copy constraints files into project* |
| Default Part | Tab **Boards** → **Kria KV260 Vision AI Starter Kit SOM** → *Connections* → carrier **KV260** → Finish |

**Bước 2: Block design.** **IP INTEGRATOR → Create Block Design** → `system` → OK.

**Bước 3: Zynq.** **+** → **Zynq UltraScale+ MPSoC** → **Run Block Automation** → tích **Apply Board Preset** → OK.

**Bước 4: Chỉnh Zynq.** Double-click khối Zynq:
- **PS-PL Configuration → PS-PL Interfaces → Master Interface**: bỏ tích **AXI HPM0 FPD**, **AXI HPM1 FPD**; **tích AXI HPM0 LPD**.
- **I/O Configuration → Low Speed → I/O Peripherals → UART**: bỏ UART 0, tích **UART 1** → **MIO 36 .. 37**.
- **Clock Configuration → Output Clocks → Low Power Domain Clocks → PL Fabric Clocks**: **PL0** = **100 MHz**.
- OK.

**Bước 5: AXI UART Lite.** **+** → gõ `uartlite` → **AXI Uartlite**. Double-click khối vừa thêm: **Baud Rate = 115200**, Data Bits = 8, Parity = No Parity → OK.

**Bước 6: Connection Automation.** Thanh xanh → **Run Connection Automation**:
- Tích **axi_uartlite_0 → S_AXI**: Master `/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD`, Clock source `/zynq_ultra_ps_e_0/pl_clk0`, Interconnect IP **New AXI SmartConnect**.
- **Bỏ tích** mục **UART** (ta tự nối ra chân ở bước 7).
- OK. Vivado tự thêm `axi_smc` (SmartConnect) và `rst_ps8_0_99M` (Processor System Reset), nối sẵn clock và reset.

**Bước 7: Chân ra ngoài.** Trên khối `axi_uartlite_0`, bấm dấu **+** cạnh interface **UART** để thấy 2 chân `rx`, `tx`:
- Chuột phải `tx` → **Make External** → chọn port vừa tạo, đổi *Name* thành **`uartlite_tx`**.
- Chuột phải `rx` → **Make External** → đổi tên thành **`uartlite_rx`**.

Tên port phải **trùng với `pins.xdc`**, nếu không bitstream sẽ báo lỗi chân.

**Bước 8: Địa chỉ.** Tab **Address Editor**: `axi_uartlite_0` phải có địa chỉ **`0x8000_0000`**, range 64K. Nếu trống, bấm **Assign All**.

**Bước 9: Validate.** **Validate Design** (F6) → *Validation successful*.

**Bước 10: Output, wrapper, top.** Tab Sources → chuột phải `system.bd`:
- **Generate Output Products** → Generate.
- **Create HDL Wrapper** → *Let Vivado manage* → OK.
- Kiểm tra **Design Sources**: `system_wrapper` phải **in đậm** (là top). Nếu không: chuột phải `system_wrapper` → **Set as Top**.

**Bước 11: Bitstream.** **PROGRAM AND DEBUG → Generate Bitstream** → Yes. Chờ 3–5 phút đến *write_bitstream Complete*.

**Bước 12: Xuất XSA.** **File → Export → Export Hardware**:
- Output: **Include bitstream**.
- XSA file name: `kv260_r5_uartlite`
- Export to: **`/home/bo/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite/build`** (đường dẫn đầy đủ).
- Finish.

Hoặc gõ vào Tcl Console:

```tcl
write_hw_platform -fixed -include_bit -force -file /home/bo/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite/build/kv260_r5_uartlite.xsa
```

**Bước 13: Lấy file và kiểm tra** (terminal):

```bash
cd ~/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite
unzip -o build/kv260_r5_uartlite.xsa psu_init.tcl '*.bit' -d build/hw
ls -l build/kv260_r5_uartlite.xsa build/hw/psu_init.tcl build/hw/kv260_r5_uartlite.bit
```

| Bước tay | Lệnh trong `create_hw.tcl` |
|---|---|
| 1. Project | `create_project`, `set_property board_part`, `add_files -fileset constrs_1 pins.xdc` |
| 3–4. Zynq | `apply_board_preset`, `CONFIG.PSU__USE__M_AXI_GP2 {1}` (= HPM0 LPD), `PSU__FPGA_PL0_ENABLE`, `PSU__UART1__*` |
| 5. AXI UART Lite | `create_bd_cell ... axi_uartlite`, `CONFIG.C_BAUDRATE {115200}` |
| 6. Connection Automation | `apply_bd_automation -rule xilinx.com:bd_rule:axi4 ...` |
| 7. Chân ra | `create_bd_port`, `connect_bd_net` |
| 8. Địa chỉ | `assign_bd_address` |
| 10. Wrapper + top | `make_wrapper -top`, `set_property top system_wrapper` |
| 11. Bitstream | `launch_runs impl_1 -to_step write_bitstream` |
| 12. Export | `write_hw_platform -fixed -include_bit` |

Tên menu viết theo các bản Vivado gần đây, bản 2026.1 có thể khác một chút.

---

## 4. Tạo Platform và Application bằng Vitis IDE

```bash
cd ~/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite
source /home/bo/AMD/2026.1/Vitis/settings64.sh
make ide          # = vitis -w vitis
```

### 4.1 Platform

**File → New Component → Platform**:

| Màn hình | Giá trị |
|---|---|
| Name and Location | Name **`kv260_r5_uartlite_platform`**, location `/home/bo/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite/vitis` |
| Flow | **Hardware Design** → Browse → `/home/bo/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite/build/kv260_r5_uartlite.xsa` |
| OS and Processor | **standalone**, **psu_cortexr5_0**, **bỏ tích** *Generate Boot artifacts* |
| Summary | Finish |

Panel **FLOW** → Component `kv260_r5_uartlite_platform` → **Build** → `Platform Build Finished successfully.`

XSA có AXI UART Lite nên BSP có thêm driver **uartlite**. Kiểm tra (terminal):

```bash
grep -E "XUARTLITE_0_BASEADDR|XUARTPS_0_BASEADDR" \
  vitis/kv260_r5_uartlite_platform/export/kv260_r5_uartlite_platform/sw/standalone_psu_cortexr5_0/include/xparameters.h
```

```
#define XPAR_XUARTLITE_0_BASEADDR 0x80000000
#define XPAR_XUARTPS_0_BASEADDR 0xff010000
```

### 4.2 Application

**File → New Component → Application**:

| Màn hình | Giá trị |
|---|---|
| Name and Location | Name **`hello_uartlite`** |
| Hardware | **`kv260_r5_uartlite_platform`** |
| Domain | **`standalone_psu_cortexr5_0`** |
| Source Files | Icon *Add Files* → `/home/bo/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite/src/main.c`, giữ tích *Copy sources to component* |
| Summary | Finish |

Hộp thoại *Application – Platform Build Dependency*: **Always build platform with application** → **Save in Workspace Preference**.

Panel **FLOW** → Component `hello_uartlite` → **Build**. Kết quả khi build thử:

```
[3/3] Linking C executable hello_uartlite.elf
   text    data     bss     dec     hex filename
  10360     784   23080   34224    85b0 hello_uartlite.elf
Build Finished successfully
```

File để nạp: `vitis/hello_uartlite/build/hello_uartlite.elf`. Từ giờ sửa code ở **`vitis/hello_uartlite/main.c`**.

---

## 5. Nạp bitstream và chương trình bằng xsdb

### 5.1 Mở các cổng UART

```bash
# Terminal 1: CH340 (AXI UART Lite)
picocom -b 115200 /dev/serial/by-id/usb-1a86_USB_Serial-if00-port0      # = make console

# Terminal 2 (tùy chọn): PS UART1, xem thông báo debug của R5
picocom -b 115200 /dev/ttyUSB1                                           # = make console-ps
```

### 5.2 xsdb (terminal 3)

```bash
cd ~/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite
source /home/bo/AMD/2026.1/Vitis/settings64.sh
xsdb
```

**Bước 1: Kết nối, boot JTAG, reset**

```tcl
connect
targets -set -filter {name =~ "PSU"}
mwr 0xff5e0200 0x0100
rst -system
after 2000
```

**Bước 2: Khởi tạo PS**

```tcl
targets -set -filter {name =~ "APU*"}
source build/hw/psu_init.tcl
psu_init
```

`psu_init` cấu hình clock (có `pl_clk0` = 100 MHz), **DDR** (code R5 chạy ở DDR), MIO, UART1.

**Bước 3: Nạp bitstream vào PL**

```tcl
fpga -file build/hw/kv260_r5_uartlite.bit
```

**Bước 4: Nối PS với PL, nhả reset PL**

```tcl
psu_ps_pl_isolation_removal
psu_ps_pl_reset_config
```

Sau bước này AXI UART Lite đã sẵn sàng nhưng **chưa gửi gì**: nó chỉ gửi khi R5 ghi dữ liệu vào.

**Bước 5: Bật nguồn RPU và TCM**

```tcl
targets -set -filter {name =~ "PSU"}
mwr 0xffd80118 0x0000F400
mwr 0xffd80120 0x0000F400
after 500
mrd 0xffd80100               ;# phải ra 00DFFC8F
```

Không có PMU firmware nên phải tự yêu cầu PMU ROM bật nguồn RPU (bit 10) và TCM (bit 12–15).

**Bước 6: Nạp và chạy R5**

```tcl
targets -set -filter {name =~ "*R5*#0"}
rst -processor
dow vitis/hello_uartlite/build/hello_uartlite.elf
con
```

### 5.3 Kết quả mong đợi

**Terminal 1 (CH340):**

```
==============================
 Hello World from R5F
 via AXI UART Lite (PL)
==============================
Hello World from R5F (AXI UART Lite) #0
Hello World from R5F (AXI UART Lite) #1
...
```

Nếu đã nối TXD của CH340 vào chân 3: gõ phím trong picocom, ký tự sẽ hiện lại (R5 echo).

**Terminal 2 (ttyUSB1, PS UART1):**

```
[R5] Khoi tao AXI UART Lite tai 0x80000000
[R5] OK, dang gui ra PMOD J2 chan 1
```

### 5.4 Sửa code rồi nạp lại

- **Sửa `main.c`** (board chưa rút nguồn): sửa `vitis/hello_uartlite/main.c` → FLOW → **Build** → trong xsdb:
  ```tcl
  targets -set -filter {name =~ "*R5*#0"}
  rst -processor
  dow vitis/hello_uartlite/build/hello_uartlite.elf
  con
  ```
- **Sửa phần cứng** (`create_hw.tcl`, `pins.xdc` hoặc block design): `make hw`, rồi trong Vitis: chuột phải platform → *Switch / re-read XSA* → Build platform và app, rồi làm lại **toàn bộ mục 5.2**.

---

## 6. Đọc code

### 6.1 Đường đi của một byte từ R5 tới CH340

```
main.c: XUartLite_Send(&uart_lite, buf, n)
   │  ghi byte vào thanh ghi TX FIFO (0x80000004)
   ▼
R5F #0 ──► (MPU của BSP: vùng 0x80000000 là Device memory)
       ──► cổng M_AXI_HPM0_LPD của PS
       ──► axi_smc (AXI SmartConnect, trong PL)
       ──► axi_uartlite_0/S_AXI ──► TX FIFO 16 byte
       ──► bộ phát UART (chia baud từ pl_clk0 100 MHz) ──► chân uartlite_tx (H12)
       ──► PMOD J2 chân 1 ──► RXD của CH340 ──► USB ──► picocom
```

### 6.2 Driver XUartLite

```c
XUartLite_Initialize(&uart_lite, XPAR_XUARTLITE_0_BASEADDR);   // khởi tạo
XUartLite_Send(&uart_lite, buf, len);                          // gửi
XUartLite_Recv(&uart_lite, &c, 1);                             // nhận
```

| API | Làm gì |
|---|---|
| `XUartLite_Initialize` | Tìm cấu hình theo địa chỉ base (flow SDT), ghi 0 vào thanh ghi CTRL để tắt ngắt |
| `XUartLite_Send` | Đẩy dữ liệu vào TX FIFO (sâu 16 byte), trả về số byte đã nhận vào FIFO. `uartlite_puts()` gọi lặp cho đến khi gửi hết chuỗi |
| `XUartLite_Recv` | Đọc từ RX FIFO, trả về số byte đọc được (0 nếu chưa có gì). Không chờ |

AXI UART Lite **không có hàm đặt baud**: 115200 được cố định khi tạo phần cứng (`CONFIG.C_BAUDRATE`). Muốn đổi baud phải sửa `create_hw.tcl` và tạo bitstream mới.

### 6.3 Vòng lặp chính

```c
for (u32 count = 0;;) {
    if (XUartLite_Recv(&uart_lite, &c, 1) == 1)    // có ký tự đến -> gửi lại (echo)
        XUartLite_Send(&uart_lite, &c, 1);

    XTime_GetTime(&t_now);                          // mỗi giây gửi 1 dòng
    if ((u32)t_now - (u32)t_last >= COUNTS_PER_SECOND) { ... }
}
```

Không dùng `sleep(1)` vì trong lúc ngủ R5 không đọc RX, ký tự gõ vào sẽ bị trễ hoặc mất khi FIFO 16 byte đầy. Thay vào đó vòng lặp chạy liên tục, kiểm tra RX và đồng hồ `XTime_GetTime()` (timer TTC3, 100 MHz, 32 bit). Phép trừ kiểu `u32` vẫn đúng khi bộ đếm tràn.

### 6.4 Thanh ghi AXI UART Lite

Base `0x80000000`. Có thể đọc/ghi thử bằng xsdb (sau khi đã nạp bitstream và chạy `psu_ps_pl_*`):

| Offset | Thanh ghi | Ý nghĩa |
|---|---|---|
| 0x0 | RX FIFO | Đọc byte nhận được |
| 0x4 | TX FIFO | Ghi byte để gửi |
| 0x8 | STAT | bit 0: RX có dữ liệu, bit 2: TX FIFO rỗng, bit 3: TX FIFO đầy |
| 0xC | CTRL | bit 0: reset TX FIFO, bit 1: reset RX FIFO, bit 4: bật ngắt |

```tcl
targets -set -filter {name =~ "*R5*#0"}
mrd 0x80000008               ;# STAT, thường ra 00000004 (TX FIFO rỗng)
mwr 0x80000004 0x41          ;# gửi chữ 'A' ra CH340
```

Đây là truy cập qua cổng debug của R5. Nếu xsdb báo lỗi đọc/ghi ở địa chỉ này (tùy đường truy cập debug), bỏ qua phần thử này: code C trong `main.c` vẫn truy cập bình thường.

---

## 7. Các lỗi có thể gặp

| Hiện tượng | Nguyên nhân | Cách sửa |
|---|---|---|
| `FATAL: cannot open /dev/ttyUSB4` | CH340 chưa gắn vào VM, hoặc đổi tên thành `ttyUSB0` | VMware → Removable Devices → CH340 → Connect. Mở bằng `/dev/serial/by-id/usb-1a86_USB_Serial-if00-port0` |
| CH340 không có chữ, ttyUSB1 cũng không có | R5 chưa chạy | Kiểm tra bước 5–6 của mục 5.2. Trong xsdb gõ `targets` xem R5 #0 có *Running* không |
| ttyUSB1 có `[R5] OK...` nhưng CH340 không có chữ | Dây sai, hoặc PL chưa nạp | Dây chân 1 → **RXD** CH340, GND chân 9. Đã chạy `fpga -file` và `psu_ps_pl_*` chưa |
| R5 treo ở `Khoi tao AXI UART Lite` | R5 truy cập `0x80000000` khi PL chưa nạp hoặc chưa bỏ cách ly | Làm đủ bước 3 và 4 của mục 5.2 trước khi `con` |
| Gõ phím không thấy echo | Chưa nối TXD CH340 → chân 3 | Nối thêm dây (jumper CH340 ở 3.3V) |
| Build app: `XPAR_XUARTLITE_0_BASEADDR undeclared` | Platform tạo từ XSA không có AXI UART Lite | Tạo platform từ `build/kv260_r5_uartlite.xsa` |
| Vivado: `No ports matched 'uartlite_tx'` | Tên port trong block design khác `pins.xdc`, hoặc top không phải `system_wrapper` | Đổi tên port (cách C bước 7), Set as Top cho `system_wrapper` (bước 10) |
| Không có `build/kv260_r5_uartlite.xsa` sau cách C | Ô *Export to* gõ đường dẫn tương đối | `mv build/vivado/build/kv260_r5_uartlite.xsa build/` |
| `rst -processor`: `APB AP transaction error` | Chưa bật nguồn RPU | Bước 5 của mục 5.2 |

---

## 8. Tóm tắt lệnh

```bash
cd ~/linux/KV260/Share/04_PS_R5F_send_Uart_AXI_UartLite
source /home/bo/AMD/2026.1/Vitis/settings64.sh
make hw                # Vivado: bitstream + XSA (3-5 phút), hoặc Vivado GUI (mục 3)
make ide               # Vitis: platform kv260_r5_uartlite_platform + app hello_uartlite, Build

make console           # terminal 1: CH340
make console-ps        # terminal 2 (tùy chọn): PS UART1
xsdb                   # terminal 3
```

```tcl
connect
targets -set -filter {name =~ "PSU"}
mwr 0xff5e0200 0x0100
rst -system
after 2000

targets -set -filter {name =~ "APU*"}
source build/hw/psu_init.tcl
psu_init
fpga -file build/hw/kv260_r5_uartlite.bit
psu_ps_pl_isolation_removal
psu_ps_pl_reset_config

targets -set -filter {name =~ "PSU"}
mwr 0xffd80118 0x0000F400
mwr 0xffd80120 0x0000F400
after 500
mrd 0xffd80100                    ;# 00DFFC8F

targets -set -filter {name =~ "*R5*#0"}
rst -processor
dow vitis/hello_uartlite/build/hello_uartlite.elf
con                               ;# -> CH340: "Hello World from R5F (AXI UART Lite) #N"
```

---

## 9. Bước tiếp theo

1. **Dùng ngắt:** nối `axi_uartlite_0/interrupt` vào `pl_ps_irq0` của Zynq, R5 dùng `XScuGic` + `XUartLite_SetRecvHandler` để nhận bằng ngắt thay vì hỏi vòng.
2. **Nhiều UART:** thêm một AXI UART Lite nữa ra PMOD chân 5/7, R5 gửi 2 luồng khác nhau.
3. **Tự viết thanh ghi:** bỏ driver, đọc/ghi trực tiếp thanh ghi STAT/TX FIFO ở `0x80000000` (bảng ở mục 6.4).
4. **Ghép với PL tự viết:** thay AXI UART Lite bằng khối Verilog có giao tiếp AXI4-Lite tự viết.
