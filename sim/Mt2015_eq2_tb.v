module Mt2015_eq2_tb ();

    // Parameters

    // Ports
    reg  [2:0] Ai;
    reg  [2:0] Bi;
    reg  [1:0] A ;
    reg  [1:0] B ;
    wire       z ;

    Mt2015_eq2 Mt2015_eq2_dut (
        .A(A),
        .B(B),
        .z(z)
    );

    initial begin
        begin
            A <= 2'b00;
            B <= 2'b00;
            #10;
            for (Ai = 3'b00; Ai <4; Ai=Ai+3'b001) begin
                for (Bi = 3'b00; Bi <4; Bi=Bi+3'b001) begin
                    A <= Ai[1:0];
                    B <= Bi[1:0];
                    #10;
                end
            end
            $finish;
        end
    end

    initial begin
        begin
            $dumpfile("sim/test_tb.lxt");
            $dumpvars(0,Mt2015_eq2_tb);
        end
    end
endmodule
