
module Mt2015_lfsr (
    input  [2:0] SW  , // R
    input  [1:0] KEY , // L and clk
    output [2:0] LEDR
);
// Q
    reg [2:0] Q_t;

    always @(posedge KEY[0] ) begin
        if (KEY[1] == 1'b1)
            Q_t <= SW;
        else
            Q_t <= {Q_t[2]^Q_t[1],Q_t[0],Q_t[2]};
    end
    assign LEDR = Q_t;
endmodule
