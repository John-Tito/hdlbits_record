module ece241_2014_q1c (
    input  [7:0] a       ,
    input  [7:0] b       ,
    output [7:0] s       ,
    output       overflow
);//

    wire [7:0] a_s;

    assign a_s      = a + b;
    assign s        = a_s;
    assign overflow = (a_s[7] & (~a[7]) & (~b[7])) | ((~a_s[7]) &  a[7] & b[7]);
endmodule
