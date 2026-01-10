module cache_direct #(
    parameter CACHE = 8192,
    parameter LINE  = 128
)(
    input wire clk,
    input wire rst,

    input wire cpu_req,
    input wire cpu_we,
    input wire [31:0] cpu_add,
    input wire [31:0] cpu_wdata,
    output reg [31:0] cpu_rdata,
    output reg cpu_ready,

    output reg mem_read,
    output reg mem_write,
    output reg [31:0] mem_add,
    output reg [LINE-1:0] mem_wdata,
    input wire [LINE-1:0] mem_rdata
);

  localparam NUM_LINES=CACHE/LINE;
  localparam OFFSET_BITS=$clog2(LINE/8);
  localparam INDEX_BITS=$clog2(NUM_LINES);
  localparam TAG_BITS=32-OFFSET_BITS-INDEX_BITS;

  localparam IDLE=2'b00, WRITEBACK=2'b01, ALLOCATE=2'b10;
  integer i;

  wire [OFFSET_BITS-1:0] offset, req_offset;
  wire [INDEX_BITS-1:0] index, req_index;
  wire [TAG_BITS-1:0] address_tag, req_tag;

  assign offset=cpu_add[OFFSET_BITS-1:0];
  assign index=cpu_add[OFFSET_BITS+INDEX_BITS-1:OFFSET_BITS];
  assign address_tag=cpu_add[31:OFFSET_BITS+INDEX_BITS];
 
  reg [TAG_BITS-1:0] tag_cache [0:NUM_LINES-1];
  reg valid [0:NUM_LINES-1];
  reg dirty [0:NUM_LINES-1];
  reg [LINE-1:0] cache_line [0:NUM_LINES-1];

  reg req_we;
  reg [31:0] req_add, req_wdata;

  assign req_offset=req_add[OFFSET_BITS-1:0];
  assign req_index=req_add[OFFSET_BITS+INDEX_BITS-1:OFFSET_BITS];
  assign req_tag=req_add[31:OFFSET_BITS+INDEX_BITS];
  
  reg [1:0] p_state, n_state;
  reg [2:0] count;

  wire hit;
  assign hit=(valid[index]&&(tag_cache[index]==address_tag))&&(p_state==IDLE);

  always@(*) begin
    mem_add=32'b0;
    mem_wdata={LINE{1'b0}};
    n_state=p_state;
    mem_read=0;
    mem_write=0;

    case(p_state)
      IDLE: begin
        if(cpu_req && !hit && count==3'b000) begin
          if(valid[index] && dirty[index])
            n_state=WRITEBACK;
          else
            n_state=ALLOCATE;
        end
      end

      WRITEBACK: begin
        mem_write=1'b1;
        mem_wdata=cache_line[req_index];
        mem_add={tag_cache[req_index],req_index,{OFFSET_BITS{1'b0}}};
        if(count==3'b0101)
          n_state=ALLOCATE;
      end

      ALLOCATE: begin
        mem_read=1'b1;
        mem_add={req_tag,req_index,{OFFSET_BITS{1'b0}}};
        if(count==3'b0101) begin
          n_state=IDLE;
        end
      end
    endcase
  end
  
  always@(posedge clk or posedge rst) begin
    if(rst)
      count <= 3'b000;
    else if(p_state != n_state)
      count <= 3'b000;
    else if(p_state != IDLE)
      count <= count + 1;
  end
  
  always@(posedge clk or posedge rst) begin
    if(rst) begin
      for(i=0;i<NUM_LINES;i=i+1) begin
        valid[i]<=1'b0;
        dirty[i]<=1'b0;
      end
      cpu_ready<=1'b0;
      p_state<=IDLE;
    end
    else begin
      cpu_ready<=1'b0;
      p_state<=n_state;

      if(p_state==IDLE && cpu_req && hit && count==3'b000) begin
        cpu_ready<=1'b1;
        if(!cpu_we)
          cpu_rdata<=cache_line[index][offset*8+:32];
        else begin
          cache_line[index][offset*8+:32]<=cpu_wdata;
          dirty[index]<=1'b1;
        end
      end

      if(p_state==IDLE && cpu_req && !hit) begin
        req_we<=cpu_we;
        req_add<=cpu_add;
        req_wdata<=cpu_wdata;
        cpu_ready<=1'b0;
      end

      if(p_state==WRITEBACK && count==3'b0101) begin
        dirty[req_index]<=1'b0;
      end

      if(p_state==ALLOCATE && count==3'b0101) begin
        cache_line[req_index]<=mem_rdata;
        tag_cache[req_index]<=req_tag;
        valid[req_index]<=1'b1;
        cpu_ready<=1'b1;
        if(req_we) begin
          cache_line[req_index][req_offset*8+:32]<=req_wdata;
          dirty[req_index]<=1'b1;
        end
        else begin
          cpu_rdata<=mem_rdata;
          dirty[req_index]<=1'b0;
        end
      end
    end
  end

endmodule
