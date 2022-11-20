module top_module (
    input         clk  ,
    input         reset,
    input  [31:0] in   ,
    output [31:0] out
);
    reg [31:0] out_t = 32'b0;
    reg [31:0] in_l  = 32'b0;
    always @(posedge clk ) begin
        in_l <= in;
        if(reset == 1'b1)
            out_t <= 32'b0;
        else
            out_t <= ((~in) & in_l) | (in | (~in_l)) & out_t;
    end
    assign out = out_t;
endmodule
