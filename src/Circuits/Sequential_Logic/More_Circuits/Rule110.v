module Rule90 (
    input          clk ,
    input          load,
    input  [511:0] data,
    output [511:0] q
);
    reg  [511:0] Center;
    wire [511:0] Left  ;
    wire [511:0] Right ;
    assign Left  = {1'b0,Center[511:1]};
    assign Right = {Center[510:0],1'b0};

    always @(posedge clk ) begin
        if(load == 1'b1)
            Center <= data;
        else
            Center <= ~(( Left & Center & Right ) | ((~Center) & ( ~Right)));
    end
    assign q = Center;
endmodule
