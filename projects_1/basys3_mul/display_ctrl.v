module display_ctrl(
  input [15:0] product,
  input clk, rst,
  output reg [3:0] o_an,
  output [6:0] o_seg
);

  reg [1:0] cnt;
  reg [3:0] nibble;

  hex_7seg conv(
    .i_hex(nibble),
    .o_seg(o_seg)
  );

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      cnt <= 0;
      nibble <= 0;
      o_an <= 4'b1110; 
    end
    else begin
      cnt <= cnt + 1;
      case (cnt)
        2'b00: begin
          nibble <= product[3:0];
          o_an <= 4'b1110;   
        end
        2'b01: begin
          nibble <= product[7:4];
          o_an <= 4'b1101;
        end
        2'b10: begin
          nibble <= product[11:8];
          o_an <= 4'b1011;
        end
        2'b11: begin
          nibble <= product[15:12];
          o_an <= 4'b0111;  
        end
      endcase
    end
  end
endmodule
