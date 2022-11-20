module top_module (
    input        clk  ,
    input  [7:0] in   ,
    output [7:0] pedge
);
    reg [7:0] in_l   ;
    reg [7:0] pedge_a;
    always @(posedge clk ) begin
        in_l    <= in;
        pedge_a <= in & (~in_l);
    end
    assign pedge = pedge_a;
endmodule
