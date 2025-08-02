module lift(
  input [1:0] in_f,
  input in_rst, in_clk,
  output reg [2:0] o_f,
  output reg o_r
);

  reg [1:0] p_st, n_st;

  // State
  always @(posedge in_clk or posedge in_rst) begin
    if (in_rst)
      p_st <= 2'b00;  // Start at floor 1 (binary 00)
    else
      p_st <= n_st;
  end

  // Output
  always @(*) begin
    o_f = p_st+1;                    
    o_r = (p_st == in_f) ? 1'b1 : 1'b0;
  end

  // Next state logic
  always @(*) begin
    if (p_st > in_f)
      n_st = p_st - 1;
    else if (p_st < in_f)
      n_st = p_st + 1;
    else
      n_st = p_st;
  end

endmodule
