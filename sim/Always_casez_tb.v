module Always_casez_tb ();

    // Parameters

    // Ports
    reg  [7:0] in ;
    wire [2:0] pos;

    Always_casez top_module_dut (
        .in (in ),
        .pos(pos)
    );

    initial begin
        begin
            for (in = 0; in<255;in=in+1 ) begin
                # 10;
            end
            $finish;
        end
    end

    initial begin
        begin
            $dumpfile("sim/test_tb.lxt");
            $dumpvars(0,Always_casez_tb);
        end
    end

endmodule
