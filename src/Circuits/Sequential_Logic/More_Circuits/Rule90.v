module Rule90 (
    input          clk ,
    input          load,
    input  [511:0] data,
    output [511:0] q
);
    reg [511:0] q_t;
    always @(posedge clk ) begin
        if(load == 1'b1)
            q_t <= data;
        else
            q_t <= {1'b0,q_t[511:1]} ^ {q_t[510:0],1'b0};
    end
    assign q = q_t;
endmodule
