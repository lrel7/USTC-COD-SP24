module TOP (
    input                   [ 0 : 0]            clk,
    input                   [ 0 : 0]            rst,

    input                   [ 0 : 0]            enable,
    input                   [ 4 : 0]            in,
    input                   [ 1 : 0]            ctrl,

    output                  [ 3 : 0]            seg_data,
    output                  [ 2 : 0]            seg_an
);

// Register enable signals
wire op_en = (ctrl == 2'b00) && enable;
wire src0_en = (ctrl == 2'b01) && enable;
wire src1_en = (ctrl == 2'b10) && enable;
wire res_en = (ctrl == 2'b11) && enable;

// Registers
reg [4:0] alu_op;
reg [31:0] alu_src0, alu_src1, output_data;
wire [31:0] alu_res;

ALU alu (
    .alu_src0(alu_src0),
    .alu_src1(alu_src1),
    .alu_op(alu_op),
    .alu_res(alu_res)
);

Segment seg (
    .clk(clk),
    .rst(rst),
    .output_data(output_data),
    .seg_data(seg_data),
    .seg_an(seg_an)
);

always @(posedge clk) begin
    // Reset
    if (rst) begin
        alu_src0 <= 0;
        alu_src1 <= 0;
        alu_op <= 0;
        output_data <= 0;
    end 
    else begin
        // Set `alu_op`
        if (op_en) begin
            alu_op <= in[4:0];
        end
        // Set `alu_src0`
        if (src0_en) begin
            alu_src0 <= {{27{in[4]}}, in[4:0]};  // sign-extension
        end
        // Set `alu_src1`
        if (src1_en) begin
            alu_src1 <= {{27{in[4]}}, in[4:0]};
        end
        // Set `output_data`
        if (res_en) begin
           output_data <= alu_res; 
        end
    end
end

endmodule