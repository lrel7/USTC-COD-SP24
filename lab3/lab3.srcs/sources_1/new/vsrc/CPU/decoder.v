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


module DECODER (
    input                   [31 : 0]            inst,

    output reg              [ 4 : 0]            alu_op,
    output reg              [31 : 0]            imm,

    output                  [ 4 : 0]            rf_ra0,
    output                  [ 4 : 0]            rf_ra1,
    output                  [ 4 : 0]            rf_wa,
    output reg              [ 0 : 0]            rf_we,

    output reg              [ 0 : 0]            alu_src0_sel,
    output reg              [ 0 : 0]            alu_src1_sel
);

assign rf_ra0 = inst[19:15];  // rs1
assign rf_ra1 = inst[24:20];  // rs2
assign rf_wa  = inst[11: 7];  // rd

wire [6:0] opcode = inst[6:0];
wire [2:0] funct3 = inst[14:12];
wire [7:0] funct7 = inst[31:25];

always @(*) begin
    case (opcode)  
        7'b011_0011: begin  // R-type
            case (funct3)  
                3'b000: alu_op = inst[30] ? `SUB : `ADD;
                3'b001: alu_op = `SLL;
                3'b010: alu_op = `SLT;
                3'b011: alu_op = `SLTU;
                3'b100: alu_op = `XOR;
                3'b101: alu_op = inst[30] ? `SRA : `SRL;
                3'b110: alu_op = `OR;
                3'b111: alu_op = `AND;
            endcase
            rf_we = 1;
            alu_src0_sel = 0;
            alu_src1_sel = 0;
        end
        7'b001_0011: begin  // I-type arithmetic
            case (funct3)  
                3'b000: alu_op = `ADD;
                3'b001: alu_op = `SLL;
                3'b010: alu_op = `SLT;
                3'b011: alu_op = `SLTU;
                3'b100: alu_op = `XOR;
                3'b101: alu_op = inst[30] ? `SRA : `SRL;
                3'b110: alu_op = `OR;
                3'b111: alu_op = `AND;
            endcase
            imm = {{20{inst[31]}}, inst[31:20]};
            rf_we = 1;
            alu_src0_sel = 0;
            alu_src1_sel = 1;
        end
        7'b011_0111: begin  // lui
            alu_op = `SRC1;
            imm = {inst[31:12], 12'h0};
            alu_src1_sel = 1;
            rf_we = 1;
        end
        7'b001_0111: begin  // auipc
            alu_op = `ADD; 
            imm = {inst[31:12], 12'h0};
            rf_we = 1;
            alu_src0_sel = 1;
            alu_src1_sel = 1;
        end
    endcase
end

endmodule