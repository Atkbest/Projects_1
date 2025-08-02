module cla_8bit_tb;
  reg [7:0] a, b;
  reg cin;
  wire [7:0] sum;
  wire cout;

  cla_8bit uut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

  initial begin
    $dumpfile("cla_8bit.vcd");
    $dumpvars;
  end

  integer i, j;
  reg [8:0] expected;

  initial begin
    $display("Starting CLA 8-bit test...");

    for (i = 0; i < 8; i = i + 1) begin
      for (j = 0; j < 2; j = j + 1) begin
        a = 8'b0;
        b = 8'b0;
        a[i] = 1'b1;
        cin = j;
        #1;
        expected = a + b + cin;
        if ({cout, sum} !== expected)
          $display("FAIL");
        else
          $display("PASS");

        a = 8'b0;
        b = 8'b0;
        b[i] = 1'b1;
        cin = j;
        #1;
        expected = a + b + cin;
        if ({cout, sum} !== expected)
          $display("FAIL");
        else
          $display("PASS");
          #10;
      end
    end

    $display("Test completed.");
    $finish;
  end
endmodule