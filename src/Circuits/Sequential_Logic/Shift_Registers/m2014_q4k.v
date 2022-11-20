module m2014_q4k (
    input  clk   ,
    input  resetn, // synchronous reset
    input  in    ,
    output out
);
    reg [3:0] out_t;
    always @(posedge clk  ) begin
        if (resetn == 1'b0)
            out_t <= 4'h0;
        else
            out_t <= {out_t[2:0],in};
    end

    assign out = out_t[3];

endmodule
