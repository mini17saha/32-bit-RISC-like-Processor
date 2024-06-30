module pos_edge_det (sig, clk, pe); 
    input sig, clk; 
    output pe;     
    reg sig_dly; // Internal signal to store the delayed version of signal

   // This always block ensures that sig_dly is exactly 1 clock behind sig
    always @ (posedge clk) begin
        sig_dly <= sig;
    end
    
   // Combinational logic where sig is AND with delayed, inverted version of sig
   // Assign statement assigns the evaluated expression in the RHS to the internal net pe
    assign pe = sig & ~sig_dly;
endmodule

module Processor(in,btn,rst,clk,out);
    input [15:0] in;
    input btn;
    input rst;
    input clk;
    output reg  [15:0] out;

    reg     [31:0] instruct;
    wire    [31:0] res;
    reg     [1:0] state;
    
    wire pe;

    
    
    pos_edge_det detector(btn,clk,pe);

    initial begin 
        instruct = 0;
        state = 0;
        out = 0;
    end

    top_module TOP (instruct,clk,rst,res);

    always @(posedge clk)
    begin
        $display("%d", pe); 
        if(pe) begin
        case(state)
            0: begin 
                instruct[15:0] <= in;
                out <= 1; 
                end
            1: begin 
                instruct[31:16] <= in;
                out <= 2; 
            end
            2: begin
                
                out <= res[15:0];
                
            end
            3: begin 
                
                out <= res[31:16];
            end
            
        endcase
        if (btn)
            state <= state + 1;
        if (state == 3)
            state <= 0;
       if(rst) begin 
            instruct <= 0;
            state <= 0;
            out <= 0;
         end
        end
    end


endmodule

