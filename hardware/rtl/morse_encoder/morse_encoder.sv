module counter_2_3
  (input  clk_i,
   input  rstn_i,
   input  load_i,
   input  enable_i,
   input  [1:0] start_time_i,
   output rollover_o);
  wire [1:0] count_s;
  wire n227_o;
  wire n230_o;
  wire [1:0] n232_o;
  wire [1:0] n234_o;
  wire [1:0] n235_o;
  wire [1:0] n236_o;
  wire n243_o;
  wire n244_o;
  reg [1:0] n246_q;
  assign rollover_o = n244_o; //(module output)
  /* counter.vhd:26:12  */
  assign count_s = n246_q; // (signal)
  /* counter.vhd:32:19  */
  assign n227_o = ~rstn_i;
  /* counter.vhd:38:28  */
  assign n230_o = count_s == 2'b00;
  /* counter.vhd:41:40  */
  assign n232_o = count_s - 2'b01;
  /* counter.vhd:38:17  */
  assign n234_o = n230_o ? 2'b10 : n232_o;
  /* counter.vhd:37:13  */
  assign n235_o = enable_i ? n234_o : count_s;
  /* counter.vhd:35:13  */
  assign n236_o = load_i ? start_time_i : n235_o;
  /* counter.vhd:47:36  */
  assign n243_o = count_s == 2'b00;
  /* counter.vhd:47:23  */
  assign n244_o = n243_o ? 1'b1 : 1'b0;
  /* counter.vhd:34:9  */
  always @(posedge clk_i or posedge n227_o)
    if (n227_o)
      n246_q <= 2'b00;
    else
      n246_q <= n236_o;
endmodule

module counter_27_25
  (input  clk_i,
   input  rstn_i,
   input  load_i,
   input  enable_i,
   input  [26:0] start_time_i,
   output rollover_o);
  wire [26:0] count_s;
  wire n204_o;
  wire n207_o;
  wire [26:0] n209_o;
  wire [26:0] n211_o;
  wire [26:0] n212_o;
  wire [26:0] n213_o;
  wire n220_o;
  wire n221_o;
  reg [26:0] n223_q;
  assign rollover_o = n221_o; //(module output)
  /* counter.vhd:26:12  */
  assign count_s = n223_q; // (signal)
  /* counter.vhd:32:19  */
  assign n204_o = ~rstn_i;
  /* counter.vhd:38:28  */
  assign n207_o = count_s == 27'b000000000000000000000000000;
  /* counter.vhd:41:40  */
  assign n209_o = count_s - 27'b000000000000000000000000001;
  /* counter.vhd:38:17  */
  assign n211_o = n207_o ? 27'b000000000000000000000011000 : n209_o;
  /* counter.vhd:37:13  */
  assign n212_o = enable_i ? n211_o : count_s;
  /* counter.vhd:35:13  */
  assign n213_o = load_i ? start_time_i : n212_o;
  /* counter.vhd:47:36  */
  assign n220_o = count_s == 27'b000000000000000000000000000;
  /* counter.vhd:47:23  */
  assign n221_o = n220_o ? 1'b1 : 1'b0;
  /* counter.vhd:34:9  */
  always @(posedge clk_i or posedge n204_o)
    if (n204_o)
      n223_q <= 27'b000000000000000000000000000;
    else
      n223_q <= n213_o;
endmodule

module input_lut
  (input  [2:0] sw_i,
   output [4:0] code_o,
   output [2:0] len_o);
  wire n166_o;
  wire n168_o;
  wire n170_o;
  wire n172_o;
  wire n174_o;
  wire n176_o;
  wire n178_o;
  wire n180_o;
  wire [7:0] n181_o;
  reg [4:0] n190_o;
  reg [2:0] n199_o;
  assign code_o = n190_o; //(module output)
  assign len_o = n199_o; //(module output)
  /* input_lut.vhd:29:13  */
  assign n166_o = sw_i == 3'b000;
  /* input_lut.vhd:32:13  */
  assign n168_o = sw_i == 3'b001;
  /* input_lut.vhd:35:13  */
  assign n170_o = sw_i == 3'b010;
  /* input_lut.vhd:38:13  */
  assign n172_o = sw_i == 3'b011;
  /* input_lut.vhd:41:13  */
  assign n174_o = sw_i == 3'b100;
  /* input_lut.vhd:44:13  */
  assign n176_o = sw_i == 3'b101;
  /* input_lut.vhd:47:13  */
  assign n178_o = sw_i == 3'b110;
  /* input_lut.vhd:50:13  */
  assign n180_o = sw_i == 3'b111;
  assign n181_o = {n180_o, n178_o, n176_o, n174_o, n172_o, n170_o, n168_o, n166_o};
  /* input_lut.vhd:28:9  */
  always @*
    case (n181_o)
      8'b10000000: n190_o = 5'b00000;
      8'b01000000: n190_o = 5'b00011;
      8'b00100000: n190_o = 5'b00100;
      8'b00010000: n190_o = 5'b00000;
      8'b00001000: n190_o = 5'b00001;
      8'b00000100: n190_o = 5'b00101;
      8'b00000010: n190_o = 5'b00001;
      8'b00000001: n190_o = 5'b00010;
      default: n190_o = n190_o;
    endcase
  /* input_lut.vhd:28:9  */
  always @*
    case (n181_o)
      8'b10000000: n199_o = 3'b011;
      8'b01000000: n199_o = 3'b010;
      8'b00100000: n199_o = 3'b011;
      8'b00010000: n199_o = 3'b000;
      8'b00001000: n199_o = 3'b010;
      8'b00000100: n199_o = 3'b011;
      8'b00000010: n199_o = 3'b011;
      8'b00000001: n199_o = 3'b001;
      default: n199_o = n199_o;
    endcase
endmodule

module fsm_1_1_3_2215d90c8d9b57557cdd6c736ba44d5fd5b41869
  (input  clk_i,
   input  rstn_i,
   input  [4:0] code_i,
   input  [2:0] len_i,
   input  send_i,
   input  timer_empty_i,
   output led_o,
   output [1:0] set_time_o,
   output timer_load_o);
  wire [1:0] state;
  wire [1:0] next_state;
  wire [2:0] ptr;
  wire led;
  wire [4:0] code_reg;
  wire [2:0] len_reg;
  wire sel_slice;
  wire prev_rollover;
  wire timer_empty_posedge;
  wire n19_o;
  wire n20_o;
  wire n21_o;
  wire [1:0] n26_o;
  wire n28_o;
  wire [2:0] n30_o;
  wire n31_o;
  wire n32_o;
  wire n33_o;
  wire n34_o;
  wire [1:0] n37_o;
  wire n40_o;
  wire [1:0] n42_o;
  wire [1:0] n44_o;
  wire n46_o;
  wire [1:0] n48_o;
  wire [1:0] n50_o;
  wire n52_o;
  wire [1:0] n54_o;
  wire n56_o;
  wire n59_o;
  wire [1:0] n61_o;
  wire n63_o;
  wire [1:0] n66_o;
  wire n70_o;
  wire [1:0] n72_o;
  wire n74_o;
  wire [3:0] n75_o;
  reg [1:0] n78_o;
  reg n81_o;
  reg [1:0] n83_o;
  reg n89_o;
  wire n94_o;
  wire n97_o;
  wire [4:0] n98_o;
  wire [2:0] n99_o;
  wire n101_o;
  wire n103_o;
  wire n105_o;
  wire [2:0] n107_o;
  wire [2:0] n108_o;
  wire n110_o;
  wire n112_o;
  wire [2:0] n114_o;
  wire [2:0] n115_o;
  wire n117_o;
  wire [3:0] n118_o;
  reg [2:0] n120_o;
  reg [4:0] n121_o;
  reg [2:0] n122_o;
  reg [1:0] n138_q;
  wire n139_o;
  wire [2:0] n140_o;
  reg [2:0] n141_q;
  wire n142_o;
  wire [4:0] n143_o;
  reg [4:0] n144_q;
  wire n145_o;
  wire [2:0] n146_o;
  reg [2:0] n147_q;
  reg n148_q;
  wire n149_o;
  wire n150_o;
  reg n151_q;
  wire n152_o;
  wire n153_o;
  wire n154_o;
  wire n155_o;
  wire n156_o;
  wire [1:0] n157_o;
  reg n158_o;
  wire n159_o;
  wire n160_o;
  assign led_o = n151_q; //(module output)
  assign set_time_o = n78_o; //(module output)
  assign timer_load_o = n81_o; //(module output)
  /* fsm.vhd:37:12  */
  assign state = n138_q; // (signal)
  /* fsm.vhd:37:19  */
  assign next_state = n83_o; // (signal)
  /* fsm.vhd:39:12  */
  assign ptr = n141_q; // (signal)
  /* fsm.vhd:40:12  */
  assign led = n89_o; // (signal)
  /* fsm.vhd:41:12  */
  assign code_reg = n144_q; // (signal)
  /* fsm.vhd:42:12  */
  assign len_reg = n147_q; // (signal)
  /* fsm.vhd:43:12  */
  assign sel_slice = n160_o; // (signal)
  /* fsm.vhd:45:12  */
  assign prev_rollover = n148_q; // (signal)
  /* fsm.vhd:46:12  */
  assign timer_empty_posedge = n21_o; // (signal)
  /* fsm.vhd:52:53  */
  assign n19_o = prev_rollover != timer_empty_i;
  /* fsm.vhd:52:71  */
  assign n20_o = timer_empty_i & n19_o;
  /* fsm.vhd:52:32  */
  assign n21_o = n20_o ? 1'b1 : 1'b0;
  /* fsm.vhd:64:17  */
  assign n26_o = send_i ? 2'b01 : state;
  /* fsm.vhd:62:13  */
  assign n28_o = state == 2'b00;
  /* fsm.vhd:69:45  */
  assign n30_o = len_reg + 3'b001;
  /* fsm.vhd:69:24  */
  assign n31_o = ptr == n30_o;
  /* fsm.vhd:71:66  */
  assign n32_o = ~sel_slice;
  /* fsm.vhd:71:51  */
  assign n33_o = n32_o & timer_empty_posedge;
  /* fsm.vhd:75:51  */
  assign n34_o = sel_slice & timer_empty_posedge;
  /* fsm.vhd:75:17  */
  assign n37_o = n34_o ? 2'b11 : 2'b00;
  /* fsm.vhd:75:17  */
  assign n40_o = n34_o ? 1'b1 : 1'b0;
  /* fsm.vhd:75:17  */
  assign n42_o = n34_o ? 2'b11 : state;
  /* fsm.vhd:71:17  */
  assign n44_o = n33_o ? 2'b01 : n37_o;
  /* fsm.vhd:71:17  */
  assign n46_o = n33_o ? 1'b1 : n40_o;
  /* fsm.vhd:71:17  */
  assign n48_o = n33_o ? 2'b10 : n42_o;
  /* fsm.vhd:69:17  */
  assign n50_o = n31_o ? 2'b00 : n44_o;
  /* fsm.vhd:69:17  */
  assign n52_o = n31_o ? 1'b0 : n46_o;
  /* fsm.vhd:69:17  */
  assign n54_o = n31_o ? 2'b00 : n48_o;
  /* fsm.vhd:67:13  */
  assign n56_o = state == 2'b01;
  /* fsm.vhd:83:17  */
  assign n59_o = timer_empty_posedge ? 1'b1 : 1'b0;
  /* fsm.vhd:83:17  */
  assign n61_o = timer_empty_posedge ? 2'b01 : state;
  /* fsm.vhd:80:13  */
  assign n63_o = state == 2'b10;
  /* fsm.vhd:91:17  */
  assign n66_o = timer_empty_posedge ? 2'b01 : 2'b11;
  /* fsm.vhd:91:17  */
  assign n70_o = timer_empty_posedge ? 1'b1 : 1'b0;
  /* fsm.vhd:91:17  */
  assign n72_o = timer_empty_posedge ? 2'b01 : state;
  /* fsm.vhd:88:13  */
  assign n74_o = state == 2'b11;
  assign n75_o = {n74_o, n63_o, n56_o, n28_o};
  /* fsm.vhd:61:9  */
  always @*
    case (n75_o)
      4'b1000: n78_o = n66_o;
      4'b0100: n78_o = 2'b01;
      4'b0010: n78_o = n50_o;
      4'b0001: n78_o = 2'b00;
      default: n78_o = 2'b00;
    endcase
  /* fsm.vhd:61:9  */
  always @*
    case (n75_o)
      4'b1000: n81_o = n70_o;
      4'b0100: n81_o = n59_o;
      4'b0010: n81_o = n52_o;
      4'b0001: n81_o = 1'b0;
      default: n81_o = 1'b0;
    endcase
  /* fsm.vhd:61:9  */
  always @*
    case (n75_o)
      4'b1000: n83_o = n72_o;
      4'b0100: n83_o = n61_o;
      4'b0010: n83_o = n54_o;
      4'b0001: n83_o = n26_o;
      default: n83_o = state;
    endcase
  /* fsm.vhd:61:9  */
  always @*
    case (n75_o)
      4'b1000: n89_o = 1'b1;
      4'b0100: n89_o = 1'b1;
      4'b0010: n89_o = 1'b0;
      4'b0001: n89_o = 1'b0;
      default: n89_o = 1'b1;
    endcase
  /* fsm.vhd:103:19  */
  assign n94_o = ~rstn_i;
  /* fsm.vhd:114:35  */
  assign n97_o = next_state == 2'b01;
  /* fsm.vhd:114:21  */
  assign n98_o = n97_o ? code_i : code_reg;
  /* fsm.vhd:114:21  */
  assign n99_o = n97_o ? len_i : len_reg;
  /* fsm.vhd:112:17  */
  assign n101_o = state == 2'b00;
  /* fsm.vhd:118:17  */
  assign n103_o = state == 2'b01;
  /* fsm.vhd:121:35  */
  assign n105_o = next_state == 2'b01;
  /* fsm.vhd:122:36  */
  assign n107_o = ptr + 3'b001;
  /* fsm.vhd:121:21  */
  assign n108_o = n105_o ? n107_o : ptr;
  /* fsm.vhd:120:17  */
  assign n110_o = state == 2'b10;
  /* fsm.vhd:125:35  */
  assign n112_o = next_state == 2'b01;
  /* fsm.vhd:126:36  */
  assign n114_o = ptr + 3'b001;
  /* fsm.vhd:125:21  */
  assign n115_o = n112_o ? n114_o : ptr;
  /* fsm.vhd:124:17  */
  assign n117_o = state == 2'b11;
  assign n118_o = {n117_o, n110_o, n103_o, n101_o};
  /* fsm.vhd:111:13  */
  always @*
    case (n118_o)
      4'b1000: n120_o = n115_o;
      4'b0100: n120_o = n108_o;
      4'b0010: n120_o = ptr;
      4'b0001: n120_o = 3'b000;
      default: n120_o = ptr;
    endcase
  /* fsm.vhd:111:13  */
  always @*
    case (n118_o)
      4'b1000: n121_o = code_reg;
      4'b0100: n121_o = code_reg;
      4'b0010: n121_o = code_reg;
      4'b0001: n121_o = n98_o;
      default: n121_o = code_reg;
    endcase
  /* fsm.vhd:111:13  */
  always @*
    case (n118_o)
      4'b1000: n122_o = len_reg;
      4'b0100: n122_o = len_reg;
      4'b0010: n122_o = len_reg;
      4'b0001: n122_o = n99_o;
      default: n122_o = len_reg;
    endcase
  /* fsm.vhd:106:9  */
  always @(posedge clk_i or posedge n94_o)
    if (n94_o)
      n138_q <= 2'b00;
    else
      n138_q <= next_state;
  /* fsm.vhd:101:5  */
  assign n139_o = ~n94_o;
  /* fsm.vhd:106:9  */
  assign n140_o = n139_o ? n120_o : ptr;
  /* fsm.vhd:106:9  */
  always @(posedge clk_i)
    n141_q <= n140_o;
  /* fsm.vhd:101:5  */
  assign n142_o = ~n94_o;
  /* fsm.vhd:106:9  */
  assign n143_o = n142_o ? n121_o : code_reg;
  /* fsm.vhd:106:9  */
  always @(posedge clk_i)
    n144_q <= n143_o;
  /* fsm.vhd:101:5  */
  assign n145_o = ~n94_o;
  /* fsm.vhd:106:9  */
  assign n146_o = n145_o ? n122_o : len_reg;
  /* fsm.vhd:106:9  */
  always @(posedge clk_i)
    n147_q <= n146_o;
  /* fsm.vhd:106:9  */
  always @(posedge clk_i or posedge n94_o)
    if (n94_o)
      n148_q <= 1'b0;
    else
      n148_q <= timer_empty_i;
  /* fsm.vhd:101:5  */
  assign n149_o = ~n94_o;
  /* fsm.vhd:106:9  */
  assign n150_o = n149_o ? led : n151_q;
  /* fsm.vhd:106:9  */
  always @(posedge clk_i)
    n151_q <= n150_o;
  /* fsm.vhd:24:9  */
  assign n152_o = code_reg[0]; // extract
  /* fsm.vhd:23:9  */
  assign n153_o = code_reg[1]; // extract
  /* fsm.vhd:21:9  */
  assign n154_o = code_reg[2]; // extract
  assign n155_o = code_reg[3]; // extract
  /* fsm.vhd:101:5  */
  assign n156_o = code_reg[4]; // extract
  /* fsm.vhd:50:26  */
  assign n157_o = ptr[1:0]; // extract
  /* fsm.vhd:50:26  */
  always @*
    case (n157_o)
      2'b00: n158_o = n152_o;
      2'b01: n158_o = n153_o;
      2'b10: n158_o = n154_o;
      2'b11: n158_o = n155_o;
    endcase
  /* fsm.vhd:50:26  */
  assign n159_o = ptr[2]; // extract
  /* fsm.vhd:50:26  */
  assign n160_o = n159_o ? n156_o : n158_o;
endmodule

module morse_encoder #(
  HALF_CLK_FREQ = 25
  )
  (input  clk_i,
   input  rstn_i,
   input  [2:0] sw_i,
   input  sendn_i,
   output led_o);
  wire [4:0] code;
  wire [2:0] len;
  wire [1:0] set_time;
  wire half_second;
  wire timer_load;
  wire timer_enable;
  wire timer_empty;
  wire send;
  wire n1_o;
  wire n2_o;
  wire fsm_0_led_o;
  wire [1:0] fsm_0_set_time_o;
  wire fsm_0_timer_load_o;
  wire [4:0] input_lut_0_code_o;
  wire [2:0] input_lut_0_len_o;
  wire counter_slow_rollover_o;
  localparam n8_o = 1'b1;
  localparam [26:0] n9_o = 27'b000000000000000000000011001;
  wire counter_0_rollover_o;
  assign led_o = fsm_0_led_o; //(module output)
  /* morse_encoder.vhd:34:12  */
  assign code = input_lut_0_code_o; // (signal)
  /* morse_encoder.vhd:35:12  */
  assign len = input_lut_0_len_o; // (signal)
  /* morse_encoder.vhd:36:12  */
  assign set_time = fsm_0_set_time_o; // (signal)
  /* morse_encoder.vhd:37:12  */
  assign half_second = counter_slow_rollover_o; // (signal)
  /* morse_encoder.vhd:38:12  */
  assign timer_load = fsm_0_timer_load_o; // (signal)
  /* morse_encoder.vhd:39:12  */
  assign timer_enable = n1_o; // (signal)
  /* morse_encoder.vhd:40:12  */
  assign timer_empty = counter_0_rollover_o; // (signal)
  /* morse_encoder.vhd:41:12  */
  assign send = n2_o; // (signal)
  /* morse_encoder.vhd:47:33  */
  assign n1_o = half_second | timer_load;
  /* morse_encoder.vhd:48:21  */
  assign n2_o = ~sendn_i;
  /* morse_encoder.vhd:51:5  */
  fsm_1_1_3_2215d90c8d9b57557cdd6c736ba44d5fd5b41869 fsm_0 (
    .clk_i(clk_i),
    .rstn_i(rstn_i),
    .code_i(code),
    .len_i(len),
    .send_i(send),
    .timer_empty_i(timer_empty),
    .led_o(fsm_0_led_o),
    .set_time_o(fsm_0_set_time_o),
    .timer_load_o(fsm_0_timer_load_o));
  /* morse_encoder.vhd:71:5  */
  input_lut input_lut_0 (
    .sw_i(sw_i),
    .code_o(input_lut_0_code_o),
    .len_o(input_lut_0_len_o));
  /* morse_encoder.vhd:79:5  */
  counter_27_25 counter_slow (
    .clk_i(clk_i),
    .rstn_i(rstn_i),
    .load_i(timer_load),
    .enable_i(n8_o),
    .start_time_i(n9_o),
    .rollover_o(counter_slow_rollover_o));
  /* morse_encoder.vhd:94:5  */
  counter_2_3 counter_0 (
    .clk_i(clk_i),
    .rstn_i(rstn_i),
    .load_i(timer_load),
    .enable_i(timer_enable),
    .start_time_i(set_time),
    .rollover_o(counter_0_rollover_o));
endmodule

