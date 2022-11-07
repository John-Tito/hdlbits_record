module Gatesv_tb ();

    // Parameters

    // Ports
    reg  [3:0] in           ;
    wire [2:0] out_both     ;
    wire [3:1] out_any      ;
    wire [3:0] out_different;

    Gatesv Gatesv_dut (
        .in           (in           ),
        .out_both     (out_both     ),
        .out_any      (out_any      ),
        .out_different(out_different)
    );

    initial begin
        for (in = 0; in<15; in=in+1) begin
            #10;
        end
        $finish;
    end


    initial begin
        begin
            $dumpfile("sim/test_tb.lxt");
            $dumpvars(0,Gatesv_tb);
        end
    end
endmodule
