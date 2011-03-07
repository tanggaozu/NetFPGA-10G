// ==============================================================
// RTL generated by AutoPilot - High-Level Synthesis System (C, C++, SystemC)
// Version: 2010.b.1
// Copyright (C) :2006-2010 AutoESL Design Technologies, Inc.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module get_eth_header (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        packet_in_data_address0,
        packet_in_data_ce0,
        packet_in_data_q0,
        input_portid_read,
        packet_out_data_address0,
        packet_out_data_ce0,
        packet_out_data_we0,
        packet_out_data_d0,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_return_3
);

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output  [10:0] packet_in_data_address0;
output   packet_in_data_ce0;
input  [7:0] packet_in_data_q0;
input  [31:0] input_portid_read;
output  [10:0] packet_out_data_address0;
output   packet_out_data_ce0;
output   packet_out_data_we0;
output  [7:0] packet_out_data_d0;
output  [47:0] ap_return_0;
output  [47:0] ap_return_1;
output  [15:0] ap_return_2;
output  [7:0] ap_return_3;

reg ap_done;
reg ap_idle;
reg packet_in_data_ce0;
reg packet_out_data_ce0;
reg packet_out_data_we0;
reg   [1:0] ap_CS_fsm;
reg   [7:0] eth_header_3_reg_380;
reg   [5:0] i_cast3_reg_385;
wire   [16:0] i_cast_fu_128_p1;
reg   [16:0] i_cast_reg_392;
wire   [0:0] tmp_1_fu_132_p2;
reg   [0:0] tmp_1_reg_397;
reg   [10:0] tmp_s_reg_401;
wire   [63:0] tmp_2_fu_144_p1;
reg   [63:0] tmp_2_reg_411;
reg   [10:0] i_reg_91;
wire   [0:0] tmp_15_fu_186_p2;
wire   [0:0] tmp_5_fu_149_p2;
wire   [0:0] tmp_7_fu_155_p2;
wire   [0:0] tmp_3_fu_161_p2;
wire   [0:0] tmp_9_fu_167_p2;
wire   [0:0] tmp_13_fu_173_p2;
reg   [47:0] eth_header_fu_40;
wire   [47:0] p_s_fu_230_p5;
reg   [47:0] eth_header_0_1_fu_44;
reg   [15:0] eth_header_2_1_fu_48;
wire   [15:0] tmp_14_fu_191_p1;
reg   [47:0] eth_header_1_fu_52;
wire   [47:0] p_0_fu_289_p5;
reg   [47:0] eth_header_1_1_fu_56;
wire   [16:0] tmp_15_cast_fu_182_p1;
wire   [5:0] tmp_10_fu_205_p2;
wire   [5:0] tmp_11_fu_210_p2;
wire   [5:0] tmp_12_fu_220_p2;
wire   [31:0] tmp_12_cast_fu_226_p1;
wire   [31:0] tmp_11_cast_fu_216_p1;
wire   [5:0] tmp_8_fu_261_p2;
wire   [2:0] tmp_16_fu_270_p1;
wire   [5:0] tmp_17_fu_273_p5;
wire   [31:0] tmp_8_cast_fu_266_p1;
wire   [31:0] tmp_cast_fu_285_p1;
reg   [1:0] ap_NS_fsm;
parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st0_fsm_0 = 2'b00;
parameter    ap_ST_st1_fsm_1 = 2'b01;
parameter    ap_ST_st2_fsm_2 = 2'b10;
parameter    ap_ST_st3_fsm_3 = 2'b11;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv11_0 = 11'b00000000000;
parameter    ap_const_lv11_5EE = 11'b10111101110;
parameter    ap_const_lv11_1 = 11'b00000000001;
parameter    ap_const_lv11_6 = 11'b00000000110;
parameter    ap_const_lv11_C = 11'b00000001100;
parameter    ap_const_lv6_3 = 6'b000011;
parameter    ap_const_lv6_17 = 6'b010111;
parameter    ap_const_lv6_10 = 6'b010000;
parameter    ap_const_lv6_7 = 6'b000111;
parameter    ap_const_lv32_3 = 32'b00000000000000000000000000000011;
parameter    ap_const_lv32_5 = 32'b00000000000000000000000000000101;
parameter    ap_true = 1'b1;




/// ap_CS_fsm assign process. ///
always @ (posedge ap_rst or posedge ap_clk)
begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st0_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_ST_st3_fsm_3 == ap_CS_fsm) & ~(tmp_1_reg_397 == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_5_fu_149_p2) & (ap_const_lv1_0 == tmp_7_fu_155_p2) & (ap_const_lv1_0 == tmp_3_fu_161_p2) & (ap_const_lv1_0 == tmp_9_fu_167_p2) & ~(ap_const_lv1_0 == tmp_13_fu_173_p2))) begin
        eth_header_0_1_fu_44 <= eth_header_fu_40;
    end
    if (((ap_ST_st3_fsm_3 == ap_CS_fsm) & ~(tmp_1_reg_397 == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_5_fu_149_p2) & (ap_const_lv1_0 == tmp_7_fu_155_p2) & ~(ap_const_lv1_0 == tmp_3_fu_161_p2))) begin
        eth_header_1_1_fu_56 <= eth_header_1_fu_52;
    end
    if (((ap_ST_st3_fsm_3 == ap_CS_fsm) & ~(tmp_1_reg_397 == ap_const_lv1_0) & ~(ap_const_lv1_0 == tmp_5_fu_149_p2))) begin
        eth_header_1_fu_52 <= {{40{1'b0}}, {packet_in_data_q0}};
    end else if (((ap_ST_st3_fsm_3 == ap_CS_fsm) & ~(tmp_1_reg_397 == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_5_fu_149_p2) & ~(ap_const_lv1_0 == tmp_7_fu_155_p2))) begin
        eth_header_1_fu_52 <= p_0_fu_289_p5;
    end
    if (((ap_ST_st3_fsm_3 == ap_CS_fsm) & ~(tmp_1_reg_397 == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_5_fu_149_p2) & (ap_const_lv1_0 == tmp_7_fu_155_p2) & (ap_const_lv1_0 == tmp_3_fu_161_p2) & (ap_const_lv1_0 == tmp_9_fu_167_p2) & ~(ap_const_lv1_0 == tmp_13_fu_173_p2))) begin
        eth_header_2_1_fu_48[0] <= tmp_14_fu_191_p1[0];
        eth_header_2_1_fu_48[1] <= tmp_14_fu_191_p1[1];
        eth_header_2_1_fu_48[2] <= tmp_14_fu_191_p1[2];
        eth_header_2_1_fu_48[3] <= tmp_14_fu_191_p1[3];
        eth_header_2_1_fu_48[4] <= tmp_14_fu_191_p1[4];
        eth_header_2_1_fu_48[5] <= tmp_14_fu_191_p1[5];
        eth_header_2_1_fu_48[6] <= tmp_14_fu_191_p1[6];
        eth_header_2_1_fu_48[7] <= tmp_14_fu_191_p1[7];
    end
    if ((ap_ST_st1_fsm_1 == ap_CS_fsm)) begin
        eth_header_3_reg_380 <= input_portid_read[7:0];
    end
    if (((ap_ST_st3_fsm_3 == ap_CS_fsm) & ~(tmp_1_reg_397 == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_5_fu_149_p2) & (ap_const_lv1_0 == tmp_7_fu_155_p2) & ~(ap_const_lv1_0 == tmp_3_fu_161_p2))) begin
        eth_header_fu_40 <= {{40{1'b0}}, {packet_in_data_q0}};
    end else if (((ap_ST_st3_fsm_3 == ap_CS_fsm) & ~(tmp_1_reg_397 == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_5_fu_149_p2) & (ap_const_lv1_0 == tmp_7_fu_155_p2) & (ap_const_lv1_0 == tmp_3_fu_161_p2) & ~(ap_const_lv1_0 == tmp_9_fu_167_p2))) begin
        eth_header_fu_40 <= p_s_fu_230_p5;
    end
    if ((ap_ST_st2_fsm_2 == ap_CS_fsm)) begin
        i_cast3_reg_385 <= i_reg_91[5:0];
    end
    if ((ap_ST_st2_fsm_2 == ap_CS_fsm)) begin
        i_cast_reg_392[0] <= i_cast_fu_128_p1[0];
        i_cast_reg_392[1] <= i_cast_fu_128_p1[1];
        i_cast_reg_392[2] <= i_cast_fu_128_p1[2];
        i_cast_reg_392[3] <= i_cast_fu_128_p1[3];
        i_cast_reg_392[4] <= i_cast_fu_128_p1[4];
        i_cast_reg_392[5] <= i_cast_fu_128_p1[5];
        i_cast_reg_392[6] <= i_cast_fu_128_p1[6];
        i_cast_reg_392[7] <= i_cast_fu_128_p1[7];
        i_cast_reg_392[8] <= i_cast_fu_128_p1[8];
        i_cast_reg_392[9] <= i_cast_fu_128_p1[9];
        i_cast_reg_392[10] <= i_cast_fu_128_p1[10];
    end
    if ((((ap_ST_st3_fsm_3 == ap_CS_fsm) & (ap_const_lv1_0 == tmp_15_fu_186_p2) & ~(tmp_1_reg_397 == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_5_fu_149_p2) & (ap_const_lv1_0 == tmp_7_fu_155_p2) & (ap_const_lv1_0 == tmp_3_fu_161_p2) & (ap_const_lv1_0 == tmp_9_fu_167_p2) & (ap_const_lv1_0 == tmp_13_fu_173_p2)) | ((ap_ST_st3_fsm_3 == ap_CS_fsm) & ~(tmp_1_reg_397 == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_5_fu_149_p2) & (ap_const_lv1_0 == tmp_7_fu_155_p2) & (ap_const_lv1_0 == tmp_3_fu_161_p2) & (ap_const_lv1_0 == tmp_9_fu_167_p2) & ~(ap_const_lv1_0 == tmp_13_fu_173_p2)) | ((ap_ST_st3_fsm_3 == ap_CS_fsm) & ~(tmp_1_reg_397 == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_5_fu_149_p2) & (ap_const_lv1_0 == tmp_7_fu_155_p2) & (ap_const_lv1_0 == tmp_3_fu_161_p2) & ~(ap_const_lv1_0 == tmp_9_fu_167_p2)) | ((ap_ST_st3_fsm_3 == ap_CS_fsm) & ~(tmp_1_reg_397 == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_5_fu_149_p2) & (ap_const_lv1_0 == tmp_7_fu_155_p2) & ~(ap_const_lv1_0 == tmp_3_fu_161_p2)) | ((ap_ST_st3_fsm_3 == ap_CS_fsm) & ~(tmp_1_reg_397 == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_5_fu_149_p2) & ~(ap_const_lv1_0 == tmp_7_fu_155_p2)) | ((ap_ST_st3_fsm_3 == ap_CS_fsm) & ~(tmp_1_reg_397 == ap_const_lv1_0) & ~(ap_const_lv1_0 == tmp_5_fu_149_p2)))) begin
        i_reg_91 <= tmp_s_reg_401;
    end else if ((ap_ST_st1_fsm_1 == ap_CS_fsm)) begin
        i_reg_91 <= ap_const_lv11_0;
    end
    if ((ap_ST_st2_fsm_2 == ap_CS_fsm)) begin
        tmp_1_reg_397 <= (i_reg_91 < ap_const_lv11_5EE? 1'b1: 1'b0);
    end
    if (((ap_ST_st2_fsm_2 == ap_CS_fsm) & ~(tmp_1_fu_132_p2 == ap_const_lv1_0))) begin
        tmp_2_reg_411[0] <= tmp_2_fu_144_p1[0];
        tmp_2_reg_411[1] <= tmp_2_fu_144_p1[1];
        tmp_2_reg_411[2] <= tmp_2_fu_144_p1[2];
        tmp_2_reg_411[3] <= tmp_2_fu_144_p1[3];
        tmp_2_reg_411[4] <= tmp_2_fu_144_p1[4];
        tmp_2_reg_411[5] <= tmp_2_fu_144_p1[5];
        tmp_2_reg_411[6] <= tmp_2_fu_144_p1[6];
        tmp_2_reg_411[7] <= tmp_2_fu_144_p1[7];
        tmp_2_reg_411[8] <= tmp_2_fu_144_p1[8];
        tmp_2_reg_411[9] <= tmp_2_fu_144_p1[9];
        tmp_2_reg_411[10] <= tmp_2_fu_144_p1[10];
    end
    if ((ap_ST_st2_fsm_2 == ap_CS_fsm)) begin
        tmp_s_reg_401 <= (i_reg_91 + ap_const_lv11_1);
    end
end

/// ap_NS_fsm assign process. ///
always @ (ap_start or ap_CS_fsm or tmp_1_reg_397 or tmp_15_fu_186_p2 or tmp_5_fu_149_p2 or tmp_7_fu_155_p2 or tmp_3_fu_161_p2 or tmp_9_fu_167_p2 or tmp_13_fu_173_p2)
begin
    if (((ap_ST_st3_fsm_3 == ap_CS_fsm) & ((tmp_1_reg_397 == ap_const_lv1_0) | ((ap_const_lv1_0 == tmp_5_fu_149_p2) & (ap_const_lv1_0 == tmp_7_fu_155_p2) & (ap_const_lv1_0 == tmp_3_fu_161_p2) & (ap_const_lv1_0 == tmp_9_fu_167_p2) & (ap_const_lv1_0 == tmp_13_fu_173_p2) & ~(ap_const_lv1_0 == tmp_15_fu_186_p2))) & ~(ap_const_logic_1 == ap_start))) begin
        ap_NS_fsm = ap_ST_st0_fsm_0;
    end else if ((ap_ST_st2_fsm_2 == ap_CS_fsm)) begin
        ap_NS_fsm = ap_ST_st3_fsm_3;
    end else if (((ap_ST_st1_fsm_1 == ap_CS_fsm) | ((ap_ST_st3_fsm_3 == ap_CS_fsm) & (((ap_const_lv1_0 == tmp_15_fu_186_p2) & ~(tmp_1_reg_397 == ap_const_lv1_0)) | (~(tmp_1_reg_397 == ap_const_lv1_0) & ~(ap_const_lv1_0 == tmp_5_fu_149_p2)) | (~(tmp_1_reg_397 == ap_const_lv1_0) & ~(ap_const_lv1_0 == tmp_7_fu_155_p2)) | (~(tmp_1_reg_397 == ap_const_lv1_0) & ~(ap_const_lv1_0 == tmp_3_fu_161_p2)) | (~(tmp_1_reg_397 == ap_const_lv1_0) & ~(ap_const_lv1_0 == tmp_9_fu_167_p2)) | (~(tmp_1_reg_397 == ap_const_lv1_0) & ~(ap_const_lv1_0 == tmp_13_fu_173_p2)))))) begin
        ap_NS_fsm = ap_ST_st2_fsm_2;
    end else if ((((ap_ST_st0_fsm_0 == ap_CS_fsm) & (ap_const_logic_1 == ap_start)) | ((ap_ST_st3_fsm_3 == ap_CS_fsm) & ((tmp_1_reg_397 == ap_const_lv1_0) | ((ap_const_lv1_0 == tmp_5_fu_149_p2) & (ap_const_lv1_0 == tmp_7_fu_155_p2) & (ap_const_lv1_0 == tmp_3_fu_161_p2) & (ap_const_lv1_0 == tmp_9_fu_167_p2) & (ap_const_lv1_0 == tmp_13_fu_173_p2) & ~(ap_const_lv1_0 == tmp_15_fu_186_p2))) & (ap_const_logic_1 == ap_start)))) begin
        ap_NS_fsm = ap_ST_st1_fsm_1;
    end else begin
        ap_NS_fsm = ap_CS_fsm;
    end
end

/// ap_done assign process. ///
always @ (ap_CS_fsm or tmp_1_reg_397 or tmp_15_fu_186_p2 or tmp_5_fu_149_p2 or tmp_7_fu_155_p2 or tmp_3_fu_161_p2 or tmp_9_fu_167_p2 or tmp_13_fu_173_p2)
begin
    if (((ap_ST_st0_fsm_0 == ap_CS_fsm) | ((ap_ST_st3_fsm_3 == ap_CS_fsm) & ((tmp_1_reg_397 == ap_const_lv1_0) | ((ap_const_lv1_0 == tmp_5_fu_149_p2) & (ap_const_lv1_0 == tmp_7_fu_155_p2) & (ap_const_lv1_0 == tmp_3_fu_161_p2) & (ap_const_lv1_0 == tmp_9_fu_167_p2) & (ap_const_lv1_0 == tmp_13_fu_173_p2) & ~(ap_const_lv1_0 == tmp_15_fu_186_p2)))))) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

/// ap_idle assign process. ///
always @ (ap_CS_fsm)
begin
    if ((ap_ST_st0_fsm_0 == ap_CS_fsm)) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

/// packet_in_data_ce0 assign process. ///
always @ (ap_CS_fsm or tmp_1_fu_132_p2)
begin
    if (((ap_ST_st2_fsm_2 == ap_CS_fsm) & ~(tmp_1_fu_132_p2 == ap_const_lv1_0))) begin
        packet_in_data_ce0 = ap_const_logic_1;
    end else begin
        packet_in_data_ce0 = ap_const_logic_0;
    end
end

/// packet_out_data_ce0 assign process. ///
always @ (ap_CS_fsm or tmp_1_reg_397)
begin
    if (((ap_ST_st3_fsm_3 == ap_CS_fsm) & ~(tmp_1_reg_397 == ap_const_lv1_0))) begin
        packet_out_data_ce0 = ap_const_logic_1;
    end else begin
        packet_out_data_ce0 = ap_const_logic_0;
    end
end

/// packet_out_data_we0 assign process. ///
always @ (ap_CS_fsm or tmp_1_reg_397)
begin
    if (((ap_ST_st3_fsm_3 == ap_CS_fsm) & ~(tmp_1_reg_397 == ap_const_lv1_0))) begin
        packet_out_data_we0 = ap_const_logic_1;
    end else begin
        packet_out_data_we0 = ap_const_logic_0;
    end
end
assign ap_return_0 = eth_header_0_1_fu_44;
assign ap_return_1 = eth_header_1_1_fu_56;
assign ap_return_2 = eth_header_2_1_fu_48;
assign ap_return_3 = eth_header_3_reg_380;
assign i_cast_fu_128_p1 = {{6{1'b0}}, {i_reg_91}};
wire [6-1:0] p_0_fu_289_p5_vHi_buf;
wire [6-1:0] p_0_fu_289_p5_vLo_buf;
wire [48-1:0] p_0_fu_289_p5_v1_buf;
wire [48-1:0] p_0_fu_289_p5_v1_buf_r;
wire [48-1:0] p_0_fu_289_p5_v1_tmp;
wire [6-1:0] p_0_fu_289_p5_v1_shift;
wire [48-1:0] p_0_fu_289_p5_mask0;
wire [48-1:0] p_0_fu_289_p5_mask1;
wire [48-1:0] p_0_fu_289_p5_mask2;

genvar ap_tvar_int_0;
generate
    for (ap_tvar_int_0 = 0; ap_tvar_int_0 < 48; ap_tvar_int_0 = ap_tvar_int_0 + 1) begin :p_0_fu_289_p5_label0
        assign p_0_fu_289_p5_v1_buf_r[ap_tvar_int_0] = p_0_fu_289_p5_v1_buf[48-1-ap_tvar_int_0];
    end
endgenerate

assign p_0_fu_289_p5_vHi_buf = (tmp_cast_fu_285_p1 >= tmp_8_cast_fu_266_p1)? tmp_cast_fu_285_p1 : tmp_8_cast_fu_266_p1;
assign p_0_fu_289_p5_vLo_buf = (tmp_cast_fu_285_p1 >= tmp_8_cast_fu_266_p1)? tmp_8_cast_fu_266_p1 : tmp_cast_fu_285_p1;
assign p_0_fu_289_p5_v1_buf = packet_in_data_q0;
assign p_0_fu_289_p5_v1_shift = (tmp_cast_fu_285_p1 >= tmp_8_cast_fu_266_p1)? tmp_8_cast_fu_266_p1 : (48-1-tmp_8_cast_fu_266_p1);
assign p_0_fu_289_p5_v1_tmp = (tmp_cast_fu_285_p1 >= tmp_8_cast_fu_266_p1)? (p_0_fu_289_p5_v1_buf << p_0_fu_289_p5_v1_shift) : (p_0_fu_289_p5_v1_buf_r >> p_0_fu_289_p5_v1_shift);
assign p_0_fu_289_p5_mask0 = {{(48-1){1'b1}}, 1'b0} << p_0_fu_289_p5_vHi_buf;
assign p_0_fu_289_p5_mask1 = ~({(48){1'b1}} << p_0_fu_289_p5_vLo_buf);
assign p_0_fu_289_p5_mask2 = p_0_fu_289_p5_mask0 | p_0_fu_289_p5_mask1;
assign p_0_fu_289_p5 = (eth_header_1_fu_52 & p_0_fu_289_p5_mask2) | (p_0_fu_289_p5_v1_tmp & ~p_0_fu_289_p5_mask2);

wire [6-1:0] p_s_fu_230_p5_vHi_buf;
wire [6-1:0] p_s_fu_230_p5_vLo_buf;
wire [48-1:0] p_s_fu_230_p5_v1_buf;
wire [48-1:0] p_s_fu_230_p5_v1_buf_r;
wire [48-1:0] p_s_fu_230_p5_v1_tmp;
wire [6-1:0] p_s_fu_230_p5_v1_shift;
wire [48-1:0] p_s_fu_230_p5_mask0;
wire [48-1:0] p_s_fu_230_p5_mask1;
wire [48-1:0] p_s_fu_230_p5_mask2;

genvar ap_tvar_int_1;
generate
    for (ap_tvar_int_1 = 0; ap_tvar_int_1 < 48; ap_tvar_int_1 = ap_tvar_int_1 + 1) begin :p_s_fu_230_p5_label0
        assign p_s_fu_230_p5_v1_buf_r[ap_tvar_int_1] = p_s_fu_230_p5_v1_buf[48-1-ap_tvar_int_1];
    end
endgenerate

assign p_s_fu_230_p5_vHi_buf = (tmp_11_cast_fu_216_p1 >= tmp_12_cast_fu_226_p1)? tmp_11_cast_fu_216_p1 : tmp_12_cast_fu_226_p1;
assign p_s_fu_230_p5_vLo_buf = (tmp_11_cast_fu_216_p1 >= tmp_12_cast_fu_226_p1)? tmp_12_cast_fu_226_p1 : tmp_11_cast_fu_216_p1;
assign p_s_fu_230_p5_v1_buf = packet_in_data_q0;
assign p_s_fu_230_p5_v1_shift = (tmp_11_cast_fu_216_p1 >= tmp_12_cast_fu_226_p1)? tmp_12_cast_fu_226_p1 : (48-1-tmp_12_cast_fu_226_p1);
assign p_s_fu_230_p5_v1_tmp = (tmp_11_cast_fu_216_p1 >= tmp_12_cast_fu_226_p1)? (p_s_fu_230_p5_v1_buf << p_s_fu_230_p5_v1_shift) : (p_s_fu_230_p5_v1_buf_r >> p_s_fu_230_p5_v1_shift);
assign p_s_fu_230_p5_mask0 = {{(48-1){1'b1}}, 1'b0} << p_s_fu_230_p5_vHi_buf;
assign p_s_fu_230_p5_mask1 = ~({(48){1'b1}} << p_s_fu_230_p5_vLo_buf);
assign p_s_fu_230_p5_mask2 = p_s_fu_230_p5_mask0 | p_s_fu_230_p5_mask1;
assign p_s_fu_230_p5 = (eth_header_fu_40 & p_s_fu_230_p5_mask2) | (p_s_fu_230_p5_v1_tmp & ~p_s_fu_230_p5_mask2);

assign packet_in_data_address0 = tmp_2_fu_144_p1;
assign packet_out_data_address0 = tmp_2_reg_411;
assign packet_out_data_d0 = packet_in_data_q0;
assign tmp_10_fu_205_p2 = i_cast3_reg_385 << ap_const_lv6_3;
assign tmp_11_cast_fu_216_p1 = {{26{1'b0}}, {tmp_11_fu_210_p2}};
assign tmp_11_fu_210_p2 = (tmp_10_fu_205_p2 + ap_const_lv6_17);
assign tmp_12_cast_fu_226_p1 = {{26{1'b0}}, {tmp_12_fu_220_p2}};
assign tmp_12_fu_220_p2 = (tmp_10_fu_205_p2 + ap_const_lv6_10);
assign tmp_13_fu_173_p2 = (i_reg_91 == ap_const_lv11_C? 1'b1: 1'b0);
assign tmp_14_fu_191_p1 = {{8{1'b0}}, {packet_in_data_q0}};
assign tmp_15_cast_fu_182_p1 = {{1{1'b0}}, {eth_header_2_1_fu_48}};
assign tmp_15_fu_186_p2 = (tmp_15_cast_fu_182_p1 == i_cast_reg_392? 1'b1: 1'b0);
assign tmp_16_fu_270_p1 = i_cast3_reg_385[2:0];
assign tmp_17_fu_273_p5 = {{tmp_16_fu_270_p1}, {ap_const_lv6_7[32'd2 : 32'd0]}};
assign tmp_1_fu_132_p2 = (i_reg_91 < ap_const_lv11_5EE? 1'b1: 1'b0);
assign tmp_2_fu_144_p1 = {{53{1'b0}}, {i_reg_91}};
assign tmp_3_fu_161_p2 = (i_reg_91 == ap_const_lv11_6? 1'b1: 1'b0);
assign tmp_5_fu_149_p2 = (i_reg_91 == ap_const_lv11_0? 1'b1: 1'b0);
assign tmp_7_fu_155_p2 = (i_reg_91 < ap_const_lv11_6? 1'b1: 1'b0);
assign tmp_8_cast_fu_266_p1 = {{26{1'b0}}, {tmp_8_fu_261_p2}};
assign tmp_8_fu_261_p2 = i_cast3_reg_385 << ap_const_lv6_3;
assign tmp_9_fu_167_p2 = (i_reg_91 < ap_const_lv11_C? 1'b1: 1'b0);
assign tmp_cast_fu_285_p1 = {{26{1'b0}}, {tmp_17_fu_273_p5}};
always @ (ap_clk)
begin
    i_cast_reg_392[11] <= 1'b0;
    i_cast_reg_392[12] <= 1'b0;
    i_cast_reg_392[13] <= 1'b0;
    i_cast_reg_392[14] <= 1'b0;
    i_cast_reg_392[15] <= 1'b0;
    i_cast_reg_392[16] <= 1'b0;
end

always @ (ap_clk)
begin
    tmp_2_reg_411[11] <= 1'b0;
    tmp_2_reg_411[12] <= 1'b0;
    tmp_2_reg_411[13] <= 1'b0;
    tmp_2_reg_411[14] <= 1'b0;
    tmp_2_reg_411[15] <= 1'b0;
    tmp_2_reg_411[16] <= 1'b0;
    tmp_2_reg_411[17] <= 1'b0;
    tmp_2_reg_411[18] <= 1'b0;
    tmp_2_reg_411[19] <= 1'b0;
    tmp_2_reg_411[20] <= 1'b0;
    tmp_2_reg_411[21] <= 1'b0;
    tmp_2_reg_411[22] <= 1'b0;
    tmp_2_reg_411[23] <= 1'b0;
    tmp_2_reg_411[24] <= 1'b0;
    tmp_2_reg_411[25] <= 1'b0;
    tmp_2_reg_411[26] <= 1'b0;
    tmp_2_reg_411[27] <= 1'b0;
    tmp_2_reg_411[28] <= 1'b0;
    tmp_2_reg_411[29] <= 1'b0;
    tmp_2_reg_411[30] <= 1'b0;
    tmp_2_reg_411[31] <= 1'b0;
    tmp_2_reg_411[32] <= 1'b0;
    tmp_2_reg_411[33] <= 1'b0;
    tmp_2_reg_411[34] <= 1'b0;
    tmp_2_reg_411[35] <= 1'b0;
    tmp_2_reg_411[36] <= 1'b0;
    tmp_2_reg_411[37] <= 1'b0;
    tmp_2_reg_411[38] <= 1'b0;
    tmp_2_reg_411[39] <= 1'b0;
    tmp_2_reg_411[40] <= 1'b0;
    tmp_2_reg_411[41] <= 1'b0;
    tmp_2_reg_411[42] <= 1'b0;
    tmp_2_reg_411[43] <= 1'b0;
    tmp_2_reg_411[44] <= 1'b0;
    tmp_2_reg_411[45] <= 1'b0;
    tmp_2_reg_411[46] <= 1'b0;
    tmp_2_reg_411[47] <= 1'b0;
    tmp_2_reg_411[48] <= 1'b0;
    tmp_2_reg_411[49] <= 1'b0;
    tmp_2_reg_411[50] <= 1'b0;
    tmp_2_reg_411[51] <= 1'b0;
    tmp_2_reg_411[52] <= 1'b0;
    tmp_2_reg_411[53] <= 1'b0;
    tmp_2_reg_411[54] <= 1'b0;
    tmp_2_reg_411[55] <= 1'b0;
    tmp_2_reg_411[56] <= 1'b0;
    tmp_2_reg_411[57] <= 1'b0;
    tmp_2_reg_411[58] <= 1'b0;
    tmp_2_reg_411[59] <= 1'b0;
    tmp_2_reg_411[60] <= 1'b0;
    tmp_2_reg_411[61] <= 1'b0;
    tmp_2_reg_411[62] <= 1'b0;
    tmp_2_reg_411[63] <= 1'b0;
end

always @ (ap_clk)
begin
    eth_header_2_1_fu_48[8] <= 1'b0;
    eth_header_2_1_fu_48[9] <= 1'b0;
    eth_header_2_1_fu_48[10] <= 1'b0;
    eth_header_2_1_fu_48[11] <= 1'b0;
    eth_header_2_1_fu_48[12] <= 1'b0;
    eth_header_2_1_fu_48[13] <= 1'b0;
    eth_header_2_1_fu_48[14] <= 1'b0;
    eth_header_2_1_fu_48[15] <= 1'b0;
end



endmodule //get_eth_header

