module REG_FILE (
    input  [ 0 : 0] clk,
    input  [ 4 : 0] rf_ra0,
    input  [ 4 : 0] rf_ra1,
    input  [ 4 : 0] rf_wa,
    input  [ 0 : 0] rf_we,
    input  [31 : 0] rf_wd,
    output [31 : 0] rf_rd0,
    output [31 : 0] rf_rd1,

    input  [ 4 : 0] dbg_reg_ra, 
    output [31 : 0] dbg_reg_rd
);

    reg [31 : 0] reg_file[0 : 31];

    // 用于初始化寄存器
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) 
            reg_file[i] = 0;
    end

    // Write
    always @(posedge clk) begin
        if (rf_wa != 0 && rf_we) begin  // never write reg 0
            reg_file[rf_wa] <= rf_wd;
        end
    end

    // Read
    assign rf_rd0 = reg_file[rf_ra0];
    assign rf_rd1 = reg_file[rf_ra1];

    // Debug
    assign dbg_reg_rd = reg_file[dbg_reg_ra];

endmodule