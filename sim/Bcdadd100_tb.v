module Bcdadd100_tb ();

    // Parameters

    // Ports
    reg  [399:0] a    = {400{1'b0}};
    reg  [399:0] b    = {400{1'b0}};
    reg          cin  = 0          ;
    wire         cout = 0          ;
    wire [399:0] sum  = {400{1'b0}};

    Bcdadd100 Bcdadd100_dut (
        .a   (a   ),
        .b   (b   ),
        .cin (cin ),
        .cout(cout),
        .sum (sum )
    );

    // initial begin
    //     begin
    //         $finish;
    //     end
    // end

    initial begin
        begin
            $dumpfile("sim/test_tb.lxt");
            $dumpvars(0,Bcdadd100_tb);
        end
    end

endmodule
