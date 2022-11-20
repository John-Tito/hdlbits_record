

module ece241_2014_q7a (
    input        clk     ,
    input        reset   ,
    input        enable  ,
    output [3:0] Q       ,
    output       c_enable,
    output       c_load  ,
    output [3:0] c_d
);//

    reg        load;
    wire [3:0] d_t ;
    wire [3:0] Q_t ;

    assign d_t = 4'h1;
    count4 the_counter (
        .clk   (clk   ),
        .enable(enable),
        .load  (load  ),
        .d     (d_t   ),
        .Q     (Q_t   )
    );

    always @(*) begin
        if (reset == 1'b1 || ((Q_t >= 12) && (enable==1'b1)))
            load <= 1'b1;
        else
            load <= 1'b0;
    end

    // always @(negedge clk) begin
    //     if (reset == 1'b1 || ((Q_t >= 12) && (enable==1'b1)))
    //         load <= 1'b1;
    //     else
    //         load <= 1'b0;
    // end


    assign Q        = Q_t;
    assign c_d      = d_t;
    assign c_load   = load;
    assign c_enable = enable;
endmodule

module count4 (
    input            clk   ,
    input            enable,
    input            load  ,
    input      [3:0] d     ,
    output reg [3:0] Q
);
    always @(posedge clk ) begin
        if(load == 1'b1  )
            Q <= d;
        else
            begin
                if (enable==1'b1)begin
                    Q <= Q  + 4'h1;
                end
                else
                    Q <= Q ;
            end
    end
endmodule
