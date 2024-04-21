`include "include/config.v"

module SEG_REG (
    input                   clk, rst, flush, stall,

    /* IF/ID */
    input       [31 : 0]    pc_in, pc_add4_in, inst_in,
    output reg  [31 : 0]    pc_out, pc_add4_out, inst_out,

    /* ID/EX */
    input       [31 : 0]    rf_rd0_in, rf_rd1_in, imm_in,
    output reg  [31 : 0]    rf_rd0_out, rf_rd1_out, imm_out,
    input       [ 4 : 0]    alu_op_in, rf_wa_in,
    output reg  [ 4 : 0]    alu_op_out, rf_wa_out,
    input       [ 3 : 0]    br_type_in, dmem_access_in,
    output reg  [ 3 : 0]    br_type_out, dmem_access_out,
    input       [ 1 : 0]    rf_wd_sel_in,
    output reg  [ 1 : 0]    rf_wd_sel_out,
    input                   alu_src0_sel_in, alu_src1_sel_in, rf_we_in, dmem_we_in,
    output reg              alu_src0_sel_out, alu_src1_sel_out, rf_we_out, dmem_we_out,

    /* EX/MEM */
    input       [31 : 0]    alu_res_in,
    output reg  [31 : 0]    alu_res_out,

    /* MEM/WB */
    input       [31 : 0]    dmem_rd_out_in,
    output reg  [31 : 0]    dmem_rd_out_out
);

initial begin
    pc_out <= 32'h0;
    pc_add4_out <= 32'h0;
    inst_out <= 32'h0;
    rf_rd0_out <= 32'h0;
    rf_rd1_out <= 32'h0;
    imm_out <= 32'h0;
    alu_op_out <= 5'h0;
    rf_wa_out <= 5'h0;
    br_type_out <= 4'h0;
    dmem_access_out <= 0;
    rf_wd_sel_out <= 2'b01;
    alu_src0_sel_out <= 1'b0;
    alu_src1_sel_out <= 1'b1;
    rf_we_out <= 1'b1;
    dmem_we_out <= 1'b0;
    alu_res_out <= 32'h0;
    dmem_rd_out_out <= 32'h0;
end

always @(posedge clk or posedge rst) begin
    if (rst) begin  // 异步清空
        // addi x0, x0, 0
        // pc_out <= 32'h0;
        // pc_add4_out <= 32'h0;
        inst_out <= `NOP;

        rf_rd0_out <= 32'h0;
        rf_rd1_out <= 32'h0;
        imm_out <= 32'h0;
        alu_op_out <= `ADD;
        rf_wa_out <= 5'h0;
        br_type_out <= `NO_BR;
        dmem_access_out <= 0;
        rf_wd_sel_out <= 2'b01;
        alu_src0_sel_out <= 1'b0;
        alu_src1_sel_out <= 1'b1;
        rf_we_out <= 1'b1;
        dmem_we_out <= 1'b0;

        alu_res_out <= 32'h0;

        dmem_rd_out_out <= 32'h0;
    end else begin
        if (flush) begin  // 同步清空
            // addi x0, x0, 0
            // pc_out <= 32'h0;
            // pc_add4_out <= 32'h0;
            inst_out <= `NOP;

            rf_rd0_out <= 32'h0;
            rf_rd1_out <= 32'h0;
            imm_out <= 32'h0;
            alu_op_out <= `ADD;
            rf_wa_out <= 5'h0;
            br_type_out <= `NO_BR;
            dmem_access_out <= 0;
            rf_wd_sel_out <= 2'b01;
            alu_src0_sel_out <= 1'b0;
            alu_src1_sel_out <= 1'b1;
            rf_we_out <= 1'b1;
            dmem_we_out <= 1'b0;

            alu_res_out <= 32'h0;

            dmem_rd_out_out <= 32'h0;
        end else if (!stall) begin
            pc_out <= pc_in;
            pc_add4_out <= pc_add4_in;
            inst_out <= inst_in;

            rf_rd0_out <= rf_rd0_in;
            rf_rd1_out <= rf_rd1_in;
            imm_out <= imm_in;
            alu_op_out <= alu_op_in;
            rf_wa_out <= rf_wa_in;
            br_type_out <= br_type_in;
            dmem_access_out <= dmem_access_in;
            rf_wd_sel_out <= rf_wd_sel_in;
            alu_src0_sel_out <= alu_src0_sel_in;
            alu_src1_sel_out <= alu_src1_sel_in;
            rf_we_out <= rf_we_in;
            dmem_we_out <= dmem_we_in;

            alu_res_out <= alu_res_in;

            dmem_rd_out_out <= dmem_rd_out_in;
        end
    end
end

endmodule //seg_reg