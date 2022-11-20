module Adder100i (
    input  [99:0] a, b,
    input         cin ,
    output        cout,
    output [99:0] sum
);
    assign {cout,sum} = {1'b0,a} + {1'b0,b} + cin;

endmodule
