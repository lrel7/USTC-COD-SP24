`define ADD                 5'B00000    
`define SUB                 5'B00001  
`define SLT                 5'B00010
`define SLTU                5'B00011
`define AND                 5'B00100
`define OR                  5'B00101
`define XOR                 5'B00110
`define SLL                 5'B00111
`define SRL                 5'B01000
`define SRA                 5'B01001 
`define SRC0                5'B01010
`define SRC1                5'B01011

module ALU (
    input                   [31 : 0]            alu_src0,
    input                   [31 : 0]            alu_src1,
    input                   [ 4 : 0]            alu_op,
    output      reg         [31 : 0]            alu_res
);

always @(*) begin
    case(alu_op)
        `ADD:
            alu_res = alu_src0 + alu_src1;
        `SUB:
            alu_res = alu_src0 - alu_src1;
        `SLT:
            alu_res = $signed(alu_src0) < $signed(alu_src1);
        `SLTU:
            alu_res = alu_src0 < alu_src1;
        `AND:
            alu_res = alu_src0 & alu_src1;
        `OR:
            alu_res = alu_src0 | alu_src1;
        `XOR:
            alu_res = alu_src0 ^ alu_src1;
        `SLL:
            alu_res = alu_src0 << (alu_src1[4 : 0]);
        `SRL:
            alu_res = alu_src0 >> (alu_src1[4 : 0]);
        `SRA:
            alu_res = $signed(alu_src0) >>> (alu_src1[4 : 0]);
        `SRC0:
            alu_res = alu_src0;
        `SRC1:
            alu_res = alu_src1;
        default :
            alu_res = 32'H0;
    endcase
end

endmodule
