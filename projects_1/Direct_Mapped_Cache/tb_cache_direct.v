module tb_cache_direct;
  reg clk;
  reg rst;
  reg cpu_req;
  reg cpu_we;
  reg [31:0] cpu_add;
  reg [31:0] cpu_wdata;
  wire [31:0] cpu_rdata;
  wire cpu_ready;
  wire mem_read;
  wire mem_write;
  wire [31:0] mem_add;
  wire [127:0] mem_wdata;
  reg [127:0] mem_rdata;

  cache_direct dut(
    .clk(clk),
    .rst(rst),
    .cpu_req(cpu_req),
    .cpu_we(cpu_we),
    .cpu_add(cpu_add),
    .cpu_wdata(cpu_wdata),
    .cpu_rdata(cpu_rdata),
    .cpu_ready(cpu_ready),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .mem_add(mem_add),
    .mem_wdata(mem_wdata),
    .mem_rdata(mem_rdata)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    cpu_req = 0;
    cpu_we = 0;
    cpu_add = 0;
    cpu_wdata = 0;
    mem_rdata = 0;

    #20 rst = 0;

    @(posedge clk);
    cpu_req = 1;
    cpu_we  = 0;
    cpu_add = 32'h0000_0040;

    wait(mem_read);           
    @(posedge clk);
    mem_rdata = 128'h11111111111111111111111111111111;

    wait(cpu_ready);
    @(posedge clk);
    cpu_req = 0;


    #20;
    @(posedge clk);
    cpu_req = 1;
    cpu_we  = 1;
    cpu_add = 32'h0000_0040;
    cpu_wdata = 32'hAAAAAAAA;

    wait(cpu_ready);
    @(posedge clk);
    cpu_req = 0;


    #20;
    @(posedge clk);
    cpu_req = 1;
    cpu_we  = 0;
    cpu_add = 32'h0000_4040;

    wait(mem_write);            
    wait(mem_read);           
    @(posedge clk);
    mem_rdata = 128'h99999999999999999999999999999999;

    wait(cpu_ready);
    @(posedge clk);
    cpu_req = 0;

    #100 $finish;
  end

endmodule
