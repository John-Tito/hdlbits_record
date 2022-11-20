module top_module (
    input        c     ,
    input        d     ,
    output [3:0] mux_in
);
    assign mux_in[0] = ({c,d} == 2'b00)?1'b0:1'b1;
    assign mux_in[1] = 1'b0;
    assign mux_in[2] = (d == 1'b0)?1'b1:1'b0;
    assign mux_in[3] = ({c,d} == 2'b11)?1'b1:1'b0;
endmodule
