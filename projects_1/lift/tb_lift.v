module tb_lift;
  reg [1:0] in_f;
  reg in_rst, in_clk;
  wire [2:0] o_f;
  wire o_r;

  lift dut(.in_f(in_f), .in_rst(in_rst), .in_clk(in_clk), .o_f(o_f), .o_r(o_r));

  // Clock generator
  always #5 in_clk = ~in_clk;

  initial begin
    in_clk = 0;
    in_rst = 1;
    #10;
    in_rst = 0;
    in_f = 2'b11; // 4th floor
    #40;
    in_f = 2'b01; // 2nd floor
    #30;
    in_f = 2'b10; // 3rd floor
    #20;
    in_f = 2'b00; // 1st floor
    #30;
    in_rst = 1;
    #10;
    in_rst = 0;
  end

  always @(posedge in_clk) begin
    $display("Time=%0t | Floor Selected: %0d | Current Floor: %0d | Reached: %b", 
          $time, in_f + 1, o_f , o_r);
  end

  initial begin
    #400 $finish;
  end
endmodule
