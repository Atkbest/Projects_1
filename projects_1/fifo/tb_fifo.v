module tb_fifo;
  reg [31:0]in_data;
  reg in_w_en,in_r_en,in_clk,in_rst;
  wire [31:0] o_data;
  wire o_full, o_empty;
  integer i;
  
  fifo dut(.in_data(in_data),.in_w_en(in_w_en),.in_r_en(in_r_en),.in_clk(in_clk),.in_rst(in_rst),.o_data(o_data),.o_full(o_full),.o_empty(o_empty));
  
  always begin
    #5 in_clk=~in_clk;;
  end
  	
  initial begin
    in_rst=1;
    in_clk=1;
    #20;
    in_rst=0;
    in_w_en=1;
    in_data=32'd1;
    #10;
    in_data=32'd2;
    #10;//w_ptr at 010
    in_w_en=0;
    in_r_en=1;
    #20;//empty signal high
    in_r_en=0;
    in_w_en=1;
    in_data=32'd3;
    #10;
    in_data=32'd4;
    #10;//w_ptr at 100
    in_w_en=0;
    in_r_en=1;
    #20;//empty signal high
    in_r_en=0;
    in_w_en=1;
    in_data=32'd5;
    #10;
    in_data=32'd6;
    #10;
    in_data=32'd7;
    #10;//w_ptr at 111
    in_data=32'd8;
    #10;//w_ptr at 000
    in_data=32'd9;
    #10;
    in_data=32'd0;
    #10;
    in_data=32'd1;
    #10;//full signal high
    in_data=32'd2;
    #10;
    in_w_en=0;
    #20;
  end
  
  always @(posedge in_clk) begin
    $display("FIFO Register file value:\n");
    for(i=0;i<8;i=i+1) begin
      $display("| %0d | ",dut.reg_fifo[i]);
    end
  end
  
  always @(posedge in_clk or posedge in_rst) begin
    $display("|| Write ptr:%b || Write Enable:%b || Read ptr:%b || Read Enable:%b || Input Data:%d || Ouput Data:%d || FIFO Full? : %b || FIFO Empty? : %b ||",dut.w_ptr,in_w_en,dut.r_ptr,in_r_en,in_data,o_data,o_full,o_empty);
  end
  
  initial begin
    #200 $finish;
  end
endmodule