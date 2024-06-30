module extend15_32(in,out);
    input [14:0] in;
    output reg [31:0] out;

    always @(*) begin
            out[14:0] = in;
            out[31:15] = 0;
    end
endmodule

module extend16_32(in,out);
    input [15:0] in;
    output reg [31:0] out;

    always @(*) begin
            out[15:0] = in;
            out[31:16] = 0;
    end
endmodule