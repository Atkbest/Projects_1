`timescale 1ns / 1ps
module async_fifo #(parameter WIDTH=32, parameter DEPTH=8)(
  input w_clk, r_clk,
  input w_rst, r_rst,
  input [WIDTH-1:0] w_data,
  input w_en, r_en,
  output reg [WIDTH-1:0] r_data,
  output reg full, empty
  );
  localparam ADDR= $clog2(DEPTH);
  localparam PTR=ADDR+1;
  
  reg [PTR-1:0] r_ptr, w_ptr;//asynchronized pointer
  wire [PTR-1:0] s_r_ptr, s_w_ptr;//synchronized pointer
  wire [PTR-1:0] w1, r1, w2, r2;//wires
  
  reg [WIDTH-1:0] fifo [0:DEPTH-1];//fifo register
 
 //write pointer synchronization
  b2g #(.B(PTR)) f_b2g(.bin(w_ptr),.gray(w1));
  sync #(.B(PTR)) f_sync(.d(w1),.clk(r_clk),.q(w2));
  g2b #(.B(PTR)) f_g2b(.gray(w2),.bin(s_w_ptr));
  
 //read pointer synchronization
  b2g #(.B(PTR)) e_2g(.bin(r_ptr),.gray(r1));
  sync #(.B(PTR)) e_sync(.d(r1),.clk(w_clk),.q(r2));
  g2b #(.B(PTR)) e_g2b(.gray(r2),.bin(s_r_ptr));
  
  wire [PTR-1:0] w_ptr_next = w_ptr + 1'b1;
  wire [PTR-1:0] r_ptr_next = r_ptr + 1'b1;

  always@(*) begin
    full = ((w_ptr_next[PTR-1] != s_r_ptr[PTR-1]) && (w_ptr_next[ADDR-1:0] == s_r_ptr[ADDR-1:0]));//full condition 
    empty = (r_ptr_next == s_w_ptr);//empty condition
  end
  
  //write logic
  always @(posedge w_clk or posedge w_rst) begin
    if(w_rst) begin
      w_ptr<=0;
    end else if((~full)&w_en) begin
      fifo[w_ptr[ADDR-1:0]]<=w_data;//write data
      w_ptr<=w_ptr+1'b1;//update pointer
    end
  end
  
  //read logic
  always @(posedge r_clk or posedge r_rst) begin 
    if(r_rst) begin
      r_ptr<=0;
      r_data<=0;
    end else if((~empty)&r_en) begin
      r_data<=fifo[r_ptr[ADDR-1:0]];//read data
      r_ptr<=r_ptr+1'b1;//update pointer
    end
  end
  
endmodule