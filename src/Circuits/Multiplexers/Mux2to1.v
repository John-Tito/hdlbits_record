module Mux2to1 (
    input  a, b, sel,
    output out
);
    // assign out = (b & sel) | (a & (~sel));
    assign out = sel?b:a;
endmodule
