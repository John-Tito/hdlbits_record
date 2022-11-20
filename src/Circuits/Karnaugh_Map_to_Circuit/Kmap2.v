
module Kmap2 (
    input  a, b, c, d,
    output out
);
    assign out = ~(
        ((~c) & d & b)
        | (c & (~d) & a)
        |(c & d & (~a) & (~b))
        | (a & b & (~c) & (~c))
    );
endmodule
