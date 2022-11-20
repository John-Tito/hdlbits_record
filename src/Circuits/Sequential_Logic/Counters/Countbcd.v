
module Countbcd (
    input         clk  ,
    input         reset, // Synchronous active-high reset
    output [ 3:1] ena  ,
    output [15:0] q
);

    wire [4:0] enable;
    wire [3:0] Q[3:0];
    genvar i;
    generate
        for (i = 0; i<4; i=i+1) begin :bcdcount_inst
            bcdcount bcdcount_dut (
                .clk   (clk   ),
                .reset (reset ),
                .enable(enable[i]),
                .Q     (Q[i]     )
            );
            assign enable[i+1] = ((Q[i]>=9) && (enable[i]==1'b1))?1'b1:1'b0;
        end
    endgenerate

    assign enable[0] = 1'b1;
    assign ena[3:1]  = enable[3:1];
    assign q         = {Q[3],Q[2],Q[1],Q[0]};

endmodule

module bcdcount (
    input            clk   ,
    input            reset ,
    input            enable,
    output reg [3:0] Q
);
    always @(posedge clk ) begin
        if (reset == 1'b1 || ((Q >= 9)  && (enable == 1'b1)))
            Q <= 4'h0;
        else
            Q <= Q + (4'h1 & enable);
    end
endmodule
