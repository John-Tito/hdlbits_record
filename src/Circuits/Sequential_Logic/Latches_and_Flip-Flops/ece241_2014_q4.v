module top_module (
    input  clk,
    input  x  ,
    output z
);
    reg Q1 = 1'b0;
    reg Q2 = 1'b0;
    reg Q3 = 1'b0;

    always @(posedge clk ) begin
        Q1 <= Q1 ^ x;

        Q2 <= (~Q2) & x;

        Q3 <= (~Q3) | x;
    end
    assign z = ~(Q1 | Q2 | Q3);
endmodule
