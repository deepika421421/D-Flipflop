`timescale 1ns/1ps

module d_flip_flop (
    input  wire clk,
    input  wire reset,
    input  wire d,
    output reg  q
);

    // Positive-edge triggered D Flip-Flop
    // Active-high synchronous reset
    always @(posedge clk) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end

endmodule
