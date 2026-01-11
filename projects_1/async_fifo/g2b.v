module g2b #(parameter B=4)(
  input [B-1:0] gray,
  output [B-1:0] bin
);
  assign bin[B-1]=gray[B-1];
  genvar i;
  generate 
    for(i=B-2; i>=0; i=i-1) begin: loop
      assign bin[i]=bin[i+1]^gray[i];
    end
  endgenerate
endmodule