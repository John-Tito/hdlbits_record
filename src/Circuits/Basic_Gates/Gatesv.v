module Gatesv (
    input  [3:0] in           ,
    output [2:0] out_both     ,
    output [3:1] out_any      ,
    output [3:0] out_different
);

    // wire [4:0] in_warp;
    // reg  [3:0] i      ;
    // always @(in) begin
    //     for (i = 0; i<3; i=i+1) begin
    //         out_both[i] <= (in[i] & in[i+1]);
    //     end
    // end

    // always @(in) begin
    //     for (i = 0; i<3; i=i+1) begin
    //         out_any[i+1] <= in[i+1] | in[i];
    //     end
    // end

    // assign in_warp = {in[0],in};
    // always @(in) begin
    //     for (i = 0; i<4; i=i+1) begin
    //         out_different[i] <= (in_warp[i] ^ in_warp[i+1]);
    //     end
    // end
    assign out_both      = in[2:0] & in[3:1];
    assign out_any       = in[3:1] | in[2:0];
    assign out_different = in[3:0] ^ {in[0], in[3:1]};
endmodule
