module branch_mod(input updatePC,input [5:0] func,
input [31:0] imm,
input [2:0] flag,
input [31:0] pc_in,
input [31:0] des_addr,
input [2:0] branch_sig,
input clk,
input rst,
output reg [31:0] pc_out,
output reg [31:0] mem_wr);

reg [2:0] old_flag;

always @(posedge clk) begin
    if(rst)
        old_flag <= 0;
    else
        old_flag <= flag;
end

always @(*) begin
    if(rst)
        pc_out <= 32'd0;
    else begin
        if (updatePC == 1'b1) begin
        case(branch_sig)
            3'b001: begin
                case(func)
                    6'b000000: pc_out <= imm;
                    default: begin 
                        pc_out <= pc_in + 32'd1;
                    end
                endcase
            end
            3'b010: begin
                case(func)
                    6'b000000: begin
                        if(flag[0]==1'b1)
                            pc_out <= pc_in + imm;
                        else
                            pc_out <= pc_in + 32'd1;
                    end
                    6'b000001: begin
                        if(flag[1]==1'b1)
                            pc_out <= pc_in + imm;
                        else
                            pc_out <= pc_in + 32'd1;
                    end
                    6'b000010: begin
                        if(flag[2]==1'b1)
                            pc_out <= pc_in + imm;
                        else
                            pc_out <= pc_in + 32'd1;
                    end
                    default: pc_out <= pc_in + 32'd1;
                endcase
            end
            3'b011: begin
                case(func)
                    6'b000000: begin
                        mem_wr <= pc_in + 32'd1;
                        pc_out <= pc_in + imm;
                    end
                    default:pc_out <= pc_in + 32'd1;
                endcase
            end
            3'b100: begin
                case(func)
                    6'b000000: begin 
                        pc_out <= des_addr;
                    end
                    default: pc_out <= pc_in + 32'd1;
                endcase
            end
            3'b101: begin
                case(func)
                    6'b000000: pc_out <= pc_in;
                    default: pc_out <= pc_in + 32'd1;
                endcase
            end
            default:begin  pc_out <= pc_in + 32'd1;
            end
        endcase
        end
    end
end


endmodule