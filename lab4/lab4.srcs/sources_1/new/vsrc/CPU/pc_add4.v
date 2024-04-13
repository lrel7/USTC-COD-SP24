module PC_ADD4 (
    input  [31 : 0] pc,
    output [31 : 0] pc_add4
);

assign pc_add4 = pc + 4;
    
endmodule