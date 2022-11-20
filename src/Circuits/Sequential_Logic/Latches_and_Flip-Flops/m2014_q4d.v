module top_module (
    input  clk,
    input  in ,
    output out
);

    reg in_l;
    always @(posedge clk ) begin
        in_l <= in_l ^ in;
    end
    assign out = in_l;
endmodule
