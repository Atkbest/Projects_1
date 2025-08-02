`timescale 1ns / 1ps
module booth_8bit(
    input wire signed [7:0] in_a, in_b,
    output reg signed [15:0] o_prod
);
    reg signed [16:0] prod;
    reg q_;
    integer i;

    always @(*) begin
        q_ = 1'b0;                   // Initialize q_-1 to zero
        prod = {8'b0, in_b, q_};    // a=0, q=in_b, q_-1=0

        for (i = 0; i < 8; i = i + 1) begin
            case (prod[1:0])
                2'b01: prod[16:9] = prod[16:9] + in_a; // a = a + m
                2'b10: prod[16:9] = prod[16:9] - in_a; // a = a - m
                default: ;                              // no operation
            endcase
            prod = $signed(prod) >>> 1;                 // arithmetic right shift
        end

        o_prod = prod[16:1];                             // final product = {a, q}
    end
endmodule