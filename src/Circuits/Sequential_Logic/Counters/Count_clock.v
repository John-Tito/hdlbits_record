module Count_clock (
    input            clk  ,
    input            reset,
    input            ena  ,
    output reg       pm   ,
    output     [7:0] hh   ,
    output     [7:0] mm   ,
    output     [7:0] ss
);

    wire [7:0] hh_t    ;
    wire [7:0] mm_t    ;
    wire [7:0] ss_t    ;
    wire       mm_ena  ;
    wire       hh_ena  ;
    wire       dd_ena  ;
    wire       ss_load ;
    wire       mm_load ;
    wire       hh_load ;
    wire       hh_reset;

    Countbcd2 count255_ss (
        .clk   (clk    ),
        .reset (reset  ),
        .load  (ss_load),
        .rvalue(8'h00  ),
        .lvalue(8'h00  ),
        .ena   (ena    ),
        .q     (ss_t   )
    );

    Countbcd2 count255_mm (
        .clk   (clk    ),
        .reset (reset  ),
        .load  (mm_load),
        .rvalue(8'h00  ),
        .lvalue(8'h00  ),
        .ena   (mm_ena ),
        .q     (mm_t   )
    );

    Countbcd2 count255_hh (
        .clk   (clk     ),
        .reset (hh_reset),
        .load  (hh_load ),
        .rvalue(8'h12   ),
        .lvalue(8'h01   ),
        .ena   (hh_ena  ),
        .q     (hh_t    )
    );

    always @(posedge clk)begin
        if(reset == 1'b1)
            pm = 1'b0;
        else
            pm = pm&(~dd_ena) | (~pm)&dd_ena;

    end

    assign mm_ena  = ((ss_t == 8'h59) && ena)?1'b1:1'b0;
    assign ss_load = mm_ena  ;
    assign hh_ena  = ((mm_t == 8'h59) && mm_ena)?1'b1:1'b0;
    assign mm_load = hh_ena  ;

    assign dd_ena  = ((hh_t == 8'h11) && hh_ena)?1'b1:1'b0;
    assign hh_load = (((hh_t ==8'h12) && hh_ena)?1'b1:1'b0);

    assign hh_reset = dd_ena | reset ;

    assign mm = mm_t;
    assign hh = hh_t;
    assign ss = ss_t;
endmodule

module Countbcd2 (
    input        clk   ,
    input        reset , // Synchronous active-high reset
    input        load  ,
    input  [7:0] rvalue,
    input  [7:0] lvalue,
    input        ena   ,
    output [7:0] q
);

    wire       enable1;
    wire [7:0] q_t    ;
    Countbcd1 bcdcount_dut1 (
        .clk   (clk        ),
        .reset (reset      ),
        .load  (load       ),
        .rvalue(rvalue[7:4]),
        .lvalue(lvalue[7:4]),
        .enable(enable1    ),
        .Q     (q_t[7:4]   )
    );

    Countbcd1 bcdcount_dut0 (
        .clk   (clk        ),
        .reset (reset      ),
        .load  (load       ),
        .rvalue(rvalue[3:0]),
        .lvalue(lvalue[3:0]),
        .enable(ena        ),
        .Q     (q_t[3:0]   )
    );
    assign enable1 = ((q_t[3:0]>=9) && (ena==1'b1))?1'b1:1'b0;

    assign q = q_t;

endmodule

module Countbcd1 (
    input            clk   ,
    input            reset ,
    input            load  ,
    input      [3:0] rvalue,
    input      [3:0] lvalue,
    input            enable,
    output reg [3:0] Q       =4'b0
);
    always @(posedge clk ) begin
        if (reset == 1'b1  )
            Q <= rvalue;
        else if((load == 1'b1) )
            Q <= lvalue;
        else if((Q >= 9)  && (enable == 1'b1))
            Q <= 4'h0;
        else
            Q <= Q + (4'h1 & enable);
    end
endmodule
