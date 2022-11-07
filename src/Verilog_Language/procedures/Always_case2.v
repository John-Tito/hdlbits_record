// synthesis verilog_input_version verilog_2001
module Always_case2 (
    input      [3:0] in ,
    output reg [1:0] pos
);

    always @(*) begin
        case (in)
            4'd8 :
                pos <= 2'b11;
            4'd4 , 4'd12 :
                pos <= 2'b10;
            4'd2 , 4'd6 , 4'd10 , 4'd14  :
                pos <= 2'b01;
            default :
                pos <= 2'b00;
        endcase
    end

endmodule
