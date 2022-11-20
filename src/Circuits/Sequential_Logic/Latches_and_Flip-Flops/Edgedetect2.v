module top_module (
    input        clk    ,
    input  [7:0] in     ,
    output [7:0] anyedge
);

    reg [7:0] in_l     ;
    reg [7:0] anyedge_a;
    always @(posedge clk ) begin
        in_l      <= in;
        anyedge_a <= in ^ in_l;
    end
    assign anyedge = anyedge_a;
endmodule
