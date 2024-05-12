module Forwarding (
    input               rf_we_mem, rf_we_wb,
    input  [ 4 : 0]     rf_wa_mem, rf_wa_wb, rf_ra0_ex, rf_ra1_ex,
    // input  [31 : 0]     rf_wd_mem, rf_wd_wb,
    output [ 1 : 0]     rf_rd0_fe, rf_rd1_fe 
);

assign rf_rd0_fe = (rf_we_mem && rf_wa_mem != 0 && rf_wa_mem == rf_ra0_ex) ? 
                    2'b10 : 
                    (rf_we_wb && rf_wa_wb != 0 && rf_wa_wb == rf_ra0_ex) ? 
                    2'b01 : 
                    2'b00;

assign rf_rd1_fe = (rf_we_mem && rf_wa_mem != 0 && rf_wa_mem == rf_ra1_ex) ? 
                    2'b10 : 
                    (rf_we_wb && rf_wa_wb != 0 && rf_wa_wb == rf_ra1_ex) ? 
                    2'b01 : 
                    2'b00;

endmodule
