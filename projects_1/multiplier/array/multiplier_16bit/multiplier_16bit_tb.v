module multiplier_tb;
  reg [15:0] a,b;
  wire [31:0] o;
  reg [31:0] exp;
   
  multiplier_16bit uut(.a(a),.b(b),.o(o));
  initial begin
    $dumpfile("multiplier_tb.vcd");
    $dumpvars;
  end
  initial begin
    exp=16'd0;
    a=0;b=0;
    exp=a*b;
    #1;
    $display("a: %b, b: %b, expected: %b, output: %b",a,b,exp,o);
    #10;
    a=16'd20;b=16'd29;
    exp=16'd0;
    exp=a*b;
    #1;
    $display("a: %b, b: %b, expected: %b, output: %b",a,b,exp,o);
    #10;
    a=16'd2;b=16'd29;
    exp=16'd0;
    exp=a*b;
    #1;
    $display("a: %b, b: %b, expected: %b, output: %b",a,b,exp,o);
    #10;
    a=16'd200;b=16'd29;
    exp=16'd0;
    exp=a*b;
    #1;
    $display("a: %b, b: %b, expected: %b, output: %b",a,b,exp,o);
    #10;
    a=16'd210;b=16'd2239;
    exp=16'd0;
    exp=a*b;
    #1;
    $display("a: %b, b: %b, expected: %b, output: %b",a,b,exp,o);
    #10;
    a=16'd8;b=16'd2;
    exp=16'd0;
    exp=a*b;
    #1;
    $display("a: %b, b: %b, expected: %b, output: %b",a,b,exp,o);
    #10;
    $finish;
  end
endmodule