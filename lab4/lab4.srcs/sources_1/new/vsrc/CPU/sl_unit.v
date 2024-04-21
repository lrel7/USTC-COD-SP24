`include "include/config.v"

module SL_UNIT (
    input                   [31 : 0]                addr,
    input                   [ 3 : 0]                dmem_access,

    input                   [31 : 0]                rd_in,  
    input                   [31 : 0]                wd_in,  

    output      reg         [31 : 0]                rd_out,
    output      reg         [31 : 0]                wd_out
);

integer index;
integer mask;
always @(*) begin
    // aligned_addr = addr & (~3);
    index = addr & 3;
    rd_out = 0;
    wd_out = 0;
    case (dmem_access)
        `LB: begin
            case (index)
                0: rd_out = {{24{rd_in[7]}}, rd_in[7:0]};
                1: rd_out = {{24{rd_in[15]}}, rd_in[15:8]};
                2: rd_out = {{24{rd_in[23]}}, rd_in[23:16]};
                3: rd_out = {{24{rd_in[31]}}, rd_in[31:24]};
            endcase
        end
        `LBU: begin
            case (index)
                0: rd_out = {24'b0, rd_in[7:0]};
                1: rd_out = {24'b0, rd_in[15:8]};
                2: rd_out = {24'b0, rd_in[23:16]};
                3: rd_out = {24'b0, rd_in[31:24]};
            endcase
        end
        `LH: begin
            case (index)
                0: rd_out = {{16{rd_in[15]}}, rd_in[15:0]};
                1: rd_out = {{16{rd_in[23]}}, rd_in[23:8]};
                2: rd_out = {{16{rd_in[31]}}, rd_in[31:16]};
                // (TO DO) 3: rd_out = {{24{rd_out[31]}}, rd_out[31:24]};
            endcase
        end
        `LHU: begin
            case (index)
                0: rd_out = {16'b0, rd_in[15:0]};
                1: rd_out = {16'b0, rd_in[23:8]};
                2: rd_out = {16'b0, rd_in[31:16]};
                // (TO DO) 3: rd_out = {{24{rd_out[31]}}, rd_out[31:24]};
            endcase
        end
        `LW: begin
            rd_out = rd_in;
        end
        `SB: begin
            case (index)
                0: wd_out = {rd_in[31:8], wd_in[7:0]};
                1: wd_out = {rd_in[31:16], wd_in[7:0], rd_in[7:0]};
                2: wd_out = {rd_in[31:24], wd_in[7:0], rd_in[15:0]};
                3: wd_out = {wd_in[7:0], rd_in[23:0]};
            endcase
        end
        `SH: begin       
            case (index)
                0: wd_out = {rd_in[31:16], wd_in[15:0]};
                1: wd_out = {rd_in[31:24], wd_in[15:0], rd_in[7:0]};
                2: wd_out = {wd_in[15:0], rd_in[15:0]};
                // TO DO : 3? 
            endcase
        end
        `SW: begin
            wd_out = wd_in;
        end
    endcase
end
endmodule