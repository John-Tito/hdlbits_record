module MT2015_Q4a (
    input  x,
    input  y,
    output z
);
    assign z = (x ^ y) & x;
endmodule
