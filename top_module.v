// ###########################
// # Verilog Assignment 7 
// # Problem 1
// # Autumn Semester 2023
// # Group 18
// # Name 1: Ratan Junior
// # Name 2: Sreejita Saha
// ###########################

module top_module(instruct,clk,rst,out);
    input [31:0] instruct;
    input clk,rst;
    output reg [31:0] out;
    reg [31:0] pc,count;
    reg [31:0] sp;
    wire [1:0] Readreg,RWMem, LoadSP;
    wire MUXA1, MUXA2, WReg, MUXWB,MuxMemWrite,ctrl_m5,updatePC;
    wire [2:0] branch,flag;
    wire [3:0] ALUop;
    wire [31:0] rd1,rd2,write_reg,sp1,sp2,sp4,mem_out,pc_out,imm1,imm2;
    wire [31:0] alu_in1,alu_in2,alu_out,mem_wr,write_data1,write_data2,out1;

    initial count = 0;

    main_control MC(instruct[31:26],instruct[5:0],Readreg,ALUop,MUXA1,MUXA2,WReg,MUXWB,RWMem,LoadSP,MUXMemWrite,branch,updatePC,clk);
    reg_module RM(rd1,rd2,write_reg,instruct[25:21],instruct[20:16],instruct[15:11],WReg,Readreg,MUXA2,clk,rst);
    add_module A1(sp,32'd1,1'b0,sp1);
    sub_module S1(sp,32'd1,sp2);
    mux41 M1(sp,sp1,sp2,mem_out,LoadSP,sp4);
    mux21 M2(rd1,sp4,MUXA1,alu_in1);
    extend16_32 E1(instruct[15:0],imm1);
    mux21 M3(rd2,imm1,MUXA2,alu_in2);
    top_alu_module ALU(alu_in1,alu_in2,instruct[10:6],ALUop,clk,rst,alu_out,flag);
    extend15_32 E2(instruct[20:6],imm2);
    branch_mod BR(updatePC,instruct[5:0],imm2,flag,pc,mem_out,branch,clk,rst,pc_out,mem_wr);
    mux21 M4(alu_out,mem_out,MUXWB,write_reg);
    bit_and AD(branch[0],branch[1],ctrl_m5);
    mux21 M5(sp4,mem_wr,ctrl_m5,write_data1);
    mux21 M6(rd2,write_data1,MUXMemWrite,write_data2);
    // always @(*)
    // $display("write_Data2=",write_data2);
    memory MEM(alu_out,write_data2,RWMem,clk,mem_out);
    // memory MEM1(32'd2,32'd5,2'b01,clk,out1);
    // memory MEM2(32'd2,32'd0,2'b10,clk,out1);


    
    

    always @(posedge clk) begin
        if(rst) begin
            pc <= 32'd0;
            sp <= 32'd0;
        end
        else begin
            
            pc <= pc_out;
            sp <= sp4;
            out <= pc;
            
        end

    end
endmodule
