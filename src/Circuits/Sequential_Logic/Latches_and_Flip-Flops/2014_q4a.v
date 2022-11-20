module top_module (
    input  clk,
    input  w, R, E, L,
    output Q
);

    reg Q_t;
    always @(posedge clk ) begin
        if(L)
            Q_t <= R;
        else
            begin
                if (E)
                    Q_t <= w;
                else
                    Q_t <= Q_t;
            end
    end
    assign Q = Q_t;
endmodule
