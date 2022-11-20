module top_module (
    input  clk,
    input  d  ,
    input  r  , // synchronous reset
    output q
);
    reg q_a;
    always @(posedge clk  ) begin
        if(r == 1'b1)
            q_a <= 1'b0;
        else
            q_a <= d;

    end
    assign q = q_a;
endmodule
