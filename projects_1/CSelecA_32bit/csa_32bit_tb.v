module csa_32bit_tb;
  reg [31:0] a, b;
  reg cin;
  wire [31:0] sum;
  wire cout;

  csa_32bit uut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

  initial begin
    $dumpfile("csa_32bit.vcd");
    $dumpvars;
  end

  integer i, j;
  reg [32:0] expected;

  initial begin
    $display("Starting CSA 32-bit test...");

    for (i = 0; i < 10; i = i + 1) begin
      for (j = 0; j < 2; j = j + 1) begin
        a = 32'b0;
        b = 32'b0;
        a[i] = 1'b1;
        cin = j;
        #1;
        expected = a + b + cin;
        if ({cout, sum} !== expected)
          $display("FAIL");
        else
          $display("PASS");

        a = 32'b0;
        b = 32'b0;
        b[i] = 1'b1;
        cin = j;
        #1;
        expected = a + b + cin;
        if ({cout, sum} !== expected)
          $display("FAIL");
        else
          $display("PASS");
      end
      #10;
    end

    $display("Test completed.");
    $finish;
  end
endmodule