module top_module (
    input  clk,
    input  d  ,
    input  ar , // asynchronous reset
    output q
);
    reg q_a;
    always @(posedge clk or posedge ar) begin
        if(ar == 1'b1)
            q_a <= 1'b0;
        else
            q_a <= d;

    end
    assign q = q_a;
endmodule
