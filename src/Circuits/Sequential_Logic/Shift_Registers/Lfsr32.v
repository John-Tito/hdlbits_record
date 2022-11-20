module Lfsr32 (
    input         clk  ,
    input         reset, // Active-high synchronous reset to 32'h1
    output [31:0] q
);
    reg [31:0] q_t;
    always @(posedge clk ) begin
        if(reset==1'b1)
            q_t <= 32'b1;
        else
            q_t <= {1'b0^q_t[0],q_t[31:23],q_t[22]^q_t[0],q_t[21:3],q_t[2]^q_t[0],q_t[1]^q_t[0]};
        //           (31)       [30:22]     (21)            [20:2]       (1)         (0)
    end
    assign q = q_t;
endmodule
