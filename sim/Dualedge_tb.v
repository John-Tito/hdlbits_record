module Dualedge_tb ();

    // Parameters

    // Ports
    reg  clk = 0;
    reg  d   = 0;
    wire q      ;

    reg [ 7:0] i                           ;
    reg [13:0] pattern = 14'b01001101001110;

    Dualedge Dualedge_dut (
        .clk(clk),
        .d  (d  ),
        .q  (q  )
    );

    initial begin
        begin
            for (i = 0; i<14; i=i+1) begin
                d <= pattern[13-i];
                #5;
            end
            $finish;
        end
    end

    always
        #5  clk = ! clk ;

    initial begin
        begin
            $dumpfile("sim/test_tb.lxt");
            $dumpvars(0,Dualedge_dut);
        end
    end
endmodule
