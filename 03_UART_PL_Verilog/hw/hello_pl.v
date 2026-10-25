// hello_pl.v - Khoi PL tu gui chuoi "Hello World" ra chan UART TX, khong can CPU.
//
//   hello_pl (dieu khien: moi PERIOD_MS gui 1 lan chuoi MSG)
//     └── uart_tx (8N1: 1 start bit, 8 data bit LSB truoc, 1 stop bit)
//
// Clock lay tu PS (pl_clk0 = 100 MHz), reset tu proc_sys_reset rst_pl_100M (muc thap).
// Chan tx noi ra PMOD J2 chan 1 -> RX cua CH340.

`timescale 1ns / 1ps

module uart_tx #(
    parameter CLK_HZ = 100_000_000,
    parameter BAUD   = 115_200
) (
    input  wire       clk,
    input  wire       resetn,
    input  wire [7:0] data,
    input  wire       start,    // xung 1 chu ky: bat dau gui 'data'
    output reg        busy,
    output reg        tx
);
    // So chu ky clock cho 1 bit: 100e6 / 115200 = 868 (sai so 0.004%)
    localparam integer CLKS_PER_BIT = (CLK_HZ + BAUD / 2) / BAUD;

    reg [15:0] clk_cnt;
    reg [3:0]  bit_idx;     // 0 = start, 1..8 = data, 9 = stop
    reg [9:0]  shifter;     // {stop, data[7:0], start}

    always @(posedge clk) begin
        if (!resetn) begin
            tx      <= 1'b1;            // UART nghi o muc 1
            busy    <= 1'b0;
            clk_cnt <= 0;
            bit_idx <= 0;
        end else if (!busy) begin
            if (start) begin
                shifter <= {1'b1, data, 1'b0};
                busy    <= 1'b1;
                clk_cnt <= 0;
                bit_idx <= 0;
                tx      <= 1'b0;        // start bit
            end
        end else if (clk_cnt == CLKS_PER_BIT - 1) begin
            clk_cnt <= 0;
            if (bit_idx == 9) begin
                busy <= 1'b0;           // da gui xong stop bit
            end else begin
                bit_idx <= bit_idx + 1;
                tx      <= shifter[bit_idx + 1];
            end
        end else begin
            clk_cnt <= clk_cnt + 1;
        end
    end
endmodule


module hello_pl #(
    parameter CLK_HZ    = 100_000_000,
    parameter BAUD      = 115_200,
    parameter PERIOD_MS = 1000
) (
    input  wire clk,
    input  wire resetn,
    output wire tx
);
    // \015\012 = "\r\n" (Verilog-2001 khong co escape \r, phai viet ma octal)
    localparam integer MSG_LEN = 31;
    localparam [8*MSG_LEN-1:0] MSG = "Hello World from PL (Verilog)\015\012";
    localparam integer PERIOD_CLKS = CLK_HZ / 1000 * PERIOD_MS;

    reg  [31:0] wait_cnt;
    reg  [5:0]  char_idx;
    reg         sending;
    reg         start;
    wire        busy;

    // Ky tu thu i cua chuoi (ky tu dau tien nam o byte cao nhat)
    wire [7:0] cur_char = MSG[8 * (MSG_LEN - 1 - char_idx) +: 8];

    uart_tx #(.CLK_HZ(CLK_HZ), .BAUD(BAUD)) u_tx (
        .clk(clk), .resetn(resetn),
        .data(cur_char), .start(start),
        .busy(busy), .tx(tx)
    );

    always @(posedge clk) begin
        start <= 1'b0;
        if (!resetn) begin
            wait_cnt <= 0;
            char_idx <= 0;
            sending  <= 1'b0;
        end else if (!sending) begin
            // Cho het chu ky roi bat dau gui chuoi
            if (wait_cnt == PERIOD_CLKS - 1) begin
                wait_cnt <= 0;
                char_idx <= 0;
                sending  <= 1'b1;
            end else begin
                wait_cnt <= wait_cnt + 1;
            end
        end else if (!busy && !start) begin
            // uart_tx ranh: gui ky tu tiep theo hoac ket thuc chuoi
            if (char_idx == MSG_LEN) begin
                sending <= 1'b0;
            end else begin
                start <= 1'b1;
            end
        end else if (start) begin
            char_idx <= char_idx + 1;   // ky tu vua duoc uart_tx nhan
        end
    end
endmodule
