`timescale 1ns/1ps
module reg_module(rdData1, rdData2, wrData, sr1, sr2, dr, wreg, readreg,muxa2, clk, rst);
    input   clk, wreg,muxa2,rst;
    input   [1:0] readreg;
    input   [4:0]sr1, sr2, dr;
    input   [31:0]wrData;
    output reg [31:0] rdData1, rdData2;
    integer k;
    reg     [31:0] regfile[0:15];
    
    
    // initial begin
    //     for(k=0; k<16; k=k+1)begin
    //             regfile[k] <= k;
    //         end
    // end

    always @(posedge clk) begin
       
        if(rst)
            regfile[0] <= 0;
        else
            case(readreg)
                2'b11:begin
                    rdData1 <= regfile[sr1];
                    rdData2 <= regfile[sr2];
                end
                2'b01: rdData2 <= regfile[sr2];
                2'b10: rdData1 <= regfile[sr1];
            endcase
            if (wreg)
                if(muxa2 == 0)
                    regfile[dr] <= wrData; 
                else
                    regfile[sr2] <= wrData;
    end
endmodule

// module regfile_tb;
//     reg   clk, write, reset;
//     reg   [4:0]sr1, sr2, dr;
//     reg   [31:0]wrData;
//     wire  [31:0] rdData1, rdData2;

//     reg_module REG (rdData1, rdData2, wrData, sr1, sr2, dr, write, reset, clk);

//     initial clk = 0;

//     always #5 clk = ~clk;

//     initial
//     begin
//         $monitor($time,"read1 = %d, read2 = %d, wrote = %d, sr1 = %d, sr2 = %d, dr = %d",rdData1, rdData2, wrData, sr1, sr2, dr);
//         #10 reset = 1; write = 0;
//         #10 reset = 0; write = 1; dr = 1; wrData = 12;
//         #10 write = 1; dr = 15; wrData = 2;
//         #10 write = 0; sr1 = 1; sr2 = 15;
//         #10 $finish;
//     end
// endmodule
