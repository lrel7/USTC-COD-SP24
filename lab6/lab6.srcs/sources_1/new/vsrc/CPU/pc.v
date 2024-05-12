module PC (
    input                   [ 0 : 0]            clk,
    input                   [ 0 : 0]            rst,
    input                   [ 0 : 0]            en,
    input                   [ 0 : 0]            stall,
    input                   [31 : 0]            npc,

    output      reg         [31 : 0]            pc
);

always @(posedge clk) begin
    if (rst) begin
        pc <= `PC_INIT;
    end else if (!stall && en) begin
        pc <= npc;
    end
end

endmodule