module top_module (
    input          clk ,
    input          load,
    input  [255:0] data,
    output [255:0] q
);
    wire [18*18-1:0] q_t;

    genvar x,y;
    generate
        for (x = 0; x<18; x=x+1) begin:row
            for (x = 0; x<18; x=x+1) begin : col
                if( (x==0) || (x==17))
                    begin
                        if (y==0 || y == 17)
                            assign q_t[x*18+y] = data[(17-x)*16+(17-y)];
                        else
                            assign q_t[x*18+y] = data[(17-x)*16 + (y-1)];
                    end
                else
                    begin
                        if (y==0 || y == 17)
                            assign q_t[x*18+y] = data[(16-x)*16+(16-y)];
                        else
                            assign q_t[x*18+y] = data[(x-1)*16+(y-1)];
                    end
            end
        end
    endgenerate

endmodule
