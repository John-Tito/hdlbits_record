module add16 (
    input[15:0] a,
    input[15:0] b,
    input  cin ,
    output[15:0] sum,
    output cout
);

    wire [15:0] a_cin ;
    wire [15:0] a_cout;

    assign cin  = {a_cout[14:0],cin};
    assign cout = a_cout[15];

    genvar i;
    generate
        for (i  = 0; i<16;i=i+1 ) begin: add_inst
            add1 inst(
                .a(a[i]),
                .b(b[i]),
                .cin(a_cin[i]),
                .sum(sum[i]),
                .cout(a_cout[i])
            );
        end
    endgenerate

endmodule
