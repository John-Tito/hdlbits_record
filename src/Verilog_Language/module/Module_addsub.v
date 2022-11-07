module top_module (
    input  [31:0] a  ,
    input  [31:0] b  ,
    input         sub,
    output [31:0] sum
);

    wire        cout1;
    wire [31:0] inv_b;

    assign inv_b = b ^ {32{sub}};

    add16 inst1 (
        .a   (a[15:0]    ),
        .b   (inv_b[15:0]),
        .cin (sub        ),
        .sum (sum[15:0]  ),
        .cout(cout1      )
    );

    add16 inst2 (
        .a   (a[31:16]    ),
        .b   (inv_b[31:16]),
        .cin (cout1       ),
        .sum (sum[31:16]  ),
        .cout(            )
    );

endmodule
