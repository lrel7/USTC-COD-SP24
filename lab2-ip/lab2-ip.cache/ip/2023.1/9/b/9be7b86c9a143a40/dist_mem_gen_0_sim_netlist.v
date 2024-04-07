// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
// Date        : Mon Mar 25 18:47:09 2024
// Host        : VM7699-verilog-labs running 64-bit Ubuntu 22.04.3 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dist_mem_gen_0_sim_netlist.v
// Design      : dist_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dist_mem_gen_0,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (a,
    spo);
  input [4:0]a;
  output [31:0]spo;

  wire [4:0]a;
  wire [31:0]spo;
  wire [31:0]NLW_U0_dpo_UNCONNECTED;
  wire [31:0]NLW_U0_qdpo_UNCONNECTED;
  wire [31:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "artix7" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "5" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "32" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "dist_mem_gen_0.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "32" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[31:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[31:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[31:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
bEktTo8XfP53J4LC9J1bzNOsr+DeYSQtsSeSeRwv1ROtu7MJT7BubpFM5B3JNITvmmXMIQ7cHCcM
BFy5Vu0fdwcQmgznzr1F4XAF5OH/PlBVKmCiA5IZpd+UQUMuy8l823afh4u8+Fg3bwZX7B36A3bn
Zez9yHjSKD7JGdQ9zA8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vAZQ8ZTe/MermX+omywGuwEzd7SLijiaDbuX0B9K4vjWUXvRoI6Em0qizreOX/qdo4JlybEpt70i
jJhVvWv69a9yKb8TMuvLagWbQydSwTJKTY6VSR/CtA2Uive8NvQyiQKFXLjR8k8OBlgOYmyzZEEM
vYgZLdnM3d2xSMMmeGF+dNh8tCJpM10LRaCrnj5w8L73RtOImlhI/zlR8cC5oo1TbyRV+JuHvvMZ
sYS3+4qn/f80Ugvao3cYMW0LtoTftK9oYpzhiyqg6hnJnbGsAENom2wqBpcRJf1vsI98WiJqDCuh
LIdMFI+M5KuqToM8D+FTQUOT2NniYpTmj5qTFg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VpwnevLJi/mNDesLbbdRntRX/1KkSUuxvcBO6/opCSkxKA2w7s8Eyh+CvZJvHhBMtWZquJPlWZsE
d3toYaeyczcrzAzfKryx5nnTvscAyYnKl8QyY0fWsE1UqWjg6tazMCtzxlfF3HfKx/GSm3D/0NEz
xzyxLBgRosbKCX4YRV0=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MhGbYf5xy0E517prDNoCHbf/sVQ5JHlfzlh1Fz+rfDm8S3/Zt1g/AR2QuQPNwJUQO22hvTTB491a
xRG5ct3upD6ZdXgMesPA9KgwjRjoBp/uriYuT6Sb/yE2jugYl2qBGpqxN9n2OgAVfK3o9XZ/aIcR
St2PwrmKRzU/ZoYenWUMZ6ZRsVNlzFCEBcKop6f5TBy0bWAeebXRZ0Mot23DVX4pqVyFaQoXdmkm
56Vr2jGszkLic4M0JoKahUlQpnrZuHIWgFVd/RzXXP9HwYBRQTxaKnNX6eWTdksVvzAImMYoPa4G
PJJFf+gsNAKp5BIFXjwHfNC+Nerc6XzDmxe+pw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jfnJJlFHpbB8S3PjID3rEIRi4fzY1WUZaITx6CJ38mSZfYSA13DJislb1OQ17w4Hnv5eGM/0GVgA
2jPR4wYaMzC8v3iDfETrH4kyrFglo3a/NDlACuR1U65YoHUnUu0UmMMovxQEnd9ByAfOtabZPL4j
FTvCoVMpwI8rdT4YJQ5pYXryESdM3NUe29p9OWbY1EalisEVViKuSwS4LzwtaOmrPecCE56FGEp+
2iyBMICOFF2PpT8Bqp39Z2rx4xyIiudZKo3LNimTm/UYBCnPAJ7XBIS+JiCIOkHsPER+wNivbtUb
J02F8ZLbEtS0qmUdYDXO4qqhc1njU9O6Uk9yNA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
uOK6pXmc+RsarhB5GcgUPkseiDLhaN7KZ4C18Aqea9NqSbvIERAENTml4U58cVlx6j599K+L2aW5
rVMZLtj8UE4yfEDhtivrSdBYh446mqbnToHhH5r4BmzYnr6BUuXVZ4NIUU29WnaJUZxwrvZeCln4
GQCdP1kUA1Ozy9B47ndTYgOzCcZSr9w36W7ZA1gm34lqVpXYuGsaRTvk1DhS96aFGCeiCTbs5HM3
e0JPkZ7YUsMgWuRzE+jHE1TEMVjbPkpPjFGCYOEeDf2bc/2s2fPLA3bxMs61xUFH5LAd7Qrs9D2v
Mx+Vcfvo7kmp3J5LW99NXfA9OvG1JgjJ7ykhmw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OS52LCfxYaApFxxvQUqjJD8DSzwhbsM5irqCX6E4R0iBINlXI3QVmtLKp8vhPICYZWjEuTIVzohU
28vwAOP2ECPWOkJjN+ny9RQeAKmQhPbxHYOysXg4IgtMbK+ZODUoMyLIsJzz2yIFl5qvQeLBnc44
NvqDk7nFLhtrN9De4XV14FKtDvQG0BdWr2mXiS7WiEAQxiww87A0M8yP82JlG6ykYSwQh5G8K6pv
YHoqI8mKAC+KGuDltBnyBrKGip5pRq7Kf+0okVAOwt0lJwDvS0JMNEUg1HK/mEIR6TKUdd8B/fms
4qcaCBYsptjoZVCq4ygSG56x8uaQXMVsEALe2w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
Aew/RSoMZUIh8oIZPhChM37w+R5unp+7pprfqezjGFUVX16UeT1spPFU1DaqTQvQkXhBe4/aNxvo
Y2eUJsQd8zSC9wBoevCnvwaHEv/IBc+OKmBzOPxO1hHXDVPtDZWdRCx+1y0ZYhQa+NA6jLP2zOJx
/emAZW55AWgZKKJS4QgantVgmUSyKVe/LlIVstraTkF4EzV092mOj1iPH/UqFFno9IwE1aOXuYuT
XrZU9D1dkPLBMg3CDwOi+bXRSgjvuueWT7ostJSFraLwDkurP1pYHHG4NDxYiDxMFWarWeII+T6v
hMJKd/8ZRrh5aHvGV5O/Hdc4rPitxa/cdQPAc0r2e2XWAJIdic09atzXXyU9o2vV/urpMsjSVva4
B5a/PwS16c18IMm6vAeFSLMo0T/jor1Q5SoxEC5QEkxvEfIUjjw7k0b1Crv5EfWz/sJ1LHwqlG7t
az+h03yAqvqGfOHC+7YoilYImR1NiLTCLgxnUfIvxo6woY4SgD+hLki4

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
iZJ+xdyrZbhNc8zYurF70yKiutV2IBjRXDiOZ/7w25UL6rCpY4Pd5gJN3+SNIoQ66bzRxlhaXMNu
tzoCM2kFY4N5ZbCy/S4rtBK0PUHKEVd7c5Btr5gn8BgQWiIafJ8Qa/8xqo95ocakFzN6/V+DNvyN
7FPkXDwuiaD0cmHW8XyOxnHM2b/XKHOibr7UKTRAomXyt7y80BVKpE50ddxXAxw9wlMn+gpW5Kpz
Dp8z4VH3uZrVv8Yl5RWELOQ3Uh0Xizb20mvc6Lu+BNoz0Ys9zZUaqKU71Kuv4s8vgPzrZXXNifo2
pU0aNj0oqAGlSTcTCBF8Tl6/jFvUXQEzYoIfiQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9360)
`pragma protect data_block
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
Sfpyj3A2rpKEDSJH
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
