module line_buffer(input [7:0] in_pixel, in_clk, in_rst);
  reg [7:0] sipo [0:4];
  reg [7:0] LB1 [0:4];
  reg [7:0] LB2[0:4];
  reg [2:0]c_ptr;
  integer i;
  reg row_done;
  
  always @(posedge in_clk or posedge in_rst) begin
    if (in_rst) begin 
      c_ptr <= 3'b0;
      for (i=0; i<5; i=i+1) begin
        sipo[i]<= 8'b0;
        LB1[i]<= 8'b0;
        LB2[i]<= 8'b0;
      end
    end
    else begin
      sipo[c_ptr]<=in_pixel;
      if(c_ptr==3'b100) begin
        c_ptr<=0;
        row_done<=1;
      end
      else begin
        c_ptr<=c_ptr+1;
        row_done<=0;
      end
      
      if(row_done==1) begin
        for (i=0; i<5; i=i+1) begin
          LB2[i] <= LB1[i];
          LB1[i] <= sipo[i];
        end
      end
    end
  end
endmodule