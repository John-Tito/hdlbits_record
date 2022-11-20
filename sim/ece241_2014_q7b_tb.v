module ece241_2014_q7b_tb ();

    // Parameters

    // Ports
    reg        clk      = 0;
    reg        reset    = 0;
    wire       OneHertz    ;
    wire [2:0] c_enable    ;

    ece241_2014_q7b ece241_2014_q7b_dut (
        .clk     (clk     ),
        .reset   (reset   ),
        .OneHertz(OneHertz),
        .c_enable(c_enable)
    );

    initial begin
        begin

            reset <= 1'b0;
            #10;
            reset <= 1'b1;
            #10;
            reset <= 1'b0;
            #20000;
            $finish;
        end
    end

    always
        #5  clk = ! clk ;
    initial begin
        begin
            $dumpfile("sim/test_tb.lxt");
            $dumpvars(0,ece241_2014_q7b_tb);
        end
    end
endmodule
