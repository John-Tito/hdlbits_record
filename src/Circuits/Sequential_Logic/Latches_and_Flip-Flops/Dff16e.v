module top_module (
    input         clk    ,
    input         resetn ,
    input  [ 1:0] byteena,
    input  [15:0] d      ,
    output [15:0] q
);
    reg [15:0] q_a;
    always @(posedge clk ) begin
        if (resetn == 1'b0)
            q_a <= 8'b0;
        else
            begin
                q_a[15:8] <= byteena[1]?d[15:8] : q_a[15:8];
                q_a[7:0]  <= byteena[0]?d[7:0]   : q_a[7:0] ;
            end
    end
    assign q = q_a;
endmodule
