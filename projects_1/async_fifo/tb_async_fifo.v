module tb_async_fifo;
  reg [31:0] w_data;
  reg w_clk, w_rst;
  reg r_clk, r_rst;
  reg w_en, r_en;
  wire [31:0] r_data;
  wire full, empty;
  
  async_fifo dut(
    .w_data(w_data),
    .w_clk(w_clk),
    .w_rst(w_rst),
    .w_en(w_en),
    .r_rst(r_rst),
    .r_clk(r_clk),
    .r_en(r_en),
    .r_data(r_data),
    .full(full),
    .empty(empty)
  );
  
  always #5 w_clk = ~w_clk;  //100 MHz Clock
  always #7 r_clk = ~r_clk;  //71.4 MHz Clock
  
  initial begin
    w_clk=0; r_clk=0;
    r_rst=1; w_rst=1;
    w_en=0; r_en=0;
    #20;
    
    r_rst=0; w_rst=0;

    w_en=1;
    @(posedge w_clk) w_data=32'd1;
    @(posedge w_clk) w_data=32'd2;
    @(posedge w_clk) w_data=32'd3;
    @(posedge w_clk) w_data=32'd4;
    @(posedge w_clk) w_data=32'd5;
    @(posedge w_clk) w_data=32'd6;

    r_en=1;
    @(posedge w_clk) w_data=32'd7;
    @(posedge w_clk) w_data=32'd8;
    @(posedge w_clk) w_data=32'd9;

    // Wait 4 write cycles
    repeat(6) @(posedge w_clk);
    w_en=0;r_en=0;
    
    
    
    r_rst=1; w_rst=1;
    #20;
    r_rst=0; w_rst=0;
    repeat(4) @(posedge w_clk);
    repeat(4) @(posedge r_clk);

    w_en=1;
    @(posedge w_clk) w_data=32'd1;
    @(posedge w_clk) w_data=32'd2;
    @(posedge w_clk) w_data=32'd3;
    w_en=0;

    r_en=1;
    // Wait 3 read cycles
    repeat(3) @(posedge r_clk);
    r_en=0;
  end

  always @(posedge w_clk)
    if (full)
      $display("FULL: w_ptr_next=%b, s_r_ptr=%b at %0t", 
                dut.w_ptr_next, dut.s_r_ptr, $time);

  always @(posedge r_clk)
    if (empty)
      $display("EMPTY: r_ptr=%b, s_w_ptr=%b at %0t",
                dut.r_ptr, dut.s_w_ptr, $time);
  
endmodule
