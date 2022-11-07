module Popcount3_tb ();

    // Parameters

    // Ports
    reg  [2:0] in ;
    wire [1:0] out;

    Popcount3 Popcount3_dut (
        .in (in ),
        .out(out)
    );

    initial begin
        for (in = 3'b0; in < 7 ; in= in + 3'b1) begin
            #10;
        end
        $finish;
    end

    initial begin
        $dumpfile("sim/test_tb.lxt");
        $dumpvars(0,Popcount3_tb);
    end
endmodule
