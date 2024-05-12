module SEG_CTRL (
    input                   rf_we_ex,
    input       [1 : 0]     rf_wd_sel_ex, npc_sel_ex,
    input       [4 : 0]     rf_wa_ex, rf_ra0_id, rf_ra1_id,
    output reg              stall_pc, stall_if_id, flush_if_id, flush_id_ex
);

always @(*) begin
    /* Set default value */
    stall_pc = 0; stall_if_id = 0; flush_if_id = 0; flush_id_ex = 0;

    /* Load-Use hazard */
    if (rf_we_ex && rf_wd_sel_ex == 2'b10 && rf_wa_ex != 0 
        && (rf_wa_ex == rf_ra0_id || rf_wa_ex == rf_ra1_id)) begin
            flush_id_ex = 1;  // bubble
            stall_pc = 1;
            stall_if_id = 1;
    end

    /* Control hazard */
    if (npc_sel_ex != 2'b00) begin
        flush_if_id = 1;  // bubble
        flush_id_ex = 1;  // bubble
    end
end

endmodule 