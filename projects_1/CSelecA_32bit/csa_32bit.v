module mux(input wire [8:0] a,b, input wire m, output reg [8:0] y);
  always @(*) begin
    if(m==0)
      y=a;
    else
      y=b;
  end
endmodule
module csa_32bit(input [31:0] a,b, input cin, output [31:0] sum, output cout);
  wire [4:0] c;
  wire [8:0] i0,i1,i2,i3,i4,i5;
  assign c[0]=cin;
  wire [8:0] s1, s2, s3;

  assign {c[1],sum[7:0]}=a[7:0]+b[7:0]+c[0];
  
  assign i0 = {1'b0, a[15:8]} + {1'b0, b[15:8]};
  assign i1 = {1'b0, a[15:8]} + {1'b0, b[15:8]} + 9'd1;
  mux m1(.a(i0), .b(i1), .m(c[1]), .y(s1));
  assign {c[2], sum[15:8]} = s1;

  assign i2 = {1'b0, a[23:16]} + {1'b0, b[23:16]};
  assign i3 = {1'b0, a[23:16]} + {1'b0, b[23:16]} + 9'd1;
  mux m2(.a(i2), .b(i3), .m(c[2]), .y(s2));
  assign {c[3], sum[23:16]} = s2;

  assign i4 = {1'b0, a[31:24]} + {1'b0, b[31:24]};
  assign i5 = {1'b0, a[31:24]} + {1'b0, b[31:24]} + 9'd1;
  mux m3(.a(i4), .b(i5), .m(c[3]), .y(s3));
  assign {c[4], sum[31:24]} = s3;
  assign cout=c[4];

endmodule