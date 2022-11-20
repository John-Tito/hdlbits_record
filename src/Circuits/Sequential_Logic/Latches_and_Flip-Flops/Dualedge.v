module Dualedge (
    input  clk,
    input  d  ,
    output q
);

    // reg pel;
    // reg nel;
    // always @(posedge clk ) begin
    //     pel <= d;
    // end

    // always @(negedge clk ) begin
    //     nel <= d;
    // end

    // assign q = (nel & (~clk))| (pel & (clk));

    reg p = 1'b0;
    reg n = 1'b0;

    // A positive-edge triggered flip-flop
    always @(posedge clk)
        p <= d ^ n;

    // A negative-edge triggered flip-flop
    always @(negedge clk)
        n <= d ^ p;

    // Why does this work?
    // After posedge clk, p changes to d^n. Thus q = (p^n) = (d^n^n) = d.
    // After negedge clk, n changes to d^p. Thus q = (p^n) = (p^d^p) = d.
    // At each (positive or negative) clock edge, p and n FFs alternately
    // load a value that will cancel out the other and cause the new value of d to remain.
    assign q = p ^ n;

endmodule
