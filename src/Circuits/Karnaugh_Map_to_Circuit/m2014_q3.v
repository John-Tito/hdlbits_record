module m2014_q3 (
    input  [4:1] x,
    output       f
);
    assign f = (x[3] & (~x[1])) | (((~x[3]) & x[1] & x[2]));

endmodule
