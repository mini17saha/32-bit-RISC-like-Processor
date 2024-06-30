module memory(addr,data,rw,clk,out);
    input [31:0] addr,data;
    input [1:0] rw;
    input clk;
    output reg [31:0] out;
    reg [31:0] mem[0:1023];

    always @(posedge clk) begin
        case(rw)
            2'b10: begin out <= mem[addr];
            end
            2'b01: begin mem[addr] <= data;
            end
        endcase
    end

endmodule