module axi4_st(input [15:0] in_data, input in_buffer_emp, in_clk, in_rst, output reg [15:0] o_buffer);
  reg [15:0] TDATA,reg_in;//reg_in is for pipelining 
  reg TVALID;
  wire TREADY;
  
  always @(posedge in_clk or posedge in_rst) begin//pipelined
    if(in_rst)
      reg_in<=0;
    else
      reg_in<=in_data;
  end

always @(posedge in_clk or posedge in_rst) begin
  if(in_rst) begin
    TVALID <= 0;
    TDATA  <= 0;
  end
  else if (~TVALID) begin
    TDATA  <= reg_in;
    TVALID <= 1;
  end
  else if (TVALID && TREADY) begin
    TVALID <= 0;
  end
end


  assign TREADY=in_buffer_emp;
  always @(posedge in_clk) begin
    if(TVALID&&TREADY) begin
      o_buffer<=reg_in;
    end
  end
endmodule