module Mt2015_q4 (
    input  x,
    input  y,
    output z
);
    wire ia1z;
    wire ia2z;
    wire ib1z;
    wire ib2z;

    MT2015_Q4a IA1 (
        .x(x   ),
        .y(y   ),
        .z(ia1z)
    );

    MT2015_Q4b IB1 (
        .x(x   ),
        .y(y   ),
        .z(ib1z)
    );

    MT2015_Q4a IA2 (
        .x(x   ),
        .y(y   ),
        .z(ia2z)
    );

    MT2015_Q4b IB2 (
        .x(x   ),
        .y(y   ),
        .z(ib2z)
    );

    assign z = (ia1z | ib1z) ^ (ia2z & ib2z);

endmodule
