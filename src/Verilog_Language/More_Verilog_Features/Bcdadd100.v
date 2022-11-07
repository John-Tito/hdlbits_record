module Bcdadd100 (
    input  [399:0] a, b,
    input          cin ,
    output         cout,
    output [399:0] sum
);

    wire [99:0] cin_a ;
    wire [99:0] cout_a;
    assign cin_a = {cout_a[98:0],cin};
    assign cout  = cout_a[99];

    genvar i;
    generate
        for (i = 0; i<100; i=i+1) begin : bcd_fadd_inst
            bcd_fadd inst (
                .a   (a[((i+1)*4-1):(i*4)]   ),
                .b   (b[((i+1)*4-1):(i*4)]    ),
                .cin (cin_a[i] ),
                .cout(cout_a[i]),
                .sum (sum[((i+1)*4-1):(i*4)] )
            );
        end
    endgenerate

endmodule
