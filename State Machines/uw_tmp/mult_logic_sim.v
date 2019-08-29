//
// Verilog description for cell mult, 
// Thu Jun  1 19:50:39 2017
//
// Precision RTL Synthesis, 64-bit 2015.2.16//


module mult_logic ( clk, reset, i_valid, i_a, i_b, o_valid, o_z, current_state ) ;
    input clk ;
    input reset ;
    input i_valid ;
    input [7:0]i_a ;
    input [7:0]i_b ;
    output o_valid ;
    output [7:0]o_z ;
    output [1:0]current_state ;

    wire [7:0]a;
    wire [7:0]b;
    wire [1:0]next_state;
    wire [7:0]z_0n2s1;
    wire nx21211z1, nx13177z1, nx17971z1, nx1640z1, nx32748z1, nx16457z1, 
         nx32031z1, PWR, GND;
    wire [6:0]a_0n4ss1;
    wire [7:1]b_0n4ss1;
    wire nx61882z2, nx47018z1, NOT_current_state_0_, nx61882z1, nx19052z1, 
         nx55043z1, nx54046z1, nx60567z1, nx61882z5, nx60567z2, nx61882z4, 
         nx54046z2, nx61882z3, nx54046z3;
    wire [166:0] xmplr_dummy ;




    assign PWR = 1'b1 ;
    assign GND = 1'b0 ;
    assign NOT_current_state_0_ = ~current_state[0] ;
    fiftyfivenm_lcell_comb z_add8_0i1_ix36_fadd (.combout (z_0n2s1[0]), .cout (
                           nx21211z1), .dataa (o_z[0]), .datab (b[0]), .datac (
                           1'b1), .datad (PWR)) ;
                           defparam z_add8_0i1_ix36_fadd.lut_mask = 16'h6688;
    fiftyfivenm_lcell_comb z_add8_0i1_ix40_fadd (.combout (z_0n2s1[1]), .cout (
                           nx13177z1), .dataa (o_z[1]), .datab (b[1]), .datac (
                           1'b1), .datad (PWR), .cin (nx21211z1)) ;
                           defparam z_add8_0i1_ix40_fadd.lut_mask = 16'h96e8;
                           defparam z_add8_0i1_ix40_fadd.sum_lutc_input = "cin";
    fiftyfivenm_lcell_comb z_add8_0i1_ix44_fadd (.combout (z_0n2s1[2]), .cout (
                           nx17971z1), .dataa (o_z[2]), .datab (b[2]), .datac (
                           1'b1), .datad (PWR), .cin (nx13177z1)) ;
                           defparam z_add8_0i1_ix44_fadd.lut_mask = 16'h96e8;
                           defparam z_add8_0i1_ix44_fadd.sum_lutc_input = "cin";
    fiftyfivenm_lcell_comb z_add8_0i1_ix48_fadd (.combout (z_0n2s1[3]), .cout (
                           nx1640z1), .dataa (o_z[3]), .datab (b[3]), .datac (
                           1'b1), .datad (PWR), .cin (nx17971z1)) ;
                           defparam z_add8_0i1_ix48_fadd.lut_mask = 16'h96e8;
                           defparam z_add8_0i1_ix48_fadd.sum_lutc_input = "cin";
    fiftyfivenm_lcell_comb z_add8_0i1_ix52_fadd (.combout (z_0n2s1[4]), .cout (
                           nx32748z1), .dataa (o_z[4]), .datab (b[4]), .datac (
                           1'b1), .datad (PWR), .cin (nx1640z1)) ;
                           defparam z_add8_0i1_ix52_fadd.lut_mask = 16'h96e8;
                           defparam z_add8_0i1_ix52_fadd.sum_lutc_input = "cin";
    fiftyfivenm_lcell_comb z_add8_0i1_ix56_fadd (.combout (z_0n2s1[5]), .cout (
                           nx16457z1), .dataa (o_z[5]), .datab (b[5]), .datac (
                           1'b1), .datad (PWR), .cin (nx32748z1)) ;
                           defparam z_add8_0i1_ix56_fadd.lut_mask = 16'h96e8;
                           defparam z_add8_0i1_ix56_fadd.sum_lutc_input = "cin";
    fiftyfivenm_lcell_comb z_add8_0i1_ix60_fadd (.combout (z_0n2s1[6]), .cout (
                           nx32031z1), .dataa (o_z[6]), .datab (b[6]), .datac (
                           1'b1), .datad (PWR), .cin (nx16457z1)) ;
                           defparam z_add8_0i1_ix60_fadd.lut_mask = 16'h96e8;
                           defparam z_add8_0i1_ix60_fadd.sum_lutc_input = "cin";
    fiftyfivenm_lcell_comb z_add8_0i1_ix62_fadd (.combout (z_0n2s1[7]), .dataa (
                           o_z[7]), .datab (b[7]), .datac (1'b1), .datad (PWR), 
                           .cin (nx32031z1)) ;
                           defparam z_add8_0i1_ix62_fadd.lut_mask = 16'h9696;
                           defparam z_add8_0i1_ix62_fadd.sum_lutc_input = "cin";
    dffeas reg_z_7_ (.q (o_z[7]), .d (z_0n2s1[7]), .clk (clk), .ena (nx47018z1)
           , .clrn (PWR), .prn (PWR), .asdata (GND), .sclr (NOT_current_state_0_
           ), .sload (GND)) ;
    dffeas reg_z_6_ (.q (o_z[6]), .d (z_0n2s1[6]), .clk (clk), .ena (nx47018z1)
           , .clrn (PWR), .prn (PWR), .asdata (GND), .sclr (NOT_current_state_0_
           ), .sload (GND)) ;
    dffeas reg_z_5_ (.q (o_z[5]), .d (z_0n2s1[5]), .clk (clk), .ena (nx47018z1)
           , .clrn (PWR), .prn (PWR), .asdata (GND), .sclr (NOT_current_state_0_
           ), .sload (GND)) ;
    dffeas reg_z_4_ (.q (o_z[4]), .d (z_0n2s1[4]), .clk (clk), .ena (nx47018z1)
           , .clrn (PWR), .prn (PWR), .asdata (GND), .sclr (NOT_current_state_0_
           ), .sload (GND)) ;
    dffeas reg_z_3_ (.q (o_z[3]), .d (z_0n2s1[3]), .clk (clk), .ena (nx47018z1)
           , .clrn (PWR), .prn (PWR), .asdata (GND), .sclr (NOT_current_state_0_
           ), .sload (GND)) ;
    dffeas reg_z_2_ (.q (o_z[2]), .d (z_0n2s1[2]), .clk (clk), .ena (nx47018z1)
           , .clrn (PWR), .prn (PWR), .asdata (GND), .sclr (NOT_current_state_0_
           ), .sload (GND)) ;
    dffeas reg_z_1_ (.q (o_z[1]), .d (z_0n2s1[1]), .clk (clk), .ena (nx47018z1)
           , .clrn (PWR), .prn (PWR), .asdata (GND), .sclr (NOT_current_state_0_
           ), .sload (GND)) ;
    dffeas reg_z_0_ (.q (o_z[0]), .d (z_0n2s1[0]), .clk (clk), .ena (nx47018z1)
           , .clrn (PWR), .prn (PWR), .asdata (GND), .sclr (NOT_current_state_0_
           ), .sload (GND)) ;
    dffeas reg_o_valid (.q (o_valid), .d (nx60567z1), .clk (clk), .ena (PWR), .clrn (
           PWR), .prn (PWR), .asdata (GND), .sclr (1'b0), .sload (1'b0)) ;
    dffeas reg_next_state_1_ (.q (next_state[1]), .d (nx54046z1), .clk (clk), .ena (
           PWR), .clrn (nx54046z3), .prn (nx54046z3), .aload (GND), .asdata (GND
           ), .sclr (GND), .sload (GND)) ;
           defparam reg_next_state_1_.power_up = "low";
    assign nx54046z3 = ~GND ;
    dffeas reg_next_state_0_ (.q (next_state[0]), .d (nx55043z1), .clk (clk), .ena (
           PWR), .clrn (nx54046z3), .prn (nx54046z3), .aload (GND), .asdata (GND
           ), .sclr (GND), .sload (GND)) ;
           defparam reg_next_state_0_.power_up = "low";
    dffeas reg_b_0_ (.q (b[0]), .d (nx19052z1), .clk (clk), .ena (nx61882z2), .clrn (
           PWR), .prn (PWR), .asdata (GND), .sclr (1'b0), .sload (1'b0)) ;
    dffeas reg_a_7_ (.q (a[7]), .d (nx61882z1), .clk (clk), .ena (nx61882z2), .clrn (
           PWR), .prn (PWR), .asdata (GND), .sclr (1'b0), .sload (1'b0)) ;
    fiftyfivenm_lcell_comb ix60885z7095 (.combout (a_0n4ss1[6]), .dataa (1'b1), 
                           .datab (a[7]), .datac (current_state[0]), .datad (
                           i_a[6])) ;
                           defparam ix60885z7095.lut_mask = 16'hcfc0;
    fiftyfivenm_lcell_comb ix59888z7095 (.combout (a_0n4ss1[5]), .dataa (1'b1), 
                           .datab (a[6]), .datac (current_state[0]), .datad (
                           i_a[5])) ;
                           defparam ix59888z7095.lut_mask = 16'hcfc0;
    fiftyfivenm_lcell_comb ix58891z7095 (.combout (a_0n4ss1[4]), .dataa (1'b1), 
                           .datab (a[5]), .datac (current_state[0]), .datad (
                           i_a[4])) ;
                           defparam ix58891z7095.lut_mask = 16'hcfc0;
    fiftyfivenm_lcell_comb ix57894z7095 (.combout (a_0n4ss1[3]), .dataa (1'b1), 
                           .datab (a[4]), .datac (current_state[0]), .datad (
                           i_a[3])) ;
                           defparam ix57894z7095.lut_mask = 16'hcfc0;
    fiftyfivenm_lcell_comb ix56897z7095 (.combout (a_0n4ss1[2]), .dataa (1'b1), 
                           .datab (a[3]), .datac (current_state[0]), .datad (
                           i_a[2])) ;
                           defparam ix56897z7095.lut_mask = 16'hcfc0;
    fiftyfivenm_lcell_comb ix55900z7095 (.combout (a_0n4ss1[1]), .dataa (1'b1), 
                           .datab (a[2]), .datac (current_state[0]), .datad (
                           i_a[1])) ;
                           defparam ix55900z7095.lut_mask = 16'hcfc0;
    fiftyfivenm_lcell_comb ix54903z7095 (.combout (a_0n4ss1[0]), .dataa (1'b1), 
                           .datab (a[1]), .datac (current_state[0]), .datad (
                           i_a[0])) ;
                           defparam ix54903z7095.lut_mask = 16'hcfc0;
    fiftyfivenm_lcell_comb ix12073z7095 (.combout (b_0n4ss1[7]), .dataa (1'b1), 
                           .datab (b[6]), .datac (current_state[0]), .datad (
                           i_b[7])) ;
                           defparam ix12073z7095.lut_mask = 16'hcfc0;
    fiftyfivenm_lcell_comb ix13070z7095 (.combout (b_0n4ss1[6]), .dataa (1'b1), 
                           .datab (b[5]), .datac (current_state[0]), .datad (
                           i_b[6])) ;
                           defparam ix13070z7095.lut_mask = 16'hcfc0;
    fiftyfivenm_lcell_comb ix14067z7095 (.combout (b_0n4ss1[5]), .dataa (1'b1), 
                           .datab (b[4]), .datac (current_state[0]), .datad (
                           i_b[5])) ;
                           defparam ix14067z7095.lut_mask = 16'hcfc0;
    fiftyfivenm_lcell_comb ix15064z7095 (.combout (b_0n4ss1[4]), .dataa (1'b1), 
                           .datab (b[3]), .datac (current_state[0]), .datad (
                           i_b[4])) ;
                           defparam ix15064z7095.lut_mask = 16'hcfc0;
    fiftyfivenm_lcell_comb ix16061z7095 (.combout (b_0n4ss1[3]), .dataa (1'b1), 
                           .datab (b[2]), .datac (current_state[0]), .datad (
                           i_b[3])) ;
                           defparam ix16061z7095.lut_mask = 16'hcfc0;
    fiftyfivenm_lcell_comb ix17058z7095 (.combout (b_0n4ss1[2]), .dataa (1'b1), 
                           .datab (b[1]), .datac (current_state[0]), .datad (
                           i_b[2])) ;
                           defparam ix17058z7095.lut_mask = 16'hcfc0;
    fiftyfivenm_lcell_comb ix18055z7095 (.combout (b_0n4ss1[1]), .dataa (1'b1), 
                           .datab (b[0]), .datac (current_state[0]), .datad (
                           i_b[1])) ;
                           defparam ix18055z7095.lut_mask = 16'hcfc0;
    fiftyfivenm_lcell_comb ix61882z7096 (.combout (nx61882z2), .dataa (nx61882z3
                           ), .datab (nx61882z5), .datac (current_state[0]), .datad (
                           i_valid)) ;
                           defparam ix61882z7096.lut_mask = 16'h8c88;
    fiftyfivenm_lcell_comb ix47018z7095 (.combout (nx47018z1), .dataa (nx61882z5
                           ), .datab (a[0]), .datac (current_state[0]), .datad (
                           i_valid)) ;
                           defparam ix47018z7095.lut_mask = 16'h8a80;
    fiftyfivenm_lcell_comb ix61882z7095 (.combout (nx61882z1), .dataa (1'b1), .datab (
                           1'b1), .datac (current_state[0]), .datad (i_a[7])) ;
                           defparam ix61882z7095.lut_mask = 16'h0f00;
    fiftyfivenm_lcell_comb ix19052z7095 (.combout (nx19052z1), .dataa (1'b1), .datab (
                           1'b1), .datac (current_state[0]), .datad (i_b[0])) ;
                           defparam ix19052z7095.lut_mask = 16'h0f00;
    fiftyfivenm_lcell_comb ix55043z7095 (.combout (nx55043z1), .dataa (
                           current_state[0]), .datab (current_state[1]), .datac (
                           i_valid), .datad (reset)) ;
                           defparam ix55043z7095.lut_mask = 16'h0032;
    fiftyfivenm_lcell_comb ix54046z7095 (.combout (nx54046z1), .dataa (nx54046z2
                           ), .datab (nx61882z4), .datac (nx61882z5), .datad (
                           current_state[0])) ;
                           defparam ix54046z7095.lut_mask = 16'h8000;
    fiftyfivenm_lcell_comb ix60567z7095 (.combout (nx60567z1), .dataa (nx60567z2
                           ), .datab (current_state[0]), .datac (o_valid), .datad (
                           i_valid)) ;
                           defparam ix60567z7095.lut_mask = 16'he4f4;
    fiftyfivenm_lcell_comb ix61882z7099 (.combout (nx61882z5), .dataa (1'b1), .datab (
                           1'b1), .datac (current_state[1]), .datad (reset)) ;
                           defparam ix61882z7099.lut_mask = 16'h000f;
    fiftyfivenm_lcell_comb ix60567z7096 (.combout (nx60567z2), .dataa (1'b1), .datab (
                           current_state[0]), .datac (current_state[1]), .datad (
                           reset)) ;
                           defparam ix60567z7096.lut_mask = 16'hff0c;
    fiftyfivenm_lcell_comb ix61882z7098 (.combout (nx61882z4), .dataa (a[4]), .datab (
                           a[5]), .datac (a[6]), .datad (a[7])) ;
                           defparam ix61882z7098.lut_mask = 16'h0001;
    fiftyfivenm_lcell_comb ix54046z7096 (.combout (nx54046z2), .dataa (a[0]), .datab (
                           a[1]), .datac (a[2]), .datad (a[3])) ;
                           defparam ix54046z7096.lut_mask = 16'h0001;
    fiftyfivenm_lcell_comb ix61882z7097 (.combout (nx61882z3), .dataa (1'b1), .datab (
                           nx54046z2), .datac (nx61882z4), .datad (
                           current_state[0])) ;
                           defparam ix61882z7097.lut_mask = 16'h3f00;
    dffeas reg_current_state_1_ (.q (current_state[1]), .d (next_state[1]), .clk (
           clk), .ena (1'b1), .clrn (nx54046z3), .prn (nx54046z3), .asdata (1'b0
           ), .sclr (1'b0), .sload (1'b0)) ;
           defparam reg_current_state_1_.power_up = "low";
    dffeas reg_current_state_0_ (.q (current_state[0]), .d (next_state[0]), .clk (
           clk), .ena (1'b1), .clrn (nx54046z3), .prn (nx54046z3), .asdata (1'b0
           ), .sclr (1'b0), .sload (1'b0)) ;
           defparam reg_current_state_0_.power_up = "low";
    dffeas reg_b_7_ (.q (b[7]), .d (b_0n4ss1[7]), .clk (clk), .ena (nx61882z2), 
           .clrn (PWR), .prn (PWR), .asdata (1'b0), .sclr (1'b0), .sload (1'b0)
           ) ;
    dffeas reg_b_6_ (.q (b[6]), .d (b_0n4ss1[6]), .clk (clk), .ena (nx61882z2), 
           .clrn (PWR), .prn (PWR), .asdata (1'b0), .sclr (1'b0), .sload (1'b0)
           ) ;
    dffeas reg_b_5_ (.q (b[5]), .d (b_0n4ss1[5]), .clk (clk), .ena (nx61882z2), 
           .clrn (PWR), .prn (PWR), .asdata (1'b0), .sclr (1'b0), .sload (1'b0)
           ) ;
    dffeas reg_b_4_ (.q (b[4]), .d (b_0n4ss1[4]), .clk (clk), .ena (nx61882z2), 
           .clrn (PWR), .prn (PWR), .asdata (1'b0), .sclr (1'b0), .sload (1'b0)
           ) ;
    dffeas reg_b_3_ (.q (b[3]), .d (b_0n4ss1[3]), .clk (clk), .ena (nx61882z2), 
           .clrn (PWR), .prn (PWR), .asdata (1'b0), .sclr (1'b0), .sload (1'b0)
           ) ;
    dffeas reg_b_2_ (.q (b[2]), .d (b_0n4ss1[2]), .clk (clk), .ena (nx61882z2), 
           .clrn (PWR), .prn (PWR), .asdata (1'b0), .sclr (1'b0), .sload (1'b0)
           ) ;
    dffeas reg_b_1_ (.q (b[1]), .d (b_0n4ss1[1]), .clk (clk), .ena (nx61882z2), 
           .clrn (PWR), .prn (PWR), .asdata (1'b0), .sclr (1'b0), .sload (1'b0)
           ) ;
    dffeas reg_a_6_ (.q (a[6]), .d (a_0n4ss1[6]), .clk (clk), .ena (nx61882z2), 
           .clrn (PWR), .prn (PWR), .asdata (1'b0), .sclr (1'b0), .sload (1'b0)
           ) ;
    dffeas reg_a_5_ (.q (a[5]), .d (a_0n4ss1[5]), .clk (clk), .ena (nx61882z2), 
           .clrn (PWR), .prn (PWR), .asdata (1'b0), .sclr (1'b0), .sload (1'b0)
           ) ;
    dffeas reg_a_4_ (.q (a[4]), .d (a_0n4ss1[4]), .clk (clk), .ena (nx61882z2), 
           .clrn (PWR), .prn (PWR), .asdata (1'b0), .sclr (1'b0), .sload (1'b0)
           ) ;
    dffeas reg_a_3_ (.q (a[3]), .d (a_0n4ss1[3]), .clk (clk), .ena (nx61882z2), 
           .clrn (PWR), .prn (PWR), .asdata (1'b0), .sclr (1'b0), .sload (1'b0)
           ) ;
    dffeas reg_a_2_ (.q (a[2]), .d (a_0n4ss1[2]), .clk (clk), .ena (nx61882z2), 
           .clrn (PWR), .prn (PWR), .asdata (1'b0), .sclr (1'b0), .sload (1'b0)
           ) ;
    dffeas reg_a_1_ (.q (a[1]), .d (a_0n4ss1[1]), .clk (clk), .ena (nx61882z2), 
           .clrn (PWR), .prn (PWR), .asdata (1'b0), .sclr (1'b0), .sload (1'b0)
           ) ;
    dffeas reg_a_0_ (.q (a[0]), .d (a_0n4ss1[0]), .clk (clk), .ena (nx61882z2), 
           .clrn (PWR), .prn (PWR), .asdata (1'b0), .sclr (1'b0), .sload (1'b0)
           ) ;
endmodule

