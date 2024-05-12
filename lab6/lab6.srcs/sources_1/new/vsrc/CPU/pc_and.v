module PC_AND (
    input  [31 : 0] pc,
    output [31 : 0] pc_and
);

assign pc_and = pc & (~1);
    
endmodule