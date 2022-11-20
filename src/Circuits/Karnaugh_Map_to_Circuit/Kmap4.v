
module Kmap4 (
    input  a, b, c, d,
    output out
);
    assign out = ((a^c) ^ (b^d));
endmodule
