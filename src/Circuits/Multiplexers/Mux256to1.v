
module Mux256to1 (
    input  [255:0] in ,
    input  [  7:0] sel,
    output         out
);
    assign out = in[sel];
endmodule