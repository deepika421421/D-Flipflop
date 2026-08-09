`timescale 1ns/1ps

module d_flip_flop_tb;

    reg clk;
    reg reset;
    reg d;
    wire q;

    // Instantiate the Design Under Test
    d_flip_flop dut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Create waveform file
        $dumpfile("d_flip_flop.vcd");
        $dumpvars(0, d_flip_flop_tb);

        // Initialize signals
        clk = 1'b0;
        reset = 1'b1;
        d = 1'b0;

        $display("======================================");
        $display("       D FLIP-FLOP TESTBENCH");
        $display("======================================");
        $display(" Time | CLK | RESET | D | Q");
        $display("--------------------------------------");

        // Reset
        #10;
        $display(" %4t |  %b  |   %b   | %b | %b",
                 $time, clk, reset, d, q);

        // Release reset
        reset = 1'b0;

        // D = 1
        d = 1'b1;
        #10;
        $display(" %4t |  %b  |   %b   | %b | %b",
                 $time, clk, reset, d, q);

        // D = 0
        d = 1'b0;
        #10;
        $display(" %4t |  %b  |   %b   | %b | %b",
                 $time, clk, reset, d, q);

        // D = 1
        d = 1'b1;
        #10;
        $display(" %4t |  %b  |   %b   | %b | %b",
                 $time, clk, reset, d, q);

        // D = 0
        d = 1'b0;
        #10;
        $display(" %4t |  %b  |   %b   | %b | %b",
                 $time, clk, reset, d, q);

        $display("--------------------------------------");
        $display("Simulation completed successfully.");

        $finish;
    end

endmodule
