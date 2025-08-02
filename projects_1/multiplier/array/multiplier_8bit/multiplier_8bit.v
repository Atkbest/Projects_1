module ha(input a,b, output sum,cout);
  assign {cout,sum}=a+b;
endmodule

module fa(input a,b,cin, output sum,cout);
  assign {cout,sum}=a+b+cin;
endmodule

module multiplier_8bit(input [7:0] a,b, output [15:0] o);
  wire [55:0] c;
  wire [41:0] s;
  assign o[0]=a[0]&b[0];
  ha ha1(.a(a[1]&b[0]),.b(a[0]&b[1]),.sum(o[1]),.cout(c[0]));
  ha ha2(.a(a[2]&b[0]),.b(a[1]&b[1]),.sum(s[0]),.cout(c[1]));
  ha ha3(.a(a[3]&b[0]),.b(a[2]&b[1]),.sum(s[1]),.cout(c[2]));
  ha ha4(.a(a[4]&b[0]),.b(a[3]&b[1]),.sum(s[2]),.cout(c[3]));
  ha ha5(.a(a[5]&b[0]),.b(a[4]&b[1]),.sum(s[3]),.cout(c[4]));
  ha ha6(.a(a[6]&b[0]),.b(a[5]&b[1]),.sum(s[4]),.cout(c[5]));
  ha ha7(.a(a[7]&b[0]),.b(a[6]&b[1]),.sum(s[5]),.cout(c[6]));
  
  fa fa1(.a(a[0]&b[2]),.b(s[0]),.cin(c[0]),.sum(o[2]),.cout(c[7]));
  fa fa2(.a(a[1]&b[2]),.b(s[1]),.cin(c[1]),.sum(s[6]),.cout(c[8]));
  fa fa3(.a(a[2]&b[2]),.b(s[2]),.cin(c[2]),.sum(s[7]),.cout(c[9]));
  fa fa4(.a(a[3]&b[2]),.b(s[3]),.cin(c[3]),.sum(s[8]),.cout(c[10]));
  fa fa5(.a(a[4]&b[2]),.b(s[4]),.cin(c[4]),.sum(s[9]),.cout(c[11]));
  fa fa6(.a(a[5]&b[2]),.b(s[5]),.cin(c[5]),.sum(s[10]),.cout(c[12]));
  fa fa7(.a(a[6]&b[2]),.b(a[7]&b[1]),.cin(c[6]),.sum(s[11]),.cout(c[13]));
  
  fa fa8(.a(a[0]&b[3]),.b(s[6]),.cin(c[7]),.sum(o[3]),.cout(c[14]));
  fa fa9(.a(a[1]&b[3]),.b(s[7]),.cin(c[8]),.sum(s[12]),.cout(c[15]));
  fa fa10(.a(a[2]&b[3]),.b(s[8]),.cin(c[9]),.sum(s[13]),.cout(c[16]));
  fa fa11(.a(a[3]&b[3]),.b(s[9]),.cin(c[10]),.sum(s[14]),.cout(c[17]));
  fa fa12(.a(a[4]&b[3]),.b(s[10]),.cin(c[11]),.sum(s[15]),.cout(c[18]));
  fa fa13(.a(a[5]&b[3]),.b(s[11]),.cin(c[12]),.sum(s[16]),.cout(c[19]));
  fa fa14(.a(a[6]&b[3]),.b(a[7]&b[2]),.cin(c[13]),.sum(s[17]),.cout(c[20]));
  
  fa fa15(.a(a[0]&b[4]),.b(s[12]),.cin(c[14]),.sum(o[4]),.cout(c[21]));
  fa fa16(.a(a[1]&b[4]),.b(s[13]),.cin(c[15]),.sum(s[18]),.cout(c[22]));
  fa fa17(.a(a[2]&b[4]),.b(s[14]),.cin(c[16]),.sum(s[19]),.cout(c[23]));
  fa fa18(.a(a[3]&b[4]),.b(s[15]),.cin(c[17]),.sum(s[20]),.cout(c[24]));
  fa fa19(.a(a[4]&b[4]),.b(s[16]),.cin(c[18]),.sum(s[21]),.cout(c[25]));
  fa fa20(.a(a[5]&b[4]),.b(s[17]),.cin(c[19]),.sum(s[22]),.cout(c[26]));
  fa fa21(.a(a[6]&b[4]),.b(a[7]&b[3]),.cin(c[20]),.sum(s[23]),.cout(c[27]));
  
  fa fa22(.a(a[0]&b[5]),.b(s[18]),.cin(c[21]),.sum(o[5]),.cout(c[28]));
  fa fa23(.a(a[1]&b[5]),.b(s[19]),.cin(c[22]),.sum(s[24]),.cout(c[29]));
  fa fa24(.a(a[2]&b[5]),.b(s[20]),.cin(c[23]),.sum(s[25]),.cout(c[30]));
  fa fa25(.a(a[3]&b[5]),.b(s[21]),.cin(c[24]),.sum(s[26]),.cout(c[31]));
  fa fa26(.a(a[4]&b[5]),.b(s[22]),.cin(c[25]),.sum(s[27]),.cout(c[32]));
  fa fa27(.a(a[5]&b[5]),.b(s[23]),.cin(c[26]),.sum(s[28]),.cout(c[33]));
  fa fa28(.a(a[6]&b[5]),.b(a[7]&b[4]),.cin(c[27]),.sum(s[29]),.cout(c[34]));
  
  fa fa29(.a(a[0]&b[6]),.b(s[24]),.cin(c[28]),.sum(o[6]),.cout(c[35]));
  fa fa30(.a(a[1]&b[6]),.b(s[25]),.cin(c[29]),.sum(s[30]),.cout(c[36]));
  fa fa31(.a(a[2]&b[6]),.b(s[26]),.cin(c[30]),.sum(s[31]),.cout(c[37]));
  fa fa32(.a(a[3]&b[6]),.b(s[27]),.cin(c[31]),.sum(s[32]),.cout(c[38]));
  fa fa33(.a(a[4]&b[6]),.b(s[28]),.cin(c[32]),.sum(s[33]),.cout(c[39]));
  fa fa34(.a(a[5]&b[6]),.b(s[29]),.cin(c[33]),.sum(s[34]),.cout(c[40]));
  fa fa35(.a(a[6]&b[6]),.b(a[7]&b[5]),.cin(c[34]),.sum(s[35]),.cout(c[41]));
  
  fa fa36(.a(a[0]&b[7]),.b(s[30]),.cin(c[35]),.sum(o[7]),.cout(c[42]));
  fa fa37(.a(a[1]&b[7]),.b(s[31]),.cin(c[36]),.sum(s[36]),.cout(c[43]));
  fa fa38(.a(a[2]&b[7]),.b(s[32]),.cin(c[37]),.sum(s[37]),.cout(c[44]));
  fa fa39(.a(a[3]&b[7]),.b(s[33]),.cin(c[38]),.sum(s[38]),.cout(c[45]));
  fa fa40(.a(a[4]&b[7]),.b(s[34]),.cin(c[39]),.sum(s[39]),.cout(c[46]));
  fa fa41(.a(a[5]&b[7]),.b(s[35]),.cin(c[40]),.sum(s[40]),.cout(c[47]));
  fa fa42(.a(a[6]&b[7]),.b(a[7]&b[6]),.cin(c[41]),.sum(s[41]),.cout(c[48]));
  
  ha ha8(.a(c[42]),.b(s[36]),.sum(o[8]),.cout(c[49]));
  fa fa43(.a(c[49]),.b(s[37]),.cin(c[43]),.sum(o[9]),.cout(c[50]));
  fa fa44(.a(c[50]),.b(s[38]),.cin(c[44]),.sum(o[10]),.cout(c[51]));
  fa fa45(.a(c[51]),.b(s[39]),.cin(c[45]),.sum(o[11]),.cout(c[52]));
  fa fa46(.a(c[52]),.b(s[40]),.cin(c[46]),.sum(o[12]),.cout(c[53]));
  fa fa47(.a(c[53]),.b(s[41]),.cin(c[47]),.sum(o[13]),.cout(c[54]));
  fa fa48(.a(c[54]),.b(a[7]&b[7]),.cin(c[48]),.sum(o[14]),.cout(o[15]));
  
endmodule
 