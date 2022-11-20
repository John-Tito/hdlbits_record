
module Kmap3 (
    input  a, b, c, d,
    output out
);
    assign out = a | ((~a)&(~b)&c) ;
endmodule
