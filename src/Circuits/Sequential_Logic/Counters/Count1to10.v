module Count1to10 (
    input        clk  ,
    input        reset,
    output [3:0] q
);
    reg [3:0] q_a;
    always @(posedge clk ) begin
        if(reset == 1'b1 || q_a >= 10)
            q_a <= 4'h0;
        else
            q_a <= q_a + 4'h1;
    end
    assign q = q_a;
endmodule
