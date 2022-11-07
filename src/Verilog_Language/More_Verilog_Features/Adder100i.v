module Adder100i (
    input  [99:0] a, b,
    input         cin ,
    output [99:0] cout,
    output [99:0] sum
);

    wire [99:0] a_cin ;
    wire [99:0] a_cout;

    assign cout  = a_cout;
    assign a_cin = {a_cout[98:0],cin};

    genvar i;
    generate
        for (i = 0; i<100; i=i+1) begin : add1_inst
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

