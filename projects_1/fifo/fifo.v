module fifo #(parameter W=32,parameter D=8)
  (input [W-1:0] in_data,
   input in_w_en,in_r_en,in_clk,in_rst,
   output reg [W-1:0] o_data,
   output reg o_full,o_empty
  );
  
  reg [$clog2(D):0] r_ptr,w_ptr;
  reg [W-1:0] reg_fifo [0:D-1];
  
  always @(*) begin
  	o_empty = (w_ptr == r_ptr);
    o_full  = ((w_ptr+1)%D) == r_ptr;
  end
  
  always @(posedge in_clk or in_rst) begin
    if(in_rst)begin
      w_ptr<=0;
      r_ptr<=0;
    end
    else begin
      if(in_r_en&in_w_en&(~o_empty)&(~o_full)) begin//simultaneous 
        reg_fifo[w_ptr]<=in_data;
      	w_ptr<=(w_ptr+1)%D;
        o_data<=reg_fifo[r_ptr];
      	r_ptr<=(r_ptr+1)%D;
      end
      else if(in_w_en&(~o_full)) begin
        reg_fifo[w_ptr]<=in_data;
      	w_ptr<=(w_ptr+1)%D;
      end
      else if(in_r_en&(~o_empty)) begin
        o_data<=reg_fifo[r_ptr];
      	r_ptr<=(r_ptr+1)%D;
      end
    end
  end
endmodule
