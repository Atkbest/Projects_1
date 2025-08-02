module tb_axi_st;

  reg [15:0] in_data;
  reg in_buffer_emp;
  reg in_clk, in_rst;
  wire [15:0] o_buffer;

  axi4_st dut(
    .in_data(in_data),
    .in_buffer_emp(in_buffer_emp),
    .in_clk(in_clk),
    .in_rst(in_rst),
    .o_buffer(o_buffer)
  );

  always #5 in_clk = ~in_clk;
  always @(posedge in_clk) begin
  $display("TVALID=%b, TREADY=%b", dut.TVALID,dut.TREADY);
  end

  initial begin
    in_clk = 0;
    in_rst = 1;
    in_buffer_emp = 0;
    in_data = 16'd0;
    #10;

    in_rst = 0;

    in_data = 16'd240; // 
    #10;

    in_buffer_emp = 1;  
    #20;

    in_data = 16'd220;
    #30;

    in_data = 16'd260; 
    #20;
    
    in_buffer_emp = 0; 
    
    #20;
    $finish;
  end


endmodule
