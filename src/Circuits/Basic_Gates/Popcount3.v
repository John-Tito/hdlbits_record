module Popcount3 (
    input      [2:0] in ,
    output reg [1:0] out
);

    reg [2:0] i;

    always @(in) begin
        out = 2'b0;
        for (i = 3'b0; i<3; i=i+3'b1) begin
            out = out + {1'b0,in[i]};
        end
    end
endmodule
