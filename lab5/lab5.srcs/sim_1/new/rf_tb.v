`timescale 1ns / 1ps

module RF_tb();

reg clk = 1;
always #5 clk = ~clk;

reg [4 : 0] ra1, ra2, wa;
reg we;
reg [31 : 0] din;
wire [31 : 0] dout1, dout2;

REG_FILE rf (
    .clk(clk),
    .rf_ra0(ra1),
    .rf_ra1(ra2),
    .rf_wa(wa),
    .rf_we(we),
    .rf_wd(din),
    .rf_rd0(dout1),
    .rf_rd1(dout2),
    .dbg_reg_ra(0)
);

initial begin
    // 向R31写入100, 同时读出R0和R31 (应读出0和100)
    ra1 = 0;
    ra2 = 31;
    wa = 31;
    we = 1;
    din = 100; 
    #10;

    // 向R18写入9, 同时读出R18和R31 (应读出9和100)
    ra1 = 18;
    wa = 18;
    din = 9;
    #10;

    // 向R5写入23, 同时读出R18和R31 (应读出9和100)
    wa = 5;
    din = 23;
    #10;

    // 向R0写入76, 同时读出R18和R31 (应读出9和100)
    wa = 0;
    din = 76;
    #10;

    // 停止写入, 读出R0和R5 (应读出0和23)
    ra1 = 0;
    ra2 = 5;
    we = 0;
    #10;

    $finish;
end

endmodule
