module mux21(in1,in2,s,out);

    input   [31:0] in1,in2;
    input    s;
    output reg   [31:0] out;

    always @(*) begin
        if(s==1'b0)
            out <= in1;
        else
            out <= in2;
    end
    

endmodule

module mux41(in1,in2,in3,in4,s,out);
    input   [31:0] in1,in2,in3,in4;
    input   [1:0] s;
    output reg  [31:0] out;

    always @(*) begin
        case(s)
            0: out = in1;
            1: out = in2;
            2: out = in3;
            3: out = in4;
        endcase
    end

endmodule