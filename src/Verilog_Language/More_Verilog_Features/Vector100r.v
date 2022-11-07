module Vector100r (
    input      [99:0] in ,
    output reg [99:0] out
);

    reg [7:0] cnt;
    always @(*) begin
        for (cnt = 0; cnt<100;cnt=cnt+8'h1 ) begin
            out[cnt] <= in[99-cnt];
        end
    end
endmodule
