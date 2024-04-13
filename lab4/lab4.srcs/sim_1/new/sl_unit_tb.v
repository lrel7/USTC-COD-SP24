`timescale 1ns/1ps

`include "../../sources_1/new/vsrc/CPU/include/config.v"

module SL_UNIT_tb ();

reg [31:0] addr, rd_in, wd_in;
reg [3:0] dmem_access;
wire [31:0] rd_out, wd_out;

SL_UNIT sl_unit (
    .addr(addr),
    .dmem_access(dmem_access),
    .rd_in(rd_in),
    .wd_in(wd_in),
    .rd_out(rd_out),
    .wd_out(wd_out)
);

initial begin
    rd_in = 32'hab19cd58;
    wd_in = 32'hab19cd58;

    addr = 32'h10010040;
    dmem_access = `LW;
    #10;

    addr = 32'h10010046;
    dmem_access = `LH;
    #10;

    addr = 32'h10010055;
    dmem_access = `LHU;
    #10;

    addr = 32'h10010043;
    dmem_access = `LB;
    #10;

    addr = 32'h100def01;
    dmem_access = `LBU;
    #10;

    addr = 32'h10019588;
    dmem_access = `SW;
    #10;

    addr = 32'h12345065;
    dmem_access = `SH;
    #10;

    addr = 32'h15423222;
    dmem_access = `SB;
    #10;

    $finish;
end
    
endmodule