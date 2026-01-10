module mux_2x1(input [31:0] in1, in2, input s, output [31:0] y);
  assign y = (s) ? in2 : in1;
endmodule

module barrel_shifter #(parameter W=32) (
  input [W-1:0] in_reg,
  input [$clog2(W):0] shift_amt,
  input in_m,  // m=1: right rotate, m=0: left rotate
  output [W-1:0] o_reg
);
  wire [W-1:0] l_stage_inp [0:$clog2(W)];
  wire [W-1:0] r_stage_inp [0:$clog2(W)];
  wire [W-1:0] l_stage_o, r_stage_o;

  assign r_stage_inp[0] = in_reg;
  assign l_stage_inp[0] = in_reg;

  genvar i;
  generate
    for(i = 0; i < $clog2(W); i = i + 1) begin : mux_gen_r
      wire [W-1:0] r_in2;
      assign r_in2 = {r_stage_inp[i][(2**i)-1:0], r_stage_inp[i][31:(2**i)]};
      mux_2x1 rm (.in1(r_stage_inp[i]), .in2(r_in2), .s(shift_amt[i]), .y(r_stage_inp[i+1]));
    end
  endgenerate
  assign r_stage_o = r_stage_inp[$clog2(W)];

  generate
    for(i = 0; i < $clog2(W); i = i + 1) begin : mux_gen_l
      wire [W-1:0] l_in2;
      assign l_in2 = {l_stage_inp[i][31-2**i:0],l_stage_inp[i][31:31-2**i+1]};
      mux_2x1 lm (.in1(l_stage_inp[i]), .in2(l_in2), .s(shift_amt[i]), .y(l_stage_inp[i+1]));
    end
  endgenerate
  assign l_stage_o = l_stage_inp[$clog2(W)];

  mux_2x1 out_mux (.in1(l_stage_o), .in2(r_stage_o), .s(in_m), .y(o_reg));
endmodule
