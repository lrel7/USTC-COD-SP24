`timescale 1ns / 1ps

`define HALT                32'h00100073

module CPU_tb ();

// >>>>>>>>>>>>> CPU input signals <<<<<<<<<<<<<
reg clk = 0, rst;
wire global_en;
wire [31 : 0] imem_rdata, dmem_rdata;
reg [ 4 : 0] debug_reg_ra;

// >>>>>>>>>>>>> CPU output signals <<<<<<<<<<<<<
wire [31 : 0] imem_raddr, dmem_addr, dmem_wdata, commit_pc, commit_inst, commit_reg_wd, commit_dmem_wa, commit_dmem_wd, debug_reg_rd;
wire dmem_we, commit, commit_halt, commit_reg_wa, commit_dmem_we;

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
    .commit(commit),
    .commit_pc(commit_pc),
    .commit_inst(commit_inst),
    .commit_halt(commit_halt),
    .commit_reg_we(commit_reg_we),
    .commit_reg_wa(commit_reg_wa),
    .commit_reg_wd(commit_reg_wd),
    .commit_dmem_we(commit_dmem_we),
    .commit_dmem_wa(commit_dmem_wa),
    .commit_dmem_wd(commit_dmem_wd),
    .debug_reg_ra(debug_reg_ra),
    .debug_reg_rd(debug_reg_rd)
);

INST_MEM inst_mem (
    .a(imem_raddr[10:2]),      // input wire [8 : 0] a
    .d(0),                    // input wire [31 : 0] d
    .clk(clk),                // input wire clk
    .we(0),                   // input wire we
    .spo(imem_rdata)          // output wire [31 : 0] spo
);

always #5 clk = ~clk;
assign global_en = ~(imem_rdata == `HALT);

initial begin
    rst = 1;
    #20;
    rst = 0;
    #300;
    $finish;
end

endmodule 