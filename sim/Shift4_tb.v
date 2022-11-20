module Shift4_tb ();

    // Parameters

    // Ports
    reg        clk    = 0;
    reg        areset = 0;
    reg        load   = 0;
    reg        ena    = 0;
    reg  [3:0] data      ;
    wire [3:0] q         ;

    Shift4 Shift4_dut (
        .clk   (clk   ),
        .areset(areset),
        .load  (load  ),
        .ena   (ena   ),
        .data  (data  ),
        .q     (q     )
    );

    initial begin
        begin
            areset <= 1'b1;
            load   <= 1'b0;
            ena    <= 1'b0;
            data   = 4'b0;
            #25;
            areset <= 1'b0;
            load   <= 1'b0;
            ena    <= 1'b0;
            data   = 4'b0110;
            #10;
            areset <= 1'b0;
            load   <= 1'b1;
            ena    <= 1'b0;
            data   = 4'b0110;
            #10;
            areset <= 1'b0;
            load   <= 1'b0;
            ena    <= 1'b1;
            data   = 4'b0110;
            #1000;

            $finish;
        end
    end

    always
        #5  clk = ! clk ;

    initial begin
        $dumpfile("sim/test_tb.lxt");
        $dumpvars(0,Shift4_dut);
    end
endmodule
