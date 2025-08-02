module tb_traffic;
  reg in_srt, in_clk, in_rst;
  wire o_green, o_red, o_yellow;
  wire [3:0] o_count;

  traffic dut(
    .in_srt(in_srt),
    .in_clk(in_clk),
    .in_rst(in_rst),
    .o_green(o_green),
    .o_red(o_red),
    .o_yellow(o_yellow),
    .o_count(o_count)
  );

  always begin
    #5 in_clk = ~in_clk;
  end

  initial begin
    in_clk = 0;
    in_rst = 1;
    in_srt = 0;
    #20;
    in_rst = 0;
    #20;
    
    
    in_srt = 1;
    #20;
    in_srt = 0;
  end
  
  initial begin
    $display("Time\t\tStart\tState\tCount\tGreen\tYellow\tRed");
    $monitor("%0t\t%b\t%0d\t%0d\t%b\t%b\t%b",
             $time, in_srt, dut.p_st, dut.count, o_green, o_yellow, o_red);
  end


  initial begin
    #600 $finish;
  end
endmodule
