`timescale 1ns / 1ps
module ALU_tb();

reg [31:0] alu_src0, alu_src1;
reg [4:0] alu_op;
wire [31:0] alu_res;

ALU alu (
    .alu_src0(alu_src0),
    .alu_src1(alu_src1),
    .alu_op(alu_op),
    .alu_res(alu_res)
);

initial begin
    alu_src0 = 32'hb0123f10; alu_src1 = 32'h1958; alu_op = 5'h0;
    repeat(12) begin
        #20;
        alu_op = alu_op + 1;
    end
    $finish;
end

endmodule
