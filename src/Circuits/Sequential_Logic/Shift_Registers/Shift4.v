module Shift4 (
    input            clk   ,
    input            areset, // async active-high reset to zero
    input            load  ,
    input            ena   ,
    input      [3:0] data  ,
    output reg [3:0] q
);

    always @(posedge clk or posedge  areset) begin
        if (areset == 1'b1)
            q <= 4'h0;
        else if (load == 1'b1)
            q <= data;
        else if (ena == 1'b1)
            q <= {1'b0,q[3:1]};
        else
            q <= q ;
    end

endmodule
