
module Adder3 #(parameter WIDTH = 3) (
    input  [(WIDTH-1):0] a, b,
    input                cin ,
    output [(WIDTH-1):0] cout,
    output [(WIDTH-1):0] sum
);

    wire [(WIDTH-1):0] a_cin ;
    wire [(WIDTH-1):0] a_cout;

    genvar i;
    generate
        for (i = 0; i<WIDTH; i=i+1) begin :fadd_inst
            Fadd Fadd_dut (
                .a (a[i] ),
                .b (b[i] ),
                .cin (a_cin[i] ),
                .cout (a_cout[i] ),
                .sum  ( sum[i])
            );
        end
    endgenerate

    assign a_cin = {a_cout[(WIDTH-2):0],cin};
    assign cout  = a_cout;
endmodule

module Fadd (
    input  a, b, cin,
    output cout, sum
);

    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule
