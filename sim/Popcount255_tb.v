module Popcount255_tb ();

    // Parameters

    // Ports
    reg  [254:0] in ;
    wire [  7:0] out;

    Popcount255 Popcount255_dut (
        .in (in ),
        .out(out)
    );

    initial begin
        begin
            for (in = 0;in<255 ; in=in+1) begin
                #10;
            end
            $finish;
        end
    end


    initial begin
        begin
            $dumpfile("sim/test_tb.lxt");
            $dumpvars(0,Popcount255_tb);
        end
    end
endmodule
