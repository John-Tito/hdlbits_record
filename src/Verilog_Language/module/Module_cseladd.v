module top_module (
    input  [31:0] a  ,
    input  [31:0] b  ,
    output [31:0] sum
);

    wire        cout1;
    wire [15:0] sum1 ;
    wire [15:0] sum2 ;

    add16 inst1 (
        .a   (a[15:0]  ),
        .b   (b[15:0]  ),
        .cin (1'b0     ),
        .sum (sum[15:0]),
        .cout(cout1    )
    );

    add16 inst2_1 (
        .a   (a[31:16]),
        .b   (b[31:16]),
        .cin (1'b0    ),
        .sum (sum1    ),
        .cout(        )
    );

    add16 inst2_2 (
        .a   (a[31:16]),
        .b   (b[31:16]),
        .cin (1'b1    ),
        .sum (sum2    ),
        .cout(        )
    );
    assign sum[31:16] = (cout1 == 1'b1)?sum2:sum1;
endmodule
