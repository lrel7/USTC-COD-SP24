module PC (
    input                   [ 0 : 0]            clk,
    input                   [ 0 : 0]            rst,
    input                   [ 0 : 0]            en,
    input                   [31 : 0]            npc,

    output      reg         [31 : 0]            pc
);

always @(posedge clk) begin
    if (rst) begin
        pc <= 32'h003F_FFFC;
    end else if (en) begin
        pc <= npc;
    end
end

endmodule