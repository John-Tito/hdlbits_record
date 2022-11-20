module m2014_q4j #(parameter WIDTH = 4) (
    input  [(WIDTH-1):0] x, y,
    output [    WIDTH:0] sum
);

    assign sum = x + y;

    // wire [(WIDTH-1):0] a_cin ;
    // wire [(WIDTH-1):0] a_cout;

    // genvar i;
    // generate
    //     for (i = 0; i<WIDTH; i=i+1) begin :fadd_inst
    //         Fadd Fadd_dut (
    //             .a (x[i] ),
    //             .b (y[i] ),
    //             .cin (a_cin[i] ),
    //             .cout (a_cout[i] ),
    //             .sum  ( sum[i])
    //         );
    //     end
    // endgenerate

    // assign a_cin      = {a_cout[(WIDTH-2):0],1'b0};
    // assign sum[WIDTH] = a_cout[WIDTH-1];
endmodule

// module Fadd (
//     input  a, b, cin,
//     output cout, sum
// );

//     assign sum  = a ^ b ^ cin;
//     assign cout = (a & b) | (a & cin) | (b & cin);
// endmodule
