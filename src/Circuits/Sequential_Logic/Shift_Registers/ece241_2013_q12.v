module ece241_2013_q12 (
    input  clk   ,
    input  enable,
    input  S     ,
    input  A, B, C,
    output Z
);

    wire [2:0] address = {A,B,C};
    reg  [7:0] data             ;
    always @(posedge clk ) begin
        if(enable == 1'b1)
            data <= {data[6:0],S};
        else
            data <= data;
    end
    assign Z = data[address];

endmodule
