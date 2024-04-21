`timescale 1ns / 1ps

`define HALT                32'h00100073

module CPU_tb ();

// >>>>>>>>>>>>> CPU input signals <<<<<<<<<<<<<
reg clk = 1, rst;
reg global_en;
wire [31 : 0] imem_rdata, dmem_rdata;

// >>>>>>>>>>>>> CPU output signals <<<<<<<<<<<<<
wire [31 : 0] imem_raddr, dmem_addr, dmem_wdata;
wire dmem_we;

CPU cpu (
    .clk(clk),
    .rst(rst),
    .global_en(global_en),
    .imem_raddr(imem_raddr),
    .imem_rdata(imem_rdata),
    .dmem_rdata(dmem_rdata),
    .dmem_we(dmem_we),
    .dmem_addr(dmem_addr),
    .dmem_wdata(dmem_wdata),
    .debug_reg_ra(0)
);

INST_MEM inst_mem (
    .a(imem_raddr[10:2]),       // input wire [8 : 0] a
    .d(0),                      // input wire [31 : 0] d
    .clk(clk),                  // input wire clk
    .we(0),                     // input wire we
    .spo(imem_rdata)            // output wire [31 : 0] spo
);

DATA_MEM data_mem (
    .a(dmem_addr[10:2]),        // input wire [8 : 0] a
    .d(dmem_wdata),             // input wire [31 : 0] d
    .clk(clk),                  // input wire clk
    .we(dmem_we),               // input wire we
    .spo(dmem_rdata)            // output wire [31 : 0] spo
);

reg flag;
always #10 clk = ~clk;

initial begin
    rst = 1;
    global_en = 0;
    #100;

    rst = 0;
    global_en = 1;
    #100;
    
    while (imem_rdata != `HALT) begin
        #20;
    end
    
    global_en = 0;

    #100;
    $finish;
end

endmodule 