module traffic(input in_srt, in_clk, in_rst, output reg o_green, o_red, o_yellow, output reg [3:0] o_count);
  localparam GREEN=3'b000, YELLOW1=3'b001, RED=3'b010, YELLOW2=3'b011, IDLE=3'b100;
  reg [2:0] p_st,n_st;
  reg [3:0] count;
  
  
  always @(posedge in_clk or posedge in_rst)begin
    if(in_rst)//reset signal
      p_st<=IDLE;
    else
      p_st<=n_st;
  end
  
  always @(posedge in_clk or posedge in_rst) begin
    if (in_rst)
      count <= 0;
    else if (p_st != n_st)
      count <= 0;
    else
      count <= count + 1;
  end
  
  always @(*)begin//output
    o_green=1'b0;
    o_red=1'b0;
    o_yellow=1'b0;
    case(p_st)
      GREEN:o_green=1'b1;
      YELLOW1,YELLOW2:o_yellow=1'b1;
      RED:o_red=1'b1;
      IDLE:{o_red,o_yellow,o_green}=3'b000;
    endcase
    o_count=count;
  end
      
  always @(*) begin//state
    case(p_st)
      IDLE:n_st=(in_srt)?GREEN:IDLE;
      GREEN:n_st=(count==4'b1010)?YELLOW1:GREEN;//10 secs delay
      YELLOW1:n_st=(count==4'b0101)?RED:YELLOW1;//5 secs delay
      RED:n_st=(count==4'b1111)?YELLOW2:RED;//15 secs delay
      YELLOW2:n_st=(count==4'b0101)?GREEN:YELLOW2;//5 secs delay
      default:n_st=IDLE;
    endcase
  end
endmodule
  