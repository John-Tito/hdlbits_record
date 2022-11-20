
`timescale 1ns/1ps
module Count_clock_tb ();

    // Parameters

    // Ports
    reg        clk   = 1'b0;
    reg        reset       ;
    reg        ena         ;
    wire       pm          ;
    wire [7:0] hh          ;
    wire [7:0] mm          ;
    wire [7:0] ss          ;

    Count_clock Count_clock_dut (
        .clk  (clk  ),
        .reset(reset),
        .ena  (ena  ),
        .pm   (pm   ),
        .hh   (hh   ),
        .mm   (mm   ),
        .ss   (ss   )
    );

    initial begin
        reset <= 1'b1;
        ena <= 1'b0;
        #10;
        reset <= 1'b0;
        ena <= 1'b0;
        #10;
        reset <= 1'b0;
        ena <= 1'b1;
        #600000;
        $finish;
    end

    always
        #5  clk = ! clk ;

    initial begin
        $dumpfile("sim/test_tb.lxt");
        $dumpvars(0,Count_clock_tb);
    end
endmodule
