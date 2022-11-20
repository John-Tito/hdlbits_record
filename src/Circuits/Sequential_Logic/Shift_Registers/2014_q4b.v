module top_module (
    input  [3:0] SW  ,
    input  [3:0] KEY ,
    output [3:0] LEDR
);//
    parameter LEV = 4;

    wire [LEV:0] Q_t;
    genvar i;
    generate
        for (i = 0;i<LEV ;i=i+1 ) begin :MUXDFF_inst
            MUXDFF MUXDFF_i(
                .clk(KEY[0]),
                .w(Q_t[i+1]),
                .R(SW[i]),
                .E(KEY[1]),
                .L( KEY[2]),
                .Q(Q_t[i])
            );
        end
    endgenerate

    assign Q_t[LEV] = KEY[3];
    assign LEDR     = Q_t[3:0];

endmodule

module MUXDFF (
    input  clk,
    input  w, R, E, L,
    output Q
);
    reg Q_t;
    always @(posedge clk ) begin
        if(L)
            Q_t <= R;
        else  if (E)
            Q_t <= w;
        else
            Q_t <= Q_t;
    end

    assign Q = Q_t;
endmodule
