`include "include/config.v"

module CPU (
    input                   [ 0 : 0]            clk,
    input                   [ 0 : 0]            rst,

    input                   [ 0 : 0]            global_en,

/* ------------------------------ Memory (inst) ----------------------------- */
    output                  [31 : 0]            imem_raddr,
    input                   [31 : 0]            imem_rdata,

/* ------------------------------ Memory (data) ----------------------------- */
    input                   [31 : 0]            dmem_rdata,
    output                  [ 0 : 0]            dmem_we,
    output                  [31 : 0]            dmem_addr,
    output                  [31 : 0]            dmem_wdata,

/* ---------------------------------- Debug --------------------------------- */
    output                  [ 0 : 0]            commit,
    output                  [31 : 0]            commit_pc,
    output                  [31 : 0]            commit_inst,
    output                  [ 0 : 0]            commit_halt,
    output                  [ 0 : 0]            commit_reg_we,
    output                  [ 4 : 0]            commit_reg_wa,
    output                  [31 : 0]            commit_reg_wd,
    output                  [ 0 : 0]            commit_dmem_we,
    output                  [31 : 0]            commit_dmem_wa,
    output                  [31 : 0]            commit_dmem_wd,

    input                   [ 4 : 0]            debug_reg_ra,
    output                  [31 : 0]            debug_reg_rd
);

wire [31 : 0] pc_add4, pc_j, pc, npc, inst, imm, alu_src0, alu_src1, alu_res, rf_rd0, rf_rd1, rf_wd, dmem_rd_out;
wire [1 : 0] npc_sel, rf_wd_sel;
wire [3 : 0] br_type, dmem_access;
wire [4 : 0] alu_op, rf_ra0, rf_ra1, rf_wa;
wire rf_we, alu_src0_sel, alu_src1_sel;

assign imem_raddr = pc;  // read instruction
assign dmem_addr = alu_res;  // read data

PC_ADD4 pcadd4 (
    .pc(pc),
    .pc_add4(pc_add4)
);

PC_AND pcand (
    .pc(alu_res),
    .pc_and(pc_j)
);

MUX41 npc_mux (
    .src0(pc_add4),
    .src1(alu_res),  // pc_offset
    .src2(pc_j),
    .src3(0),
    .sel(npc_sel),
    .res(npc)
);

PC my_pc (
    .clk(clk),
    .rst(rst),
    .en(global_en),
    .npc(npc),
    .pc(pc)
);

DECODER decoder (
    .inst(imem_rdata),
    .alu_op(alu_op),
    .imm(imm),
    .rf_ra0(rf_ra0),
    .rf_ra1(rf_ra1),
    .rf_wa(rf_wa),
    .rf_we(rf_we),
    .rf_wd_sel(rf_wd_sel),
    .alu_src0_sel(alu_src0_sel),
    .alu_src1_sel(alu_src1_sel),
    .br_type(br_type),
    .dmem_access(dmem_access),
    .dmem_we(dmem_we)
);

REG_FILE reg_file (
    .clk(clk),
    .rf_ra0(rf_ra0),
    .rf_ra1(rf_ra1),
    .rf_wa(rf_wa),
    .rf_we(rf_we),
    .rf_wd(rf_wd),
    .rf_rd0(rf_rd0),
    .rf_rd1(rf_rd1),
    .dbg_reg_ra(debug_reg_ra),
    .dbg_reg_rd(debug_reg_rd)
);

BRANCH branch (
    .br_type(br_type),
    .br_src0(rf_rd0),
    .br_src1(rf_rd1),
    .npc_sel(npc_sel)
);

MUX21 alu_src0_mux (
    .src0(rf_rd0),
    .src1(pc),
    .sel(alu_src0_sel),
    .res(alu_src0)
);

MUX21 alu_src1_mux (
    .src0(rf_rd1),
    .src1(imm),
    .sel(alu_src1_sel),
    .res(alu_src1)
);

ALU alu (
    .alu_src0(alu_src0),
    .alu_src1(alu_src1),
    .alu_op(alu_op),
    .alu_res(alu_res)
);

MUX41 rf_wd_mux (
    .src0(pc_add4),
    .src1(alu_res),
    .src2(dmem_rd_out),
    .src3(0),
    .sel(rf_wd_sel),
    .res(rf_wd)
);

SL_UNIT sl_unit (
    .addr(alu_res),
    .dmem_access(dmem_access),
    .rd_in(dmem_rdata),
    .wd_in(rf_rd1),
    .rd_out(dmem_rd_out),
    .wd_out(dmem_wdata)
);


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DEBUG <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
reg  [ 0 : 0]   commit_reg          ;
reg  [31 : 0]   commit_pc_reg       ;
reg  [31 : 0]   commit_inst_reg     ;
reg  [ 0 : 0]   commit_halt_reg     ;
reg  [ 0 : 0]   commit_reg_we_reg   ;
reg  [ 4 : 0]   commit_reg_wa_reg   ;
reg  [31 : 0]   commit_reg_wd_reg   ;
reg  [ 0 : 0]   commit_dmem_we_reg  ;
reg  [31 : 0]   commit_dmem_wa_reg  ;
reg  [31 : 0]   commit_dmem_wd_reg  ;

always @(posedge clk) begin
    if (rst) begin
        commit_reg          <= 1'H0;
        commit_pc_reg       <= 32'H0;
        commit_inst_reg     <= 32'H0;
        commit_halt_reg     <= 1'H0;
        commit_reg_we_reg   <= 1'H0;
        commit_reg_wa_reg   <= 5'H0;
        commit_reg_wd_reg   <= 32'H0;
        commit_dmem_we_reg  <= 1'H0;
        commit_dmem_wa_reg  <= 32'H0;
        commit_dmem_wd_reg  <= 32'H0;
    end
    else if (global_en) begin
        // !!!! 请注意根据自己的具体实现替换 <= 右侧的信号 !!!!
        commit_reg          <= 1'H1;                        // 不需要改动
        commit_pc_reg       <= pc;                          // 需要为当前的 PC
        commit_inst_reg     <= imem_rdata;                  // 需要为当前的指令
        commit_halt_reg     <= imem_rdata == `HALT;         // 注意！请根据指令集设置 HALT_INST！
        commit_reg_we_reg   <= rf_we;                       // 需要为当前的寄存器堆写使能
        commit_reg_wa_reg   <= rf_wa;                       // 需要为当前的寄存器堆写地址
        commit_reg_wd_reg   <= alu_res;                     // 需要为当前的寄存器堆写数据
        commit_dmem_we_reg  <= 0;                           // 不需要改动
        commit_dmem_wa_reg  <= 0;                           // 不需要改动
        commit_dmem_wd_reg  <= 0;                           // 不需要改动
    end
end

assign commit               = commit_reg;
assign commit_pc            = commit_pc_reg;
assign commit_inst          = commit_inst_reg;
assign commit_halt          = commit_halt_reg;
assign commit_reg_we        = commit_reg_we_reg;
assign commit_reg_wa        = commit_reg_wa_reg;
assign commit_reg_wd        = commit_reg_wd_reg;
assign commit_dmem_we       = commit_dmem_we_reg;
assign commit_dmem_wa       = commit_dmem_wa_reg;
assign commit_dmem_wd       = commit_dmem_wd_reg;

endmodule
