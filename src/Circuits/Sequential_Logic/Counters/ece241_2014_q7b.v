module ece241_2014_q7b (
    input        clk     ,
    input        reset   ,
    output       OneHertz,
    output [2:0] c_enable
);//

    wire       OneHertz_t;
    wire [2:0] c_enable_t;

    wire [2:0] c_reset     ;
    wire [3:0] c_Q    [2:0];

    bcdcount counter0 (clk,c_reset[0],c_enable_t[0],c_Q[0]/*,...*/);
    bcdcount counter1 (clk,c_reset[1],c_enable_t[1],c_Q[1]/*,...*/);
    bcdcount counter2 (clk,c_reset[2],c_enable_t[2],c_Q[2]/*,...*/);

    assign c_enable_t[0] = 1'b1;
    assign c_enable_t[1] = ((c_Q[0]>=9 && (c_enable_t[0]== 1'b1)) ? 1'b1:1'b0 );
    assign c_enable_t[2] = ((c_Q[1]>=9 && (c_enable_t[1]== 1'b1)) ? 1'b1:1'b0 );
    assign OneHertz_t    = ((c_Q[2]>=9 && (c_enable_t[2]== 1'b1)) ? 1'b1:1'b0 );

    assign c_reset[0] = ((c_enable_t[1]== 1'b1) ? 1'b1:1'b0 ) | reset;
    assign c_reset[1] = ((c_enable_t[2]== 1'b1) ? 1'b1:1'b0 ) | reset;
    assign c_reset[2] = ((OneHertz_t == 1'b1) ? 1'b1:1'b0 ) | reset;

    assign OneHertz = OneHertz_t;
    assign c_enable = c_enable_t;
endmodule

module bcdcount (
    input            clk   ,
    input            reset ,
    input            enable,
    output reg [3:0] Q
);
    always @(posedge clk ) begin
        if (reset == 1'b1 || ((Q >= 9)  && (enable == 1'b1)))
            Q <= 4'h0;
        else
            Q <= Q + (4'h1 & enable);
    end
endmodule
