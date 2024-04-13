`ifndef _CONFIG_V_
`define _CONFIG_V_

// PC init/reset address
`define PC_INIT             32'h003F_FFFC

// halt instruction
`define HALT                32'H00100073

// inst opcode
`define R_TYPE              7'b011_0011
`define I_TYPE              7'b001_0011
`define S_TYPE              7'b010_0011
`define B_TYPE              7'b110_0011
`define AUIPC               7'b001_0111
`define LUI                 7'b011_0111
`define LOAD                7'b000_0011
`define JAL                 7'b110_1111
`define JALR                7'b110_0111

// logic type
`define ADD                 5'B00000    
`define SUB                 5'B01000  
`define SLT                 5'B00010
`define SLTU                5'B00011
`define AND                 5'B00111
`define OR                  5'B00110
`define XOR                 5'B00100
`define SLL                 5'B00001
`define SRL                 5'B00101
`define SRA                 5'B01101
`define SRC0                5'B01010
`define SRC1                5'B01011

// br_type
`define BEQ                 4'b0000
`define BNE                 4'b0001
`define BLT                 4'b0100
`define BGE                 4'b0101
`define BLTU                4'b0110
`define BGEU                4'b0111
`define BR_JAL              4'b0010  
`define BR_JALR             4'b0011
`define NO_BR               4'b1000  // don't branch

// dmem_access
`define LB                  4'b0000
`define LBU                 4'b0100
`define LH                  4'b0001
`define LHU                 4'b0101
`define LW                  4'b0010
`define SB                  4'b1000
`define SH                  4'b1001
`define SW                  4'b1010

`endif

