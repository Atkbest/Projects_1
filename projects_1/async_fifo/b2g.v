module b2g #(parameter B=4)(
  input [B-1:0] bin,
  output [B-1:0] gray
);
  assign gray=(bin>>1)^bin;
endmodule