module top_module (
    input        clk,
    input  [7:0] d  ,
    input  [1:0] sel,
    output reg [7:0] q
);
    reg [7:0] q1;
    reg [7:0] q2;
    reg [7:0] q3;

    my_dff8 inst1 (clk,d,q1);

    my_dff8 inst2 (clk,q1,q2);

    my_dff8 inst3 (clk,q2,q3);

    always @(*) begin

        case (sel)
            2'b00 :
                q <= d;
            2'b01 :
                q <= q1;
            2'b10 :
                q <= q2;
            2'b11 :
                q <= q3;
            default :
                q <= q3;
        endcase

        // if (sel == 2'b00) begin
        //     q <= d;
        // end
        // else if (sel == 2'b01) begin
        //     q <= q1;
        // end
        // else if (sel == 2'b10) begin
        //     q <= q2;
        // end
        // else begin
        //     q <= q3;
        // end
    end
endmodule
