module ha(input a, b, output sum, cout);
  assign {cout, sum} = a + b;
endmodule

module fa(input a, b, cin, output sum, cout);
  assign {cout, sum} = a + b + cin;
endmodule

module multiplier_16bit(input [15:0] a, b, output [31:0] o);
  wire [254:0] c;
  wire [209:0] s;
  
  assign o[0] = a[0] & b[0];
  
  
  ha ha1(.a(a[1]&b[0]), .b(a[0]&b[1]), .sum(o[1]), .cout(c[0]));
  
  
  ha ha2(.a(a[2]&b[0]), .b(a[1]&b[1]), .sum(s[0]), .cout(c[1]));
  ha ha3(.a(a[3]&b[0]), .b(a[2]&b[1]), .sum(s[1]), .cout(c[2]));
  ha ha4(.a(a[4]&b[0]), .b(a[3]&b[1]), .sum(s[2]), .cout(c[3]));
  ha ha5(.a(a[5]&b[0]), .b(a[4]&b[1]), .sum(s[3]), .cout(c[4]));
  ha ha6(.a(a[6]&b[0]), .b(a[5]&b[1]), .sum(s[4]), .cout(c[5]));
  ha ha7(.a(a[7]&b[0]), .b(a[6]&b[1]), .sum(s[5]), .cout(c[6]));
  ha ha8(.a(a[8]&b[0]), .b(a[7]&b[1]), .sum(s[6]), .cout(c[7]));
  ha ha9(.a(a[9]&b[0]), .b(a[8]&b[1]), .sum(s[7]), .cout(c[8]));
  ha ha10(.a(a[10]&b[0]), .b(a[9]&b[1]), .sum(s[8]), .cout(c[9]));
  ha ha11(.a(a[11]&b[0]), .b(a[10]&b[1]), .sum(s[9]), .cout(c[10]));
  ha ha12(.a(a[12]&b[0]), .b(a[11]&b[1]), .sum(s[10]), .cout(c[11]));
  ha ha13(.a(a[13]&b[0]), .b(a[12]&b[1]), .sum(s[11]), .cout(c[12]));
  ha ha14(.a(a[14]&b[0]), .b(a[13]&b[1]), .sum(s[12]), .cout(c[13]));
  ha ha15(.a(a[15]&b[0]), .b(a[14]&b[1]), .sum(s[13]), .cout(c[14]));
  
  // Stage 3
  fa fa1(.a(a[0]&b[2]), .b(s[0]), .cin(c[0]), .sum(o[2]), .cout(c[15]));
  fa fa2(.a(a[1]&b[2]), .b(s[1]), .cin(c[1]), .sum(s[14]), .cout(c[16]));
  fa fa3(.a(a[2]&b[2]), .b(s[2]), .cin(c[2]), .sum(s[15]), .cout(c[17]));
  fa fa4(.a(a[3]&b[2]), .b(s[3]), .cin(c[3]), .sum(s[16]), .cout(c[18]));
  fa fa5(.a(a[4]&b[2]), .b(s[4]), .cin(c[4]), .sum(s[17]), .cout(c[19]));
  fa fa6(.a(a[5]&b[2]), .b(s[5]), .cin(c[5]), .sum(s[18]), .cout(c[20]));
  fa fa7(.a(a[6]&b[2]), .b(s[6]), .cin(c[6]), .sum(s[19]), .cout(c[21]));
  fa fa8(.a(a[7]&b[2]), .b(s[7]), .cin(c[7]), .sum(s[20]), .cout(c[22]));
  fa fa9(.a(a[8]&b[2]), .b(s[8]), .cin(c[8]), .sum(s[21]), .cout(c[23]));
  fa fa10(.a(a[9]&b[2]), .b(s[9]), .cin(c[9]), .sum(s[22]), .cout(c[24]));
  fa fa11(.a(a[10]&b[2]), .b(s[10]), .cin(c[10]), .sum(s[23]), .cout(c[25]));
  fa fa12(.a(a[11]&b[2]), .b(s[11]), .cin(c[11]), .sum(s[24]), .cout(c[26]));
  fa fa13(.a(a[12]&b[2]), .b(s[12]), .cin(c[12]), .sum(s[25]), .cout(c[27]));
  fa fa14(.a(a[13]&b[2]), .b(s[13]), .cin(c[13]), .sum(s[26]), .cout(c[28]));
  fa fa15(.a(a[14]&b[2]), .b(a[15]&b[1]), .cin(c[14]), .sum(s[27]), .cout(c[29]));
  
  // Stage 4
  fa fa16(.a(a[0]&b[3]), .b(s[14]), .cin(c[15]), .sum(o[3]), .cout(c[30]));
  fa fa17(.a(a[1]&b[3]), .b(s[15]), .cin(c[16]), .sum(s[28]), .cout(c[31]));
  fa fa18(.a(a[2]&b[3]), .b(s[16]), .cin(c[17]), .sum(s[29]), .cout(c[32]));
  fa fa19(.a(a[3]&b[3]), .b(s[17]), .cin(c[18]), .sum(s[30]), .cout(c[33]));
  fa fa20(.a(a[4]&b[3]), .b(s[18]), .cin(c[19]), .sum(s[31]), .cout(c[34]));
  fa fa21(.a(a[5]&b[3]), .b(s[19]), .cin(c[20]), .sum(s[32]), .cout(c[35]));
  fa fa22(.a(a[6]&b[3]), .b(s[20]), .cin(c[21]), .sum(s[33]), .cout(c[36]));
  fa fa23(.a(a[7]&b[3]), .b(s[21]), .cin(c[22]), .sum(s[34]), .cout(c[37]));
  fa fa24(.a(a[8]&b[3]), .b(s[22]), .cin(c[23]), .sum(s[35]), .cout(c[38]));
  fa fa25(.a(a[9]&b[3]), .b(s[23]), .cin(c[24]), .sum(s[36]), .cout(c[39]));
  fa fa26(.a(a[10]&b[3]), .b(s[24]), .cin(c[25]), .sum(s[37]), .cout(c[40]));
  fa fa27(.a(a[11]&b[3]), .b(s[25]), .cin(c[26]), .sum(s[38]), .cout(c[41]));
  fa fa28(.a(a[12]&b[3]), .b(s[26]), .cin(c[27]), .sum(s[39]), .cout(c[42]));
  fa fa29(.a(a[13]&b[3]), .b(s[27]), .cin(c[28]), .sum(s[40]), .cout(c[43]));
  fa fa30(.a(a[14]&b[3]), .b(a[15]&b[2]), .cin(c[29]), .sum(s[41]), .cout(c[44]));
  
  // Stage 5
  fa fa31(.a(a[0]&b[4]), .b(s[28]), .cin(c[30]), .sum(o[4]), .cout(c[45]));
  fa fa32(.a(a[1]&b[4]), .b(s[29]), .cin(c[31]), .sum(s[42]), .cout(c[46]));
  fa fa33(.a(a[2]&b[4]), .b(s[30]), .cin(c[32]), .sum(s[43]), .cout(c[47]));
  fa fa34(.a(a[3]&b[4]), .b(s[31]), .cin(c[33]), .sum(s[44]), .cout(c[48]));
  fa fa35(.a(a[4]&b[4]), .b(s[32]), .cin(c[34]), .sum(s[45]), .cout(c[49]));
  fa fa36(.a(a[5]&b[4]), .b(s[33]), .cin(c[35]), .sum(s[46]), .cout(c[50]));
  fa fa37(.a(a[6]&b[4]), .b(s[34]), .cin(c[36]), .sum(s[47]), .cout(c[51]));
  fa fa38(.a(a[7]&b[4]), .b(s[35]), .cin(c[37]), .sum(s[48]), .cout(c[52]));
  fa fa39(.a(a[8]&b[4]), .b(s[36]), .cin(c[38]), .sum(s[49]), .cout(c[53]));
  fa fa40(.a(a[9]&b[4]), .b(s[37]), .cin(c[39]), .sum(s[50]), .cout(c[54]));
  fa fa41(.a(a[10]&b[4]), .b(s[38]), .cin(c[40]), .sum(s[51]), .cout(c[55]));
  fa fa42(.a(a[11]&b[4]), .b(s[39]), .cin(c[41]), .sum(s[52]), .cout(c[56]));
  fa fa43(.a(a[12]&b[4]), .b(s[40]), .cin(c[42]), .sum(s[53]), .cout(c[57]));
  fa fa44(.a(a[13]&b[4]), .b(s[41]), .cin(c[43]), .sum(s[54]), .cout(c[58]));
  fa fa45(.a(a[14]&b[4]), .b(a[15]&b[3]), .cin(c[44]), .sum(s[55]), .cout(c[59]));
  
  // Stage 6
  fa fa46(.a(a[0]&b[5]), .b(s[42]), .cin(c[45]), .sum(o[5]), .cout(c[60]));
  fa fa47(.a(a[1]&b[5]), .b(s[43]), .cin(c[46]), .sum(s[56]), .cout(c[61]));
  fa fa48(.a(a[2]&b[5]), .b(s[44]), .cin(c[47]), .sum(s[57]), .cout(c[62]));
  fa fa49(.a(a[3]&b[5]), .b(s[45]), .cin(c[48]), .sum(s[58]), .cout(c[63]));
  fa fa50(.a(a[4]&b[5]), .b(s[46]), .cin(c[49]), .sum(s[59]), .cout(c[64]));
  fa fa51(.a(a[5]&b[5]), .b(s[47]), .cin(c[50]), .sum(s[60]), .cout(c[65]));
  fa fa52(.a(a[6]&b[5]), .b(s[48]), .cin(c[51]), .sum(s[61]), .cout(c[66]));
  fa fa53(.a(a[7]&b[5]), .b(s[49]), .cin(c[52]), .sum(s[62]), .cout(c[67]));
  fa fa54(.a(a[8]&b[5]), .b(s[50]), .cin(c[53]), .sum(s[63]), .cout(c[68]));
  fa fa55(.a(a[9]&b[5]), .b(s[51]), .cin(c[54]), .sum(s[64]), .cout(c[69]));
  fa fa56(.a(a[10]&b[5]), .b(s[52]), .cin(c[55]), .sum(s[65]), .cout(c[70]));
  fa fa57(.a(a[11]&b[5]), .b(s[53]), .cin(c[56]), .sum(s[66]), .cout(c[71]));
  fa fa58(.a(a[12]&b[5]), .b(s[54]), .cin(c[57]), .sum(s[67]), .cout(c[72]));
  fa fa59(.a(a[13]&b[5]), .b(s[55]), .cin(c[58]), .sum(s[68]), .cout(c[73]));
  fa fa60(.a(a[14]&b[5]), .b(a[15]&b[4]), .cin(c[59]), .sum(s[69]), .cout(c[74]));
  
  // Stage 7
  fa fa61(.a(a[0]&b[6]), .b(s[56]), .cin(c[60]), .sum(o[6]), .cout(c[75]));
  fa fa62(.a(a[1]&b[6]), .b(s[57]), .cin(c[61]), .sum(s[70]), .cout(c[76]));
  fa fa63(.a(a[2]&b[6]), .b(s[58]), .cin(c[62]), .sum(s[71]), .cout(c[77]));
  fa fa64(.a(a[3]&b[6]), .b(s[59]), .cin(c[63]), .sum(s[72]), .cout(c[78]));
  fa fa65(.a(a[4]&b[6]), .b(s[60]), .cin(c[64]), .sum(s[73]), .cout(c[79]));
  fa fa66(.a(a[5]&b[6]), .b(s[61]), .cin(c[65]), .sum(s[74]), .cout(c[80]));
  fa fa67(.a(a[6]&b[6]), .b(s[62]), .cin(c[66]), .sum(s[75]), .cout(c[81]));
  fa fa68(.a(a[7]&b[6]), .b(s[63]), .cin(c[67]), .sum(s[76]), .cout(c[82]));
  fa fa69(.a(a[8]&b[6]), .b(s[64]), .cin(c[68]), .sum(s[77]), .cout(c[83]));
  fa fa70(.a(a[9]&b[6]), .b(s[65]), .cin(c[69]), .sum(s[78]), .cout(c[84]));
  fa fa71(.a(a[10]&b[6]), .b(s[66]), .cin(c[70]), .sum(s[79]), .cout(c[85]));
  fa fa72(.a(a[11]&b[6]), .b(s[67]), .cin(c[71]), .sum(s[80]), .cout(c[86]));
  fa fa73(.a(a[12]&b[6]), .b(s[68]), .cin(c[72]), .sum(s[81]), .cout(c[87]));
  fa fa74(.a(a[13]&b[6]), .b(s[69]), .cin(c[73]), .sum(s[82]), .cout(c[88]));
  fa fa75(.a(a[14]&b[6]), .b(a[15]&b[5]), .cin(c[74]), .sum(s[83]), .cout(c[89]));
  
  // Stage 8
  fa fa76(.a(a[0]&b[7]), .b(s[70]), .cin(c[75]), .sum(o[7]), .cout(c[90]));
  fa fa77(.a(a[1]&b[7]), .b(s[71]), .cin(c[76]), .sum(s[84]), .cout(c[91]));
  fa fa78(.a(a[2]&b[7]), .b(s[72]), .cin(c[77]), .sum(s[85]), .cout(c[92]));
  fa fa79(.a(a[3]&b[7]), .b(s[73]), .cin(c[78]), .sum(s[86]), .cout(c[93]));
  fa fa80(.a(a[4]&b[7]), .b(s[74]), .cin(c[79]), .sum(s[87]), .cout(c[94]));
  fa fa81(.a(a[5]&b[7]), .b(s[75]), .cin(c[80]), .sum(s[88]), .cout(c[95]));
  fa fa82(.a(a[6]&b[7]), .b(s[76]), .cin(c[81]), .sum(s[89]), .cout(c[96]));
  fa fa83(.a(a[7]&b[7]), .b(s[77]), .cin(c[82]), .sum(s[90]), .cout(c[97]));
  fa fa84(.a(a[8]&b[7]), .b(s[78]), .cin(c[83]), .sum(s[91]), .cout(c[98]));
  fa fa85(.a(a[9]&b[7]), .b(s[79]), .cin(c[84]), .sum(s[92]), .cout(c[99]));
  fa fa86(.a(a[10]&b[7]), .b(s[80]), .cin(c[85]), .sum(s[93]), .cout(c[100]));
  fa fa87(.a(a[11]&b[7]), .b(s[81]), .cin(c[86]), .sum(s[94]), .cout(c[101]));
  fa fa88(.a(a[12]&b[7]), .b(s[82]), .cin(c[87]), .sum(s[95]), .cout(c[102]));
  fa fa89(.a(a[13]&b[7]), .b(s[83]), .cin(c[88]), .sum(s[96]), .cout(c[103]));
  fa fa90(.a(a[14]&b[7]), .b(a[15]&b[6]), .cin(c[89]), .sum(s[97]), .cout(c[104]));
  
  // Stage 9
  fa fa91(.a(a[0]&b[8]), .b(s[84]), .cin(c[90]), .sum(o[8]), .cout(c[105]));
  fa fa92(.a(a[1]&b[8]), .b(s[85]), .cin(c[91]), .sum(s[98]), .cout(c[106]));
  fa fa93(.a(a[2]&b[8]), .b(s[86]), .cin(c[92]), .sum(s[99]), .cout(c[107]));
  fa fa94(.a(a[3]&b[8]), .b(s[87]), .cin(c[93]), .sum(s[100]), .cout(c[108]));
  fa fa95(.a(a[4]&b[8]), .b(s[88]), .cin(c[94]), .sum(s[101]), .cout(c[109]));
  fa fa96(.a(a[5]&b[8]), .b(s[89]), .cin(c[95]), .sum(s[102]), .cout(c[110]));
  fa fa97(.a(a[6]&b[8]), .b(s[90]), .cin(c[96]), .sum(s[103]), .cout(c[111]));
  fa fa98(.a(a[7]&b[8]), .b(s[91]), .cin(c[97]), .sum(s[104]), .cout(c[112]));
  fa fa99(.a(a[8]&b[8]), .b(s[92]), .cin(c[98]), .sum(s[105]), .cout(c[113]));
  fa fa100(.a(a[9]&b[8]), .b(s[93]), .cin(c[99]), .sum(s[106]), .cout(c[114]));
  fa fa101(.a(a[10]&b[8]), .b(s[94]), .cin(c[100]), .sum(s[107]), .cout(c[115]));
  fa fa102(.a(a[11]&b[8]), .b(s[95]), .cin(c[101]), .sum(s[108]), .cout(c[116]));
  fa fa103(.a(a[12]&b[8]), .b(s[96]), .cin(c[102]), .sum(s[109]), .cout(c[117]));
  fa fa104(.a(a[13]&b[8]), .b(s[97]), .cin(c[103]), .sum(s[110]), .cout(c[118]));
  fa fa105(.a(a[14]&b[8]), .b(a[15]&b[7]), .cin(c[104]), .sum(s[111]), .cout(c[119]));
  
  // Stage 10
  fa fa106(.a(a[0]&b[9]), .b(s[98]), .cin(c[105]), .sum(o[9]), .cout(c[120]));
  fa fa107(.a(a[1]&b[9]), .b(s[99]), .cin(c[106]), .sum(s[112]), .cout(c[121]));
  fa fa108(.a(a[2]&b[9]), .b(s[100]), .cin(c[107]), .sum(s[113]), .cout(c[122]));
  fa fa109(.a(a[3]&b[9]), .b(s[101]), .cin(c[108]), .sum(s[114]), .cout(c[123]));
  fa fa110(.a(a[4]&b[9]), .b(s[102]), .cin(c[109]), .sum(s[115]), .cout(c[124]));
  fa fa111(.a(a[5]&b[9]), .b(s[103]), .cin(c[110]), .sum(s[116]), .cout(c[125]));
  fa fa112(.a(a[6]&b[9]), .b(s[104]), .cin(c[111]), .sum(s[117]), .cout(c[126]));
  fa fa113(.a(a[7]&b[9]), .b(s[105]), .cin(c[112]), .sum(s[118]), .cout(c[127]));
  fa fa114(.a(a[8]&b[9]), .b(s[106]), .cin(c[113]), .sum(s[119]), .cout(c[128]));
  fa fa115(.a(a[9]&b[9]), .b(s[107]), .cin(c[114]), .sum(s[120]), .cout(c[129]));
  fa fa116(.a(a[10]&b[9]), .b(s[108]), .cin(c[115]), .sum(s[121]), .cout(c[130]));
  fa fa117(.a(a[11]&b[9]), .b(s[109]), .cin(c[116]), .sum(s[122]), .cout(c[131]));
  fa fa118(.a(a[12]&b[9]), .b(s[110]), .cin(c[117]), .sum(s[123]), .cout(c[132]));
  fa fa119(.a(a[13]&b[9]), .b(s[111]), .cin(c[118]), .sum(s[124]), .cout(c[133]));
  fa fa120(.a(a[14]&b[9]), .b(a[15]&b[8]), .cin(c[119]), .sum(s[125]), .cout(c[134]));
  
  // Stage 11
  fa fa121(.a(a[0]&b[10]), .b(s[112]), .cin(c[120]), .sum(o[10]), .cout(c[135]));
  fa fa122(.a(a[1]&b[10]), .b(s[113]), .cin(c[121]), .sum(s[126]), .cout(c[136]));
  fa fa123(.a(a[2]&b[10]), .b(s[114]), .cin(c[122]), .sum(s[127]), .cout(c[137]));
  fa fa124(.a(a[3]&b[10]), .b(s[115]), .cin(c[123]), .sum(s[128]), .cout(c[138]));
  fa fa125(.a(a[4]&b[10]), .b(s[116]), .cin(c[124]), .sum(s[129]), .cout(c[139]));
  fa fa126(.a(a[5]&b[10]), .b(s[117]), .cin(c[125]), .sum(s[130]), .cout(c[140]));
  fa fa127(.a(a[6]&b[10]), .b(s[118]), .cin(c[126]), .sum(s[131]), .cout(c[141]));
  fa fa128(.a(a[7]&b[10]), .b(s[119]), .cin(c[127]), .sum(s[132]), .cout(c[142]));
  fa fa129(.a(a[8]&b[10]), .b(s[120]), .cin(c[128]), .sum(s[133]), .cout(c[143]));
  fa fa130(.a(a[9]&b[10]), .b(s[121]), .cin(c[129]), .sum(s[134]), .cout(c[144]));
  fa fa131(.a(a[10]&b[10]), .b(s[122]), .cin(c[130]), .sum(s[135]), .cout(c[145]));
  fa fa132(.a(a[11]&b[10]), .b(s[123]), .cin(c[131]), .sum(s[136]), .cout(c[146]));
  fa fa133(.a(a[12]&b[10]), .b(s[124]), .cin(c[132]), .sum(s[137]), .cout(c[147]));
  fa fa134(.a(a[13]&b[10]), .b(s[125]), .cin(c[133]), .sum(s[138]), .cout(c[148]));
  fa fa135(.a(a[14]&b[10]), .b(a[15]&b[9]), .cin(c[134]), .sum(s[139]), .cout(c[149]));
  
  // Stage 12
  fa fa136(.a(a[0]&b[11]), .b(s[126]), .cin(c[135]), .sum(o[11]), .cout(c[150]));
  fa fa137(.a(a[1]&b[11]), .b(s[127]), .cin(c[136]), .sum(s[140]), .cout(c[151]));
  fa fa138(.a(a[2]&b[11]), .b(s[128]), .cin(c[137]), .sum(s[141]), .cout(c[152]));
  fa fa139(.a(a[3]&b[11]), .b(s[129]), .cin(c[138]), .sum(s[142]), .cout(c[153]));
  fa fa140(.a(a[4]&b[11]), .b(s[130]), .cin(c[139]), .sum(s[143]), .cout(c[154]));
  fa fa141(.a(a[5]&b[11]), .b(s[131]), .cin(c[140]), .sum(s[144]), .cout(c[155]));
  fa fa142(.a(a[6]&b[11]), .b(s[132]), .cin(c[141]), .sum(s[145]), .cout(c[156]));
  fa fa143(.a(a[7]&b[11]), .b(s[133]), .cin(c[142]), .sum(s[146]), .cout(c[157]));
  fa fa144(.a(a[8]&b[11]), .b(s[134]), .cin(c[143]), .sum(s[147]), .cout(c[158]));
  fa fa145(.a(a[9]&b[11]), .b(s[135]), .cin(c[144]), .sum(s[148]), .cout(c[159]));
  fa fa146(.a(a[10]&b[11]), .b(s[136]), .cin(c[145]), .sum(s[149]), .cout(c[160]));
  fa fa147(.a(a[11]&b[11]), .b(s[137]), .cin(c[146]), .sum(s[150]), .cout(c[161]));
  fa fa148(.a(a[12]&b[11]), .b(s[138]), .cin(c[147]), .sum(s[151]), .cout(c[162]));
  fa fa149(.a(a[13]&b[11]), .b(s[139]), .cin(c[148]), .sum(s[152]), .cout(c[163]));
  fa fa150(.a(a[14]&b[11]), .b(a[15]&b[10]), .cin(c[149]), .sum(s[153]), .cout(c[164]));
  
  // Stage 13
  fa fa151(.a(a[0]&b[12]), .b(s[140]), .cin(c[150]), .sum(o[12]), .cout(c[165]));
  fa fa152(.a(a[1]&b[12]), .b(s[141]), .cin(c[151]), .sum(s[154]), .cout(c[166]));
  fa fa153(.a(a[2]&b[12]), .b(s[142]), .cin(c[152]), .sum(s[155]), .cout(c[167]));
  fa fa154(.a(a[3]&b[12]), .b(s[143]), .cin(c[153]), .sum(s[156]), .cout(c[168]));
  fa fa155(.a(a[4]&b[12]), .b(s[144]), .cin(c[154]), .sum(s[157]), .cout(c[169]));
  fa fa156(.a(a[5]&b[12]), .b(s[145]), .cin(c[155]), .sum(s[158]), .cout(c[170]));
  fa fa157(.a(a[6]&b[12]), .b(s[146]), .cin(c[156]), .sum(s[159]), .cout(c[171]));
  fa fa158(.a(a[7]&b[12]), .b(s[147]), .cin(c[157]), .sum(s[160]), .cout(c[172]));
  fa fa159(.a(a[8]&b[12]), .b(s[148]), .cin(c[158]), .sum(s[161]), .cout(c[173]));
  fa fa160(.a(a[9]&b[12]), .b(s[149]), .cin(c[159]), .sum(s[162]), .cout(c[174]));
  fa fa161(.a(a[10]&b[12]), .b(s[150]), .cin(c[160]), .sum(s[163]), .cout(c[175]));
  fa fa162(.a(a[11]&b[12]), .b(s[151]), .cin(c[161]), .sum(s[164]), .cout(c[176]));
  fa fa163(.a(a[12]&b[12]), .b(s[152]), .cin(c[162]), .sum(s[165]), .cout(c[177]));
  fa fa164(.a(a[13]&b[12]), .b(s[153]), .cin(c[163]), .sum(s[166]), .cout(c[178]));
  fa fa165(.a(a[14]&b[12]), .b(a[15]&b[11]), .cin(c[164]), .sum(s[167]), .cout(c[179]));
  
  // Stage 14
  fa fa166(.a(a[0]&b[13]), .b(s[154]), .cin(c[165]), .sum(o[13]), .cout(c[180]));
  fa fa167(.a(a[1]&b[13]), .b(s[155]), .cin(c[166]), .sum(s[168]), .cout(c[181]));
  fa fa168(.a(a[2]&b[13]), .b(s[156]), .cin(c[167]), .sum(s[169]), .cout(c[182]));
  fa fa169(.a(a[3]&b[13]), .b(s[157]), .cin(c[168]), .sum(s[170]), .cout(c[183]));
  fa fa170(.a(a[4]&b[13]), .b(s[158]), .cin(c[169]), .sum(s[171]), .cout(c[184]));
  fa fa171(.a(a[5]&b[13]), .b(s[159]), .cin(c[170]), .sum(s[172]), .cout(c[185]));
  fa fa172(.a(a[6]&b[13]), .b(s[160]), .cin(c[171]), .sum(s[173]), .cout(c[186]));
  fa fa173(.a(a[7]&b[13]), .b(s[161]), .cin(c[172]), .sum(s[174]), .cout(c[187]));
  fa fa174(.a(a[8]&b[13]), .b(s[162]), .cin(c[173]), .sum(s[175]), .cout(c[188]));
  fa fa175(.a(a[9]&b[13]), .b(s[163]), .cin(c[174]), .sum(s[176]), .cout(c[189]));
  fa fa176(.a(a[10]&b[13]), .b(s[164]), .cin(c[175]), .sum(s[177]), .cout(c[190]));
  fa fa177(.a(a[11]&b[13]), .b(s[165]), .cin(c[176]), .sum(s[178]), .cout(c[191]));
  fa fa178(.a(a[12]&b[13]), .b(s[166]), .cin(c[177]), .sum(s[179]), .cout(c[192]));
  fa fa179(.a(a[13]&b[13]), .b(s[167]), .cin(c[178]), .sum(s[180]), .cout(c[193]));
  fa fa180(.a(a[14]&b[13]), .b(a[15]&b[12]), .cin(c[179]), .sum(s[181]), .cout(c[194]));
  
  // Stage 15
  fa fa181(.a(a[0]&b[14]), .b(s[168]), .cin(c[180]), .sum(o[14]), .cout(c[195]));
  fa fa182(.a(a[1]&b[14]), .b(s[169]), .cin(c[181]), .sum(s[182]), .cout(c[196]));
  fa fa183(.a(a[2]&b[14]), .b(s[170]), .cin(c[182]), .sum(s[183]), .cout(c[197]));
  fa fa184(.a(a[3]&b[14]), .b(s[171]), .cin(c[183]), .sum(s[184]), .cout(c[198]));
  fa fa185(.a(a[4]&b[14]), .b(s[172]), .cin(c[184]), .sum(s[185]), .cout(c[199]));
  fa fa186(.a(a[5]&b[14]), .b(s[173]), .cin(c[185]), .sum(s[186]), .cout(c[200]));
  fa fa187(.a(a[6]&b[14]), .b(s[174]), .cin(c[186]), .sum(s[187]), .cout(c[201]));
  fa fa188(.a(a[7]&b[14]), .b(s[175]), .cin(c[187]), .sum(s[188]), .cout(c[202]));
  fa fa189(.a(a[8]&b[14]), .b(s[176]), .cin(c[188]), .sum(s[189]), .cout(c[203]));
  fa fa190(.a(a[9]&b[14]), .b(s[177]), .cin(c[189]), .sum(s[190]), .cout(c[204]));
  fa fa191(.a(a[10]&b[14]), .b(s[178]), .cin(c[190]), .sum(s[191]), .cout(c[205]));
  fa fa192(.a(a[11]&b[14]), .b(s[179]), .cin(c[191]), .sum(s[192]), .cout(c[206]));
  fa fa193(.a(a[12]&b[14]), .b(s[180]), .cin(c[192]), .sum(s[193]), .cout(c[207]));
  fa fa194(.a(a[13]&b[14]), .b(s[181]), .cin(c[193]), .sum(s[194]), .cout(c[208]));
  fa fa195(.a(a[14]&b[14]), .b(a[15]&b[13]), .cin(c[194]), .sum(s[195]), .cout(c[209]));
  
  // Stage 16 (Final stage)
  fa fa196(.a(a[0]&b[15]), .b(s[182]), .cin(c[195]), .sum(o[15]), .cout(c[210]));
  fa fa197(.a(a[1]&b[15]), .b(s[183]), .cin(c[196]), .sum(s[196]), .cout(c[211]));
  fa fa198(.a(a[2]&b[15]), .b(s[184]), .cin(c[197]), .sum(s[197]), .cout(c[212]));
  fa fa199(.a(a[3]&b[15]), .b(s[185]), .cin(c[198]), .sum(s[198]), .cout(c[213]));
  fa fa200(.a(a[4]&b[15]), .b(s[186]), .cin(c[199]), .sum(s[199]), .cout(c[214]));
  fa fa201(.a(a[5]&b[15]), .b(s[187]), .cin(c[200]), .sum(s[200]), .cout(c[215]));
  fa fa202(.a(a[6]&b[15]), .b(s[188]), .cin(c[201]), .sum(s[201]), .cout(c[216]));
  fa fa203(.a(a[7]&b[15]), .b(s[189]), .cin(c[202]), .sum(s[202]), .cout(c[217]));
  fa fa204(.a(a[8]&b[15]), .b(s[190]), .cin(c[203]), .sum(s[203]), .cout(c[218]));
  fa fa205(.a(a[9]&b[15]), .b(s[191]), .cin(c[204]), .sum(s[204]), .cout(c[219]));
  fa fa206(.a(a[10]&b[15]), .b(s[192]), .cin(c[205]), .sum(s[205]), .cout(c[220]));
  fa fa207(.a(a[11]&b[15]), .b(s[193]), .cin(c[206]), .sum(s[206]), .cout(c[221]));
  fa fa208(.a(a[12]&b[15]), .b(s[194]), .cin(c[207]), .sum(s[207]), .cout(c[222]));
  fa fa209(.a(a[13]&b[15]), .b(s[195]), .cin(c[208]), .sum(s[208]), .cout(c[223]));
  fa fa210(.a(a[14]&b[15]), .b(a[15]&b[14]), .cin(c[209]), .sum(s[209]), .cout(c[224]));
  
  // Final addition for bits 16-31
  ha ha16(.a(c[210]), .b(s[196]), .sum(o[16]), .cout(c[225]));
  fa fa211(.a(c[211]), .b(s[197]), .cin(c[225]), .sum(o[17]), .cout(c[226]));
  fa fa212(.a(c[212]), .b(s[198]), .cin(c[226]), .sum(o[18]), .cout(c[227]));
  fa fa213(.a(c[213]), .b(s[199]), .cin(c[227]), .sum(o[19]), .cout(c[228]));
  fa fa214(.a(c[214]), .b(s[200]), .cin(c[228]), .sum(o[20]), .cout(c[229]));
  fa fa215(.a(c[215]), .b(s[201]), .cin(c[229]), .sum(o[21]), .cout(c[230]));
  fa fa216(.a(c[216]), .b(s[202]), .cin(c[230]), .sum(o[22]), .cout(c[231]));
  fa fa217(.a(c[217]), .b(s[203]), .cin(c[231]), .sum(o[23]), .cout(c[232]));
  fa fa218(.a(c[218]), .b(s[204]), .cin(c[232]), .sum(o[24]), .cout(c[233]));
  fa fa219(.a(c[219]), .b(s[205]), .cin(c[233]), .sum(o[25]), .cout(c[234]));
  fa fa220(.a(c[220]), .b(s[206]), .cin(c[234]), .sum(o[26]), .cout(c[235]));
  fa fa221(.a(c[221]), .b(s[207]), .cin(c[235]), .sum(o[27]), .cout(c[236]));
  fa fa222(.a(c[222]), .b(s[208]), .cin(c[236]), .sum(o[28]), .cout(c[237]));
  fa fa223(.a(c[223]), .b(s[209]), .cin(c[237]), .sum(o[29]), .cout(c[238]));
  fa fa224(.a(c[224]), .b(a[15]&b[15]), .cin(c[238]), .sum(o[30]), .cout(o[31]));
endmodule