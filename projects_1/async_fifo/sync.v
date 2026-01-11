module sync #(parameter B=4)(
  input [B-1:0] d,
  input clk,
  output reg [B-1:0] q
);
  reg [B-1:0] q1;
  always@(posedge clk) begin
    q1<=d;//first flop
    q<=q1;//second flop
  end
endmodule