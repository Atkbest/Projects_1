`timescale 1ns / 1ps

module tb_booth_8bit;
    reg signed [7:0] in_a, in_b;
    wire signed [15:0] o_prod;
    reg signed [15:0] exp;

    booth_8bit uut (.in_a(in_a), .in_b(in_b), .o_prod(o_prod));

    initial begin
        $display("Booth Multiplier Test");

        in_a = 8'sd5;  in_b = 8'sd3;   exp = in_a * in_b; #1;
        $display("a=%4d | b=%4d | output=%6d | expected=%6d", in_a, in_b, o_prod, exp);
        #10;

        in_a = -8'sd7; in_b = 8'sd6;   exp = in_a * in_b; #1;
        $display("a=%4d | b=%4d | output=%6d | expected=%6d", in_a, in_b, o_prod, exp);
        #10;

        in_a = -8'sd8; in_b = -8'sd8; exp = in_a * in_b; #1;
        $display("a=%4d | b=%4d | output=%6d | expected=%6d", in_a, in_b, o_prod, exp);
        #10;

        in_a = 8'sd127; in_b = -8'sd1; exp = in_a * in_b; #1;
        $display("a=%4d | b=%4d | output=%6d | expected=%6d", in_a, in_b, o_prod, exp);
        #10;

        in_a = -8'sd128; in_b = 8'sd2; exp = in_a * in_b; #1;
        $display("a=%4d | b=%4d | output=%6d | expected=%6d", in_a, in_b, o_prod, exp);
        #10;

        $finish;
    end
endmodule
