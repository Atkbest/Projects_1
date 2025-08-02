module rca_8bit(input wire [7:0] a,b, input wire cin, output reg [7:0] sum, output reg cout);
  reg [8:0] c;
  wire [7:0] p;
  wire block_prop;
  assign p=a^b;
  assign block_prop=p[0]&p[1]&p[2]&p[3]&p[4]&p[5]&p[6]&p[7];
  integer i;
  always @(*) begin
    c[0]=cin;
    for(i=0; i<8; i=i+1) begin
      {c[i+1],sum[i]}=a[i]+b[i]+c[i];
    end
    if(block_prop==1)
      cout=cin;
    else
      cout=c[8];
  end
endmodule
module csa_32bit(input [31:0] a,b, input cin, output [31:0] sum, output cout);
  wire [4:0] c;
  assign c[0]=cin;
  
  rca_8bit add1(.a(a[7:0]),.b(b[7:0]),.cin(c[0]),.sum(sum[7:0]),.cout(c[1]));
  rca_8bit add2(.a(a[15:8]),.b(b[15:8]),.cin(c[1]),.sum(sum[15:8]),.cout(c[2]));
  rca_8bit add3(.a(a[23:16]),.b(b[23:16]),.cin(c[2]),.sum(sum[23:16]),.cout(c[3]));
  rca_8bit add4(.a(a[31:24]),.b(b[31:24]),.cin(c[3]),.sum(sum[31:24]),.cout(c[4]));
  assign cout=c[4];
endmodule