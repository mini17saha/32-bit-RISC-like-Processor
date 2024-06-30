`timescale 1ns/1ps
module testbench;
    reg clk, rst;
    reg [31:0] instruct;
    wire [31:0] out;

    initial clk = 1;
    always #5 clk = ~clk;

    top_module TP(instruct,clk,rst,out);

    initial begin
        $monitor($time,"Instruction = %b, Output = %d",instruct,out);
        #0  rst = 1;  //addi $1, $0, 2
        #10 rst = 0;
        #10 instruct = 32'b00010000000000010000000000000010 ; 
        // #50 instruct = 32'b00010000000000100000000000000011;  //addi $2, $0, 3
        // #50 instruct = 32'b00000000001000100001100000000000;  //add $3, $1, $2
        // #50 instruct = 32'b00000100001000100010000000000000;  //and $4, $1, $2
        // #50 instruct = 32'b00111000010000010000000000000100; //st $1, 4($2)
        // #50 instruct = 32'b00111100010000000000000000000100; // ldsp $sp, 4($2)
        // #50 instruct = 32'b00110100010001100000000000000100; //ld $6, 4($2)
        // #50 instruct = 32'b01000100110000000011100000000000; //move $7,$6
        // #50 instruct = 32'b01010100010000000000000101000000; //bz $2,5
        
        #50 $finish;
    end

endmodule
