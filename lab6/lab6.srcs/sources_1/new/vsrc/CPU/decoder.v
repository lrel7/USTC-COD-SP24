module DECODER (
    input                   [31 : 0]            inst,

    output reg              [ 4 : 0]            alu_op,
    output reg              [31 : 0]            imm,

    output                  [ 4 : 0]            rf_ra0,
    output                  [ 4 : 0]            rf_ra1,
    output                  [ 4 : 0]            rf_wa,
    output reg              [ 0 : 0]            rf_we,
    output reg              [ 1 : 0]            rf_wd_sel,

    output reg              [ 0 : 0]            alu_src0_sel,
    output reg              [ 0 : 0]            alu_src1_sel,
    
    output reg              [ 3 : 0]            br_type, dmem_access,
    output reg              [ 0 : 0]            dmem_we
);

assign rf_ra0 = inst[19:15];  // rs1
assign rf_ra1 = inst[24:20];  // rs2
assign rf_wa  = inst[11: 7];  // rd

wire [6:0] opcode = inst[6:0];
wire [2:0] funct3 = inst[14:12];
wire [7:0] funct7 = inst[31:25];

always @(*) begin
    // set default values
    alu_op = `ADD; imm = 0; rf_we = 0; rf_wd_sel = 1; alu_src0_sel = 0; alu_src1_sel = 0;
    br_type = `NO_BR; dmem_access = 0; dmem_we = 0;

    case (opcode)  
        `R_TYPE: begin  // R-type
            alu_op = {inst[31:30], funct3};
            rf_we = 1;
        end
        `I_TYPE: begin  // I-type arithmetic
            alu_op = funct3 == 3'b101 ? {inst[31:30], funct3} : {2'b0, funct3};
            imm = {{20{inst[31]}}, inst[31:20]};
            rf_we = 1;
            alu_src1_sel = 1;
        end
        `LUI: begin  // lui
            alu_op = `SRC1;
            imm = {inst[31:12], 12'h0};
            rf_we = 1;
            alu_src1_sel = 1;
        end
        `AUIPC: begin  // auipc
            imm = {inst[31:12], 12'h0};
            rf_we = 1;
            alu_src0_sel = 1;
            alu_src1_sel = 1;
        end
        `LOAD: begin
            imm = {{20{inst[31]}}, inst[31:20]};
            rf_we = 1;
            rf_wd_sel = 2;  // alu_res
            alu_src1_sel = 1;  // imm
            dmem_access = {1'b0, funct3};
        end
        `S_TYPE: begin
            imm = {{20{inst[31]}}, inst[31:25], inst[11:7]};
            alu_src1_sel = 1;  // imm
            dmem_access = {1'b1, funct3};
            dmem_we = 1;
        end
        `B_TYPE: begin
            imm = {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};
            alu_src0_sel = 1;  // pc
            alu_src1_sel = 1;  // imm
            br_type = {1'b0, funct3};
        end
        `JAL: begin
            imm = {{12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0};
            rf_we = 1;
            rf_wd_sel = 0;  // pc_add4  
            alu_src0_sel = 1;  // pc
            alu_src1_sel = 1;  // imm
            br_type = `BR_JAL;
        end
        `JALR: begin
            imm = {{20{inst[31]}}, inst[31:20]};
            rf_we = 1;
            rf_wd_sel = 0;  // pc_add4  
            alu_src1_sel = 1;  // imm
            br_type = `BR_JALR;
        end
    endcase
end

endmodule