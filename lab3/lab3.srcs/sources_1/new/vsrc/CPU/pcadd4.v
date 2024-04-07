module PCADD4 (
    input  [31 : 0] pc,
    output [31 : 0] npc
);

assign npc = pc + 4;
    
endmodule