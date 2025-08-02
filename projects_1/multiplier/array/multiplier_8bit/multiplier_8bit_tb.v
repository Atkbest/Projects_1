module tb_multiplier_8bit;
  reg [7:0] a, b;
  wire [15:0] o;

 
  multiplier_8bit uut (.a(a), .b(b), .o(o));

 
  task run_test;
    input [7:0] a_in, b_in;
    reg [15:0] expected;
    begin
      a = a_in;
      b = b_in;
      expected = a_in * b_in;
      #10; 

      if (o !== expected) begin
        $display("Test Failed: a=%d, b=%d | Expected=%d, Got=%d", a, b, expected, o);
      end else begin
        $display("Test Passed: a=%d, b=%d | Output=%d", a, b, o);
      end
    end
  endtask

  initial begin
    $display("\n--- Starting 8-bit Multiplier Testbench ---");

    run_test(8'd0,   8'd0);
    run_test(8'd1,   8'd1);
    run_test(8'd15,  8'd3);
    run_test(8'd5,   8'd9);
    run_test(8'd100, 8'd2);
    run_test(8'd255, 8'd1);
    run_test(8'd255, 8'd255);

    $display("\n--- Testbench Finished ---");
    $finish;
  end
endmodule