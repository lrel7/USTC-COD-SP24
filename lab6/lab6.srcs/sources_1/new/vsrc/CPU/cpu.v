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

/* Stall and flush */
wire stall_pc, stall_if_id, stall_id_ex;
wire flush_pc, flush_if_id, flush_id_ex;

/* IF */
wire [31 : 0] pc_if, pc_add4_if, inst_if;

/* ID */
wire [31 : 0] pc_id, pc_add4_id, inst_id, rf_rd0_id, rf_rd1_id, imm_id;
wire [ 4 : 0] alu_op_id, rf_ra0_id, rf_ra1_id, rf_wa_id;
wire [ 3 : 0] br_type_id, dmem_access_id;
wire [ 1 : 0] rf_wd_sel_id;
wire alu_src0_sel_id, alu_src1_sel_id, rf_we_id, dmem_we_id;

/* EX */
wire [31 : 0] pc_ex, pc_add4_ex, pc_j_ex, inst_ex, npc_ex, rf_rd0_ex, rf_rd1_ex, imm_ex, alu_src0_ex, alu_src1_ex, alu_res_ex;
wire [31 : 0] rf_rd0_raw_ex, rf_rd1_raw_ex;
wire [ 4 : 0] alu_op_ex, rf_wa_ex, rf_ra0_ex, rf_ra1_ex;
wire [ 3 : 0] br_type_ex, dmem_access_ex;
wire [ 1 : 0] npc_sel_ex, rf_wd_sel_ex;
wire alu_src0_sel_ex, alu_src1_sel_ex, rf_we_ex, dmem_we_ex;

/* MEM */
wire [31 : 0] pc_mem, pc_add4_mem, inst_mem, rf_rd1_mem, alu_res_mem, dmem_rdata_mem, dmem_wdata_mem, dmem_rd_out_mem;
wire [ 4 : 0] rf_wa_mem;
wire [ 3 : 0] dmem_access_mem;
wire [ 1 : 0] rf_wd_sel_mem;
wire rf_we_mem, dmem_we_mem;

/* WB */
wire [31 : 0] pc_wb, pc_add4_wb, inst_wb, alu_res_wb, dmem_addr_wb, dmem_wdata_wb, dmem_rd_out_wb, rf_wd_wb;
wire [ 4 : 0] rf_wa_wb;
wire [ 1 : 0] rf_wd_sel_wb;
wire rf_we_wb, dmem_we_wb;

/* Hazard */
wire [ 1 : 0] forward_a, forward_b;

/* Read instruction from INST_MEM */
assign imem_raddr = pc_if;          
assign inst_if = imem_rdata;        

/* Read data from DATA_MEM */
assign dmem_addr = alu_res_mem;     
assign dmem_rdata_mem = dmem_rdata;

/* Write data to DATA_MEM */
assign dmem_we = dmem_we_mem;
assign dmem_wdata = dmem_wdata_mem;


PC_ADD4 pcadd4 (
    .pc(pc_if),
    .pc_add4(pc_add4_if)
);

PC_AND pcand (
    .pc(alu_res_ex),
    .pc_and(pc_j_ex)
);

MUX41 npc_mux (
    .src0(pc_add4_if),
    .src1(alu_res_ex),      // pc_offset
    .src2(pc_j_ex),
    .src3(0),
    .sel(npc_sel_ex),
    .res(npc_ex)
);

PC my_pc (
    .clk(clk),
    .rst(rst),
    .en(global_en),
    .stall(stall_pc),
    .npc(npc_ex),
    .pc(pc_if)
);

DECODER decoder (
    .inst(inst_id),
    .alu_op(alu_op_id),
    .imm(imm_id),
    .rf_ra0(rf_ra0_id),
    .rf_ra1(rf_ra1_id),
    .rf_wa(rf_wa_id),
    .rf_we(rf_we_id),
    .rf_wd_sel(rf_wd_sel_id),
    .alu_src0_sel(alu_src0_sel_id),
    .alu_src1_sel(alu_src1_sel_id),
    .br_type(br_type_id),
    .dmem_access(dmem_access_id),
    .dmem_we(dmem_we_id)
);

REG_FILE reg_file (
    .clk(clk),
    .rf_ra0(rf_ra0_id),
    .rf_ra1(rf_ra1_id),
    .rf_wa(rf_wa_wb),
    .rf_we(rf_we_wb),
    .rf_wd(rf_wd_wb),
    .rf_rd0(rf_rd0_id),
    .rf_rd1(rf_rd1_id),
    .dbg_reg_ra(debug_reg_ra),
    .dbg_reg_rd(debug_reg_rd)
);

BRANCH branch (
    .br_type(br_type_ex),
    .br_src0(rf_rd0_ex),
    .br_src1(rf_rd1_ex),
    .npc_sel(npc_sel_ex)
);

MUX41 alu_src0_forwarding_mux (
    .src0(rf_rd0_raw_ex),
    .src1(rf_wd_wb),     
    .src2(alu_res_mem),
    .src3(0),
    .sel(forward_a),
    .res(rf_rd0_ex)
);

MUX41 alu_src1_forwarding_mux (
    .src0(rf_rd1_raw_ex),
    .src1(rf_wd_wb),     
    .src2(alu_res_mem),
    .src3(0),
    .sel(forward_b),
    .res(rf_rd1_ex)
);

MUX21 alu_src0_mux (
    .src0(rf_rd0_ex),
    .src1(pc_ex),
    .sel(alu_src0_sel_ex),
    .res(alu_src0_ex)
);

MUX21 alu_src1_mux (
    .src0(rf_rd1_ex),
    .src1(imm_ex),
    .sel(alu_src1_sel_ex),
    .res(alu_src1_ex)
);

ALU alu (
    .alu_src0(alu_src0_ex),
    .alu_src1(alu_src1_ex),
    .alu_op(alu_op_ex),
    .alu_res(alu_res_ex)
);

SL_UNIT sl_unit (
    .addr(alu_res_mem),
    .dmem_access(dmem_access_mem),
    .rd_in(dmem_rdata_mem),
    .wd_in(rf_rd1_mem),
    .rd_out(dmem_rd_out_mem),
    .wd_out(dmem_wdata_mem)
);

MUX41 rf_wd_mux (
    .src0(pc_add4_wb),
    .src1(alu_res_wb),
    .src2(dmem_rd_out_wb),
    .src3(0),
    .sel(rf_wd_sel_wb),
    .res(rf_wd_wb)
);


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> SEGMENT REG <<<<<<<<<<<<<<<<<<<<<<<<<<<<
SEG_REG if_id (
    .clk(clk),
    .rst(rst),
    .flush(flush_if_id),
    .stall(stall_if_id),

    .pc_in(pc_if),
    .pc_out(pc_id),
    .pc_add4_in(pc_add4_if),
    .pc_add4_out(pc_add4_id),
    .inst_in(inst_if),
    .inst_out(inst_id),

    .rf_rd0_in(0),
    .rf_rd1_in(0),
    .imm_in(0),
    .alu_op_in(0),
    .rf_wa_in(0),
    .rf_ra0_in(0),
    .rf_ra1_in(0),
    .br_type_in(0),
    .dmem_access_in(0),
    .rf_wd_sel_in(0),
    .alu_src0_sel_in(0),
    .alu_src1_sel_in(0),
    .rf_we_in(0),
    .dmem_we_in(0),
    .alu_res_in(0),
    .dmem_rd_out_in(0),

    .commit_in(commit_if),
    .commit_out(commit_id),
    .dmem_addr_in(0),
    .dmem_wdata_in(0)
);

SEG_REG id_ex (
    .clk(clk),
    .rst(rst),
    .flush(flush_id_ex),
    .stall(0),

    .pc_in(pc_id),
    .pc_out(pc_ex),
    .pc_add4_in(pc_add4_id),
    .pc_add4_out(pc_add4_ex),
    .inst_in(inst_id),
    .inst_out(inst_ex),
    .rf_rd0_in(rf_rd0_id),
    .rf_rd0_out(rf_rd0_raw_ex),
    .rf_rd1_in(rf_rd1_id),
    .rf_rd1_out(rf_rd1_raw_ex),
    .imm_in(imm_id),
    .imm_out(imm_ex),
    .alu_op_in(alu_op_id),
    .alu_op_out(alu_op_ex),
    .rf_wa_in(rf_wa_id),
    .rf_wa_out(rf_wa_ex),
    .rf_ra0_in(rf_ra0_id),
    .rf_ra0_out(rf_ra0_ex),
    .rf_ra1_in(rf_ra1_id),
    .rf_ra1_out(rf_ra1_ex),
    .br_type_in(br_type_id),
    .br_type_out(br_type_ex),
    .dmem_access_in(dmem_access_id),
    .dmem_access_out(dmem_access_ex),
    .rf_wd_sel_in(rf_wd_sel_id),
    .rf_wd_sel_out(rf_wd_sel_ex),
    .alu_src0_sel_in(alu_src0_sel_id),
    .alu_src0_sel_out(alu_src0_sel_ex),
    .alu_src1_sel_in(alu_src1_sel_id),
    .alu_src1_sel_out(alu_src1_sel_ex),
    .rf_we_in(rf_we_id),
    .rf_we_out(rf_we_ex),
    .dmem_we_in(dmem_we_id),
    .dmem_we_out(dmem_we_ex),

    .alu_res_in(0),
    .dmem_rd_out_in(0),

    .commit_in(commit_id),
    .commit_out(commit_ex),
    .dmem_addr_in(0),
    .dmem_wdata_in(0)
);

SEG_REG ex_mem (
    .clk(clk),
    .rst(rst),
    .flush(0),
    .stall(0),

    .pc_in(pc_ex),
    .pc_out(pc_mem),
    .pc_add4_in(pc_add4_ex),
    .pc_add4_out(pc_add4_mem),
    .inst_in(inst_ex),
    .inst_out(inst_mem),
    .rf_rd1_in(rf_rd1_ex),
    .rf_rd1_out(rf_rd1_mem),
    .rf_wa_in(rf_wa_ex),
    .rf_wa_out(rf_wa_mem),
    .dmem_access_in(dmem_access_ex),
    .dmem_access_out(dmem_access_mem),
    .rf_wd_sel_in(rf_wd_sel_ex),
    .rf_wd_sel_out(rf_wd_sel_mem),
    .rf_we_in(rf_we_ex),
    .rf_we_out(rf_we_mem),
    .dmem_we_in(dmem_we_ex),
    .dmem_we_out(dmem_we_mem),
    .alu_res_in(alu_res_ex),
    .alu_res_out(alu_res_mem),

    .rf_rd0_in(0),
    .imm_in(0),
    .alu_op_in(0),
    .br_type_in(0),
    .alu_src0_sel_in(0),
    .alu_src1_sel_in(0),
    .dmem_rd_out_in(0),

    .commit_in(commit_ex),
    .commit_out(commit_mem),
    .dmem_addr_in(0),
    .dmem_wdata_in(0)
);

SEG_REG mem_wb (
    .clk(clk),
    .rst(rst),
    .flush(0),
    .stall(0),

    .pc_in(pc_mem),
    .pc_out(pc_wb),
    .pc_add4_in(pc_add4_mem),
    .pc_add4_out(pc_add4_wb),
    .inst_in(inst_mem),
    .inst_out(inst_wb),
    .rf_wa_in(rf_wa_mem),
    .rf_wa_out(rf_wa_wb),
    .rf_wd_sel_in(rf_wd_sel_mem),
    .rf_wd_sel_out(rf_wd_sel_wb),
    .rf_we_in(rf_we_mem),
    .rf_we_out(rf_we_wb),
    .alu_res_in(alu_res_mem),
    .alu_res_out(alu_res_wb),
    .dmem_rd_out_in(dmem_rd_out_mem),
    .dmem_rd_out_out(dmem_rd_out_wb),

    .rf_rd0_in(0),
    .rf_rd1_in(0),
    .imm_in(0),
    .alu_op_in(0),
    .br_type_in(0),
    .dmem_access_in(0),
    .alu_src0_sel_in(0),
    .alu_src1_sel_in(0),

    .commit_in(commit_mem),
    .commit_out(commit_wb),
    .dmem_addr_in(dmem_addr),
    .dmem_addr_out(dmem_addr_wb),
    .dmem_wdata_in(dmem_wdata_mem),
    .dmem_wdata_out(dmem_wdata_wb),
    .dmem_we_in(dmem_we_mem),
    .dmem_we_out(dmem_we_wb)
);


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> HAZARD <<<<<<<<<<<<<<<<<<<<<<<<<<<<
Forwarding forwarding (
    .rf_we_mem(rf_we_mem),
    .rf_we_wb(rf_we_wb),
    .rf_wa_mem(rf_wa_mem),
    .rf_wa_wb(rf_wa_wb),
    .rf_ra0_ex(rf_ra0_ex),
    .rf_ra1_ex(rf_ra1_ex),
    .rf_rd0_fe(forward_a),
    .rf_rd1_fe(forward_b)
);

SEG_CTRL seg_ctrl (
    .rf_we_ex(rf_we_ex),
    .rf_wd_sel_ex(rf_wd_sel_ex),
    .npc_sel_ex(npc_sel_ex),
    .rf_wa_ex(rf_wa_ex),
    .rf_ra0_id(rf_ra0_id),
    .rf_ra1_id(rf_ra1_id),
    .stall_pc(stall_pc),
    .stall_if_id(stall_if_id),
    .flush_if_id(flush_if_id),
    .flush_id_ex(flush_id_ex)
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

wire commit_if, commit_id, commit_ex, commit_mem, commit_wb;
assign commit_if = 1'H1;    // 这个信号需要经过 IF/ID、ID/EX、EX/MEM、MEM/WB 段间寄存器，最终连接到 commit_reg 上

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
        // 这里右侧的信号都是 MEM/WB 段间寄存器的输出
        commit_reg          <= commit_wb;
        commit_pc_reg       <= pc_wb;
        commit_inst_reg     <= inst_wb;
        commit_halt_reg     <= inst_wb == `HALT;
        commit_reg_we_reg   <= rf_we_wb;
        commit_reg_wa_reg   <= rf_wa_wb;
        commit_reg_wd_reg   <= rf_wd_wb;
        commit_dmem_we_reg  <= dmem_we_wb;
        commit_dmem_wa_reg  <= dmem_addr_wb;
        commit_dmem_wd_reg  <= dmem_wdata_wb;
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
