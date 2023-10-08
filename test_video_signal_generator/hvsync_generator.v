`ifndef HVSYNC_GENERATOR 
`define HVSYNC_GENERATOR
module hvsync_generator(clk, reset, hsync, vsync, display_on, hpos, vpos);

input wire clk;
input wire reset;
output wire hsync, vsync;
output wire display_on;
output reg [8:0] hpos;
output reg [8:0] vpos;

localparam H_DISPLAY    = 256;  // horizontal display width
localparam H_BACK       =  23;  // left border (aka back porch)
localparam H_FRONT      =   7;  // right border (aka front porch)
localparam H_SYNC       =  23;  // horizontal sync width

localparam V_DISPLAY    = 240;  // vertical display height
localparam V_TOP        =   5;  // vertical top border
localparam V_BOTTOM     =  14;  // vertical bottom border
localparam V_SYNC       =   3;  // vertial sync # lines;

localparam H_SYNC_START = H_DISPLAY + H_FRONT;
localparam H_SYNC_END   = H_DISPLAY + H_FRONT + H_SYNC - 1;
localparam H_MAX        = H_DISPLAY + H_FRONT + H_BACK + H_SYNC - 1;

localparam V_SYNC_START = V_DISPLAY + V_BOTTOM;
localparam V_SYNC_END   = V_DISPLAY + V_BOTTOM + V_SYNC - 1;
localparam V_MAX        = V_DISPLAY + V_BOTTOM + V_SYNC + V_TOP - 1;

wire hmaxxed = (hpos == H_MAX) || reset;
wire vmaxxed = (vpos == V_MAX) || reset;

assign hsync = hpos >= H_SYNC_START && hpos <= H_SYNC_END;
// HPos counter
always @(posedge clk)
begin
    if(hmaxxed)
        hpos <=0;
    else
        hpos <= hpos + 1;
end

assign vsync = vpos >= V_SYNC_START && vpos <= V_SYNC_END;
// VPos counter
always @(posedge clk)
begin
    if(hmaxxed)
        if(vmaxxed)
            vpos <= 0;
        else   
            vpos <= vpos + 1;
end

assign display_on = (hpos < H_DISPLAY) && (vpos < V_DISPLAY);

endmodule
`endif
