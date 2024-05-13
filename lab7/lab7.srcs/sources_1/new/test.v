`timescale 1ns/1ps
module Test ();

reg clk = 1;
always #1 clk = ~clk;

integer arr [3 : 0];
integer x;

always @(*) begin
    arr[0] = x;
    for (integer j = 0; j < 3; j = j + 1) begin
        arr[j + 1] = arr[j] + 1;
    end
end

initial begin
    x = 0;
    #5;
    x = 1;
    #5;
    $finish;
end

endmodule //test