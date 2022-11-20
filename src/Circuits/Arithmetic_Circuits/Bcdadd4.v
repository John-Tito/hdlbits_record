
module bcd_fadd (
    input  [3:0] a   ,
    input  [3:0] b   ,
    input        cin ,
    output       cout,
    output [3:0] sum
);

endmodule

module Bcdaddn #(parameter WIDTH = 4) (
    input  [(WIDTH*4-1):0] a, b,
    input                  cin ,
    output                 cout,
    output [(WIDTH*4-1):0] sum
);

    wire [(WIDTH-1):0] a_t   [3:0];
    wire [(WIDTH-1):0] b_t   [3:0];
    wire [(WIDTH-1):0] sum_t [3:0];
    wire [(WIDTH-1):0] cin_t      ;
    wire [(WIDTH-1):0] cout_t     ;

    genvar i;
    generate
        for (i=0 ; i<WIDTH; i=i+1 ) begin :bcd_fadd_inst
            assign a_t[i] = {a[i*4+3],a[i*4+2],a[i*4+1],a[i*4]};
            assign b_t[i] = {b[i*4+3],b[i*4+2],b[i*4+1],b[i*4]};
            assign {sum[i*4+3],sum[i*4+2],sum[i*4+1],sum[i*4]} = sum_t[i];
            bcd_fadd bcd_fadd_dut (
                .a   (a_t[i]   ),
                .b   (b_t[i]   ),
                .cin (cin_t[i] ),
                .cout(cout_t[i]),
                .sum (sum_t[i] )
            );
        end
    endgenerate
    assign cin_t = {cout_t[(WIDTH-2):0],cin};
    assign cout  = cout_t[(WIDTH-1)];
endmodule
