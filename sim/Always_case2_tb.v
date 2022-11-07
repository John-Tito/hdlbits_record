module Always_case2_tb ();

    // Parameters

    // Ports
    reg  [3:0] in ;
    wire [1:0] pos;

    Always_case2 top_module_dut (
        .in (in ),
        .pos(pos)
    );

    initial begin
        begin
            for (in = 0; in<15;in=in+1 ) begin
                # 10;
            end
            $finish;
        end
    end

    initial begin
        begin
            $dumpfile("sim/test_tb.lxt");
            $dumpvars(0,Always_case2_tb);
        end
    end

endmodule
