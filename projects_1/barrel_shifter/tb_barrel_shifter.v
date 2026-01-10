module tb_barrel_shifter;
  reg [31:0] in_reg;
  reg [5:0] shift_amt;
  reg in_m;
  wire [31:0] o_reg;

  barrel_shifter dut(.in_reg(in_reg), .shift_amt(shift_amt), .in_m(in_m), .o_reg(o_reg));

  initial begin
    in_reg = 32'd3546321837;

    in_m = 1; // Right rotate
    shift_amt = 1; #10;
    $display("Right Rotate by 1: %d", o_reg);
    
    shift_amt = 2; #10;
    $display("Right Rotate by 2: %d", o_reg);
    
    shift_amt = 4; #10;
    $display("Right Rotate by 4: %d", o_reg);
    
    shift_amt = 8; #10;
    $display("Right Rotate by 8: %d", o_reg);
    
    shift_amt = 16; #10;
    $display("Right Rotate by 16: %d", o_reg);
    
    in_m = 0; // Left rotate
    shift_amt = 1; #10;
    $display("Left Rotate by 1: %d", o_reg);
    
    shift_amt = 2; #10;
    $display("Left Rotate by 2: %d", o_reg);
    
    shift_amt = 4; #10;
    $display("Left Rotate by 4: %d", o_reg);
    
    shift_amt = 8; #10;
    $display("Left Rotate by 8: %d", o_reg);
    
    shift_amt = 16; #10;
    $display("Left Rotate by 16: %d", o_reg);

    $finish;
  end
endmodule
