module Popcount255 (
    input      [254:0] in ,
    output reg [  7:0] out
);
    reg [7:0] cnt;
    always @(in) begin
        out = 8'b0;
        for (cnt = 0; cnt<255;cnt=cnt+8'h1 ) begin
            out = out + {7'b0,in[cnt]};
        end
    end


endmodule
