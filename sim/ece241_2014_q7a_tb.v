module ece241_2014_q7a_tb ();

    // Parameters

    // Ports
    reg        clk      = 0;
    reg        reset    = 0;
    reg        enable   = 0;
    wire [3:0] Q           ;
    wire       c_enable    ;
    wire       c_load      ;
    wire [3:0] c_d         ;

    ece241_2014_q7a ece241_2014_q7a_dut (
        .clk     (clk     ),
        .reset   (reset   ),
        .enable  (enable  ),
        .Q       (Q       ),
        .c_enable(c_enable),
        .c_load  (c_load  ),
        .c_d     (c_d     )
    );

    initial begin
        begin
            enable <= 1'b0;
            reset <= 1'b1;
            #200;
            enable <= 1'b0;
            reset <= 1'b0;
            #200;
            enable <= 1'b1;
            reset <= 1'b0;
            #200;
            enable <= 1'b1;
            reset <= 1'b1;
            #200;
            $finish;
        end
    end

    always
        #5  clk = ! clk ;

    initial begin
        begin
            $dumpfile("sim/test_tb.lxt");
            $dumpvars(0,ece241_2014_q7a_tb);
        end
    end
endmodule
