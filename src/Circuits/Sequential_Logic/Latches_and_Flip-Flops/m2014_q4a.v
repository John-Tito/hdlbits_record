module top_module (
    input  d  ,
    input  ena,
    output q
);
    reg q_a;
    always @(*) begin
        q_a <= ena?d:q_a;
    end
    assign q = q_a;
endmodule
