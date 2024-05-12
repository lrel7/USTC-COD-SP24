module WayMux #(
    parameter WAY_WIDTH = 128
) (
    input       [WAY_WIDTH - 1 : 0] src0,
    input       [WAY_WIDTH - 1 : 0] src1,
    input       [WAY_WIDTH - 1 : 0] src2,
    input       [WAY_WIDTH - 1 : 0] src3,
    input       [WAY_WIDTH - 1 : 0] src4,
    input       [WAY_WIDTH - 1 : 0] src5,
    input       [WAY_WIDTH - 1 : 0] src6,
    input       [WAY_WIDTH - 1 : 0] src7,
    input       [WAY_WIDTH - 1 : 0] src8,
    input       [WAY_WIDTH - 1 : 0] src9,
    input       [WAY_WIDTH - 1 : 0] src10,
    input       [WAY_WIDTH - 1 : 0] src11,
    input       [WAY_WIDTH - 1 : 0] src12,
    input       [WAY_WIDTH - 1 : 0] src13,
    input       [WAY_WIDTH - 1 : 0] src14,
    input       [WAY_WIDTH - 1 : 0] src15,
    input       [15 : 0]            way_select,
    output reg  [WAY_WIDTH - 1 : 0] result
);

always @(*) begin
    case (way_select)
        0: result = src0;
        1: result = src1;
        2: result = src2;
        3: result = src3;
        4: result = src4;
        5: result = src5;
        6: result = src6;
        7: result = src7;
        8: result = src8;
        9: result = src9;
        10: result = src10;
        11: result = src11;
        12: result = src12;
        13: result = src13;
        14: result = src14;
        15: result = src15;
    endcase
end
    
endmodule