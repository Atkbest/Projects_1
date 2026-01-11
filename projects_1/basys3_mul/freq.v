module freq(
  input clk_100M, rst, 
  output reg clk_1K);
  reg [16:0] cnt;
  always @(posedge clk_100M or posedge rst) begin
    if(rst) begin 
      clk_1K<=0;
      cnt<=0;
    end
    else if(cnt==17'd49999) begin
      clk_1K<=~clk_1K;
      cnt<=0;
    end
    else 
      cnt<=cnt+1;
  end
endmodule
    
      

  