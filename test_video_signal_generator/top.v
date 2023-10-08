`include "test_video_signal_generator.v"

module top (clk, reset, hsync, vsync, rgb);
    input wire clk, reset;
    output wire hsync, vsync;
    output wire [2:0] rgb;


    test_video_signal_generator vsg(
        .clk(clk),
        .reset(reset),
        .hsync(hsync),
        .vsync(vsync),
        .rgb(rgb)
    );

endmodule
