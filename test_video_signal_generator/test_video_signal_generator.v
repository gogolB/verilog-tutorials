`include "hvsync_generator.v"
module test_video_signal_generator (clk, reset, hsync, vsync, rgb);

input wire clk, reset;
output wire hsync, vsync;
output wire [2:0] rgb;

wire display_on;
wire [8:0] hpos;
wire [8:0] vpos;

hvsync_generator hvsync_gen(
    .clk(clk),
    .reset(reset),
    .hsync(hsync),
    .vsync(vsync),
    .display_on(display_on),
    .hpos(hpos),
    .vpos(vpos)
);

wire r = display_on && (((hpos&7) == 0) || ((vpos&7) == 0));
wire g = display_on && vpos[4];
wire b = display_on && hpos[4];

assign rgb = {b,g,r};

endmodule
