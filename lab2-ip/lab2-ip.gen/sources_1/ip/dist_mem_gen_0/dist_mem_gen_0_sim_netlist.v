// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
// Date        : Mon Mar 25 18:47:10 2024
// Host        : VM7699-verilog-labs running 64-bit Ubuntu 22.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/ubuntu/cod_labs/lab2-ip/lab2-ip.gen/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0_sim_netlist.v
// Design      : dist_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dist_mem_gen_0,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module dist_mem_gen_0
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
  dist_mem_gen_0_dist_mem_gen_v8_0_13 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9376)
`pragma protect data_block
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
8Lj/6vDL1NQToVfrQmZceprrQP5FrljCyxp4DQ==
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
