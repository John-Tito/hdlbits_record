module top_module (
    input  clk,
    input  j  ,
    input  k  ,
    output Q
);
    reg Q_a;
    always @(posedge clk ) begin
        // case ({j,k})
        //     2'b00 :
        //         Q_a <= Q_a;
        //     2'b01 :
        //         Q_a <= 0;
        //     2'b10 :
        //         Q_a <= 1;
        //     2'b11 :
        //         Q_a <= ~Q_a;
        //     default :
        //         Q_a <= Q_a;
        // endcase
        Q_a <= ((j & (~k)) | (j&k&(~Q_a)) | (~j)&(~k)&Q_a) & (j|(~k));
    end
    assign Q = Q_a;
endmodule
