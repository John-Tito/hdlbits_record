module Countbcd_tb ();

    // Parameters

    // Ports
    reg         clk   = 0;
    reg         reset = 0;
    wire [ 3:1] ena      ;
    wire [15:0] q        ;

    Countbcd Countbcd_dut (
        .clk  (clk  ),
        .reset(reset),
        .ena  (ena  ),
        .q    (q    )
    );

    initial begin
        begin
            reset <= 1'b0;
            #10;
            reset <= 1'b1;
            #10;
            reset <= 1'b0;
            #1000000;
            $finish;
        end
    end

    always
        #5  clk = ! clk ;
    initial begin
        begin
            $dumpfile("sim/test_tb.lxt");
            $dumpvars(0,Countbcd_tb);
        end
    end
endmodule
