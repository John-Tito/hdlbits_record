module MT2015_Q4b (
    input  x,
    input  y,
    output z
);
    assign z = x ~^y;
endmodule
