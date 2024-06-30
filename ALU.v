// ###########################
// # Verilog Assignment 7 
// # Problem 1
// # Autumn Semester 2023
// # Group 18
// # Name 1: Ratan Junior
// # Name 2: Sreejita Saha
// ###########################


module add_module(in1, in2, cin, sum);
    input   [31:0] in1, in2;
    input   cin;
    output  [31:0] sum;
    
    assign sum = in1 + in2 + cin;
endmodule

module not_module(in1, com);
    input   [31:0] in1;
    output  [31:0] com;

    assign com = ~in1;
endmodule

module sub_module(in1, in2, res);
    input   [31:0] in1, in2;
    output  [31:0] res;
    wire    [31:0] in2_com;

    wire    cin;
    assign  cin = 1;
    
    not_module C0    (in2, in2_com);
    add_module A0   (in1, in2_com, cin, res);
endmodule 



module  sla_module(in1, res);
    input   [31:0] in1;
    output  [31:0] res;  

    assign  res = in1 << 1;
endmodule

module  srl_module(in1, res);
    input   [31:0] in1;
    output  [31:0] res; 

    assign  res = in1 >> 1;
endmodule

module bit_and(in1,in2,out);
    input in1,in2;
    output reg out;
    always @(*) out = in1 & in2;
endmodule



module  sra_module(in1, res);
    input   [31:0] in1;
    output  [31:0] res; 

    assign  res[30:0] = in1[31:1];
    assign  res[31] = in1[31];
endmodule

module  and_module(in1, in2, res);
    input   [31:0] in1, in2;
    output  [31:0] res;

    assign  res = in1 & in2;
endmodule

module  or_module(in1, in2, res);
    input   [31:0] in1, in2;
    output  [31:0] res;

    assign  res = in1 | in2;
endmodule

module  top_alu_module(in1, in2, shamt,func, clk,rst, out,f);
    input   [31:0] in1, in2;
    input   [4:0] shamt;
    input   [3:0] func;
    input   clk,rst;
    wire     cin;
    output  [31:0] out;
    reg     [31:0] out;
    output reg [2:0] f;
    wire    [31:0] b_out0, b_out1, b_out2, b_out3, b_out4, b_out5, b_out6, b_out7,b_out9,b_out10;
    assign  cin = 0;
    
    add_module A0 (in1, in2, cin, b_out0);
    sub_module A1 (in1, in2, b_out1);
    sla_module A3 (in1, b_out3);
    srl_module A4 (in1, b_out4);
    and_module A5 (in1, in2, b_out5);
    not_module A6 (in1, b_out6);
    or_module A7 (in1, in2, b_out7);
    sra_module A8 (in1, b_out9);


    parameter   ADD=4'b0000, SUB=4'b0001, SLA=4'b0011, SRL=4'b0100, ANDM=4'b0101, NOTM=4'b0110, ORM=4'b0111, XOR=4'b1000, SRA=4'b1001, REL = 4'b0010;
    always @(posedge clk) begin
        if(rst)
            out<= 0;
        else begin
            case(func)
                ADD:
                    out <= b_out0;
                SUB:
                    out <= b_out1;
                SLA:begin
                    if (shamt == 1)
                        out <= b_out3;
                    else
                        out <= in1;
                end
                SRL:begin
                    if (shamt == 1)
                        out <= b_out4;
                    else
                        out <= in1;
                end
                ANDM:
                    out <= b_out5;
                NOTM:
                    out <= b_out6;
                ORM:
                    out <= b_out7;
                XOR:
                    out <=in1 ^ in2;
                SRA:begin
                    if (shamt == 1)
                        out  <= b_out9;
                    else
                        out <= in1;
                end
                REL: begin
                    if(in1 == 0 )
                        f[2] <= 1'b1;
                    else if(in1 > 0 )
                        f[1] <= 1'b1;
                    else 
                        f[0] <= 1'b1;
                end
    
        endcase
        end
    end
endmodule