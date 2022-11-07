module Mux256to1v_tb ();

    // Parameters

    // Ports
    wire [1023:0] in ;
    reg  [   7:0] sel;
    wire [   3:0] out;
    genvar        i  ;

    assign in = {128{4'hF,4'h1}};

    Mux256to1v Mux256to1v_dut (
        .in (in ),
        .sel(sel),
        .out(out)
    );

    initial begin
        begin
            for (sel = 0; sel<255;sel=sel+1 ) begin
                #10;
            end
            $finish;
        end
    end


    initial begin
        begin
            $dumpfile("sim/test_tb.lxt");
            $dumpvars(0,Mux256to1v_dut);
        end
    end
endmodule
