`timescale 1ns / 1ps

module DECODER_tb();

reg [31 : 0] inst;
wire [31 : 0] imm;
wire [4 : 0] alu_op, rf_ra0, rf_ra1, rf_wa;
wire rf_we, alu_src0_sel, alu_src1_sel;

DECODER decoder (
    .inst(inst),
    .alu_op(alu_op),
    .imm(imm),
    .rf_ra0(rf_ra0),
    .rf_ra1(rf_ra1),
    .rf_wa(rf_wa),
    .rf_we(rf_we),
    .alu_src0_sel(alu_src0_sel),
    .alu_src1_sel(alu_src1_sel)
);

initial begin
    inst = 32'hffc00213;  
    #10;
    inst = 32'h004202b3;
    #10;
    inst = 32'h40520333;
    #10;
    inst = 32'h006223b3;
    #10;
    inst = 32'h00623433;
    #10;
    inst = 32'h000074b7;
    #10;
    inst = 32'h00008537;
    #10;
    inst = 32'h00c00593;
    #10;
    inst = 32'h00b4d4b3;
    #10;
    inst = 32'h00c55513;
    #10;
    inst = 32'h00a4f5b3;
    #10;
    inst = 32'h00a4e633;
    #10;
    inst = 32'h00a4c6b3;
    #10;
    inst = 32'hfff9c717;
    #10;
    inst = 32'h40e00733;
    #10;
    inst = 32'h00171713;
    #10;
    inst = 32'h40175713;
    #10;
    inst = 32'h40975733;
    #10;
    inst = 32'h00a71733;
    #10;
    inst = 32'h07b77793;
    #10;
    inst = 32'h0ea76813;
    #10;
    inst = 32'h15974893;
    #10;
    inst = 32'h00122913;
    #10;
    inst = 32'h0012b993;
    #10;
    inst = 32'h00100073;
    #10;
    $finish;
end

endmodule
