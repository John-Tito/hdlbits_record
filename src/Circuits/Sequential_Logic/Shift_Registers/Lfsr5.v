
module Lfsr5 (
    input        clk  ,
    input        reset, // Active-high synchronous reset to 5'h1
    output [4:0] q
);
    reg [4:0] q_t;
    always @(posedge clk ) begin
        if(reset==1'b1)
            q_t <= 5'b1;
        else
            q_t <= {1'b0^q[0],q[4],q[3]^q[0],q_t[2],q_t[1]};
    end
    assign q = q_t;
endmodule
