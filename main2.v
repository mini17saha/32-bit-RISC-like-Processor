`timescale 1ns / 1ps

module main_control(
    input [5:0] opcode,
    input [5:0] func,
    output reg [1:0] Readreg,
    output reg [3:0] ALUop,
    output reg MUXA1,
    output reg MUXA2,
    output reg WReg,
    output reg MUXWB,
    output reg [1:0] RWMem,
    output reg [1:0] LoadSP,
    output reg  MUXMemWrite,
    output reg [2:0] branch,
    output reg updatePC,
    input clk
);
    reg [3:0] state;
    initial begin
        state = 0;
        Readreg = 2'b00;
        ALUop = 4'b0000;  //dc
        MUXA1 = 0;  //dc
        MUXA2 = 1'b0;  //dc  
        WReg = 0;
        MUXWB = 0;  //dc
        RWMem = 2'b00;
        LoadSP = 2'b00;
        MUXMemWrite = 1'b0;  //dc
        branch = 3'b000;
        updatePC = 1'b0 ;
    end
    always @(posedge clk) begin
        case(state)
            0:begin
                // updatePC<=1;
                state<=state+4'd1;
            end
            1:begin
                updatePC<=0;
                state<=state+4'd1;
            end
            2:begin
                case(opcode)
                    6'b000000:begin
                        case(func)
                        6'b000000:begin
                            Readreg <= 2'b11;
                            LoadSP <= 2'b00;
                            branch <= 3'b000;
                        end
                        6'b000001:begin
                            Readreg <= 2'b11;
                            LoadSP <= 2'b00;
                            branch <= 3'b000;
                        end
                        endcase
                    end

                    6'b000001:begin
                        case(func)
                        6'b000000:begin
                            Readreg <= 2'b11;
                            LoadSP <= 2'b00;
                            branch <= 3'b000;
                        end
                        6'b000001:begin
                            Readreg <= 2'b11;
                            LoadSP <= 2'b00;
                            branch <= 3'b000;
                        end
                        6'b000010:begin
                            Readreg <= 2'b11;
                            LoadSP <= 2'b00;
                            branch <= 3'b000;
                        end
                        endcase
                    end

                    6'b000010:begin
                        case(func)
                        6'b000000:begin
                            Readreg <= 2'b10;
                            LoadSP <= 2'b00;
                            branch <= 3'b000;
                        end
                        endcase
                    end

                    6'b000011:begin
                        case(func)
                        6'b000000:begin
                            Readreg <= 2'b10;
                            LoadSP <= 2'b00;
                            branch <= 3'b000;
                        end
                        6'b000001:begin
                            Readreg <= 2'b10;
                            LoadSP <= 2'b00;
                            branch <= 3'b000;
                        end
                        6'b000010:begin
                            Readreg <= 2'b10;
                            LoadSP <= 2'b00;
                            branch <= 3'b000;
                        end
                        endcase
                    end

                    6'b000100:begin
                        Readreg <= 2'b10;
                        LoadSP <= 2'b00;
                        branch <= 3'b000;
                        // MUXA1 <= 1'b0;
                        // MUXA2 <= 1'b1;
                        // ALUop <= 4'b0000;
                        // MUXWB <= 1'b0;
                        // RWMem <= 2'b00;
                        // WReg <= 1'b1;
                    end

                    6'b000101:begin
                        Readreg <= 2'b10;
                        LoadSP <= 2'b00;
                        branch <= 3'b000;
                    end

                    6'b000110:begin
                        Readreg <= 2'b10;
                        LoadSP <= 2'b00;
                        branch <= 3'b000;
                    end

                    6'b000111:begin
                        Readreg <= 2'b10;
                        LoadSP <= 2'b00;
                        branch <= 3'b000;
                    end

                    6'b001000:begin
                        Readreg <= 2'b10;
                        LoadSP <= 2'b00;
                        branch <= 3'b000;
                    end

                    6'b001001:begin
                        Readreg <= 2'b00;
                        LoadSP <= 2'b00;
                        branch <= 3'b000;
                    end

                    6'b001010:begin
                        Readreg <= 2'b10;
                        LoadSP <= 2'b00;
                        branch <= 3'b000;
                    end

                    6'b001011:begin
                        Readreg <= 2'b10;
                        LoadSP <= 2'b00;
                        branch <= 3'b000;
                    end

                    6'b001100:begin
                        Readreg <= 2'b10;
                        LoadSP <= 2'b00;
                        branch <= 3'b000;
                    end

                    6'b001101:begin
                        Readreg <= 2'b10;
                        LoadSP <= 2'b00;
                        branch <= 3'b000;
                    end

                    6'b001110:begin
                        Readreg <= 2'b11;
                        LoadSP <= 2'b00;
                        branch <= 3'b000;
                    end

                    6'b001111:begin
                        Readreg <= 2'b10;
                        LoadSP <= 2'b11;
                        branch <= 3'b000;
                    end

                    6'b010000:begin
                        Readreg <= 2'b10;
                        LoadSP <= 2'b00;
                        branch <= 3'b000;
                    end

                    6'b010001:begin
                        Readreg <= 2'b11;
                        LoadSP <= 2'b00;
                        branch <= 3'b000;
                    end

                    6'b010010:begin
                        Readreg <= 2'b01;
                        LoadSP <= 2'b10;
                        branch <= 3'b000;
                    end

                    6'b010011:begin
                        Readreg <= 2'b00;
                        LoadSP <= 2'b01;
                        branch <= 3'b000;
                    end

                    6'b010100:begin
                        case(func)
                            6'b000000:begin
                                Readreg <= 2'b00;
                                LoadSP <= 2'b00;
                                branch <= 3'b001;
                            end
                        endcase
                    end

                    6'b010101:begin
                        case(func)
                            default:begin
                                Readreg <= 2'b10;
                                LoadSP <= 2'b00;
                                branch <= 3'b010;
                            end
                        endcase
                    end

                    6'b010110:begin
                        case(func)
                            6'b000000:begin
                                Readreg <= 2'b00;
                                LoadSP <= 2'b10;
                                branch <= 3'b011;
                            end
                        endcase
                    end

                    6'b010111:begin
                        case(func)
                            6'b000000:begin
                                Readreg <= 2'b00;
                                LoadSP <= 2'b01;
                                branch <= 3'b100;
                            end
                        endcase
                    end

                    6'b011000:begin
                        case(func)
                            6'b000000:begin
                                Readreg <= 2'b00;
                                LoadSP <= 2'b00;
                                branch <= 3'b101;
                            end
                        endcase
                    end

                    6'b011001:begin
                        case(func)
                            6'b000000:begin
                                Readreg <= 2'b00;
                                LoadSP <= 2'b00;
                                branch <= 3'b000;
                            end
                        endcase
                    end
                endcase
                state <= state+4'd1;
            end

            3:begin
                case(opcode)
                    6'b000000:begin
                        case(func)
                        6'b000000:begin
                            MUXA1 <= 1'b0;
                            MUXA2 <= 1'b0;
                        end
                        6'b000001:begin
                            MUXA1 <= 1'b0;
                            MUXA2 <= 1'b0;
                        end
                        endcase
                    end

                    6'b000001:begin
                        case(func)
                        6'b000000:begin
                            MUXA1 <= 1'b0;
                            MUXA2 <= 1'b0;
                        end
                        6'b000001:begin
                            MUXA1 <= 1'b0;
                            MUXA2 <= 1'b0;
                        end
                        6'b000010:begin
                            MUXA1 <= 1'b0;
                            MUXA2 <= 1'b0;
                        end
                        endcase
                    end

                    6'b000010:begin
                        case(func)
                        6'b000000:begin
                            MUXA1 <= 1'b0;
                            end
                        endcase
                    end

                    6'b000011:begin
                        case(func)
                        6'b000000:begin
                            MUXA1 <= 1'b0;
                            // MUXA2 <= 1'b0;
                        end
                        6'b000001:begin
                            MUXA1 <= 1'b0;
                            // MUXA2 <= 1'b0;
                        end
                        6'b000010:begin
                            MUXA1 <= 1'b0;
                            // MUXA2 <= 1'b0;
                        end
                        endcase
                    end

                    6'b000100:begin
                        MUXA1 <= 1'b0;
                        MUXA2 <= 1'b1;
                        ALUop <= 4'b0000;
                    end

                    6'b000101:begin
                        MUXA1 <= 1'b0;
                        MUXA2 <= 1'b1;
                    end

                    6'b000110:begin
                        MUXA1 <= 1'b0;
                        MUXA2 <= 1'b1;
                    end

                    6'b000111:begin
                        MUXA1 <= 1'b0;
                        MUXA2 <= 1'b1;
                    end

                    6'b001000:begin
                        MUXA1 <= 1'b0;
                        MUXA2 <= 1'b1;
                    end

                    6'b001001:begin
                        // MUXA1 <= 1'b0;
                        MUXA2 <= 1'b1;
                    end

                    6'b001010:begin
                        MUXA1 <= 1'b0;
                        MUXA2 <= 1'b1;
                    end

                    6'b001011:begin
                        MUXA1 <= 1'b0;
                        MUXA2 <= 1'b1;
                    end

                    6'b001100:begin
                        MUXA1 <= 1'b0;
                        MUXA2 <= 1'b1;
                    end

                    6'b001101:begin
                        MUXA1 <= 1'b0;
                        MUXA2 <= 1'b1;
                    end

                    6'b001110:begin
                        MUXA1 <= 1'b0;
                        MUXA2 <= 1'b1;
                    end

                    6'b001111:begin
                        MUXA1 <= 1'b0;
                        MUXA2 <= 1'b1;
                    end

                    6'b010000:begin
                        MUXA1 <= 1'b0;
                        MUXA2 <= 1'b1;
                    end

                    6'b010001:begin
                        MUXA1 <= 1'b0;
                        MUXA2 <= 1'b0;
                    end

                    6'b010010:begin
                        MUXA1 <= 1'b1;
                        // MUXA2 <= 1'b1;
                    end

                    6'b010011:begin
                        MUXA1 <= 1'b1;
                        MUXA2 <= 1'b1;
                    end

                    6'b010100:begin
                        case(func)
                            6'b000000:begin
                                // MUXA1 <= 1'b0;
                                // MUXA2 <= 1'b1;
                            end
                        endcase
                    end

                    6'b010101:begin
                        case(func)
                            default:begin
                                MUXA1 <= 1'b0;
                                // MUXA2 <= 1'b1;
                            end
                        endcase
                    end

                    6'b010110:begin
                        case(func)
                            6'b000000:begin
                                MUXA1 <= 1'b1;
                                // MUXA2 <= 1'b1;
                            end
                        endcase
                    end

                    6'b010111:begin
                        case(func)
                            6'b000000:begin
                                MUXA1 <= 1'b1;
                                MUXA2 <= 1'b1;
                            end
                        endcase
                    end

                    6'b011000:begin
                        case(func)
                            6'b000000:begin
                                
                            end
                        endcase
                    end

                    6'b011001:begin
                        case(func)
                            6'b000000:begin
                            end
                        endcase
                    end
                endcase
                state <= state+4'd1;
            end

            4:begin
                case(opcode)
                    6'b000000:begin
                        case(func)
                        6'b000000:begin
                            ALUop <= 4'b0000;
                        end
                        6'b000001:begin
                            ALUop <= 4'b0001;
                        end
                        endcase
                    end

                    6'b000001:begin
                        case(func)
                        6'b000000:begin
                            ALUop <= 4'b0101;
                        end
                        6'b000001:begin
                            ALUop <= 4'b0111;
                        end
                        6'b000010:begin
                            ALUop <= 4'b1000;
                        end
                        endcase
                    end

                    6'b000010:begin
                        case(func)
                        6'b000000:begin
                            ALUop <= 4'b0110;
                        end
                        endcase
                    end

                    6'b000011:begin
                        case(func)
                        6'b000000:begin
                            ALUop <= 4'b0011;
                        end
                        6'b000001:begin
                            ALUop <= 4'b1001;
                        end
                        6'b000010:begin
                            ALUop <= 4'b0100;
                        end
                        endcase
                    end

                    6'b000100:begin
                        ALUop <= 4'b0000;
                    end

                    6'b000101:begin
                        ALUop <= 4'b0001;
                    end

                    6'b000110:begin
                        ALUop <= 4'b0101;
                    end

                    6'b000111:begin
                        ALUop <= 4'b0111;
                    end

                    6'b001000:begin
                        ALUop <= 4'b1000;
                    end

                    6'b001001:begin
                        ALUop <= 4'b0110;
                    end

                    6'b001010:begin
                        ALUop <= 4'b0011;
                    end

                    6'b001011:begin
                        ALUop <= 4'b1001;
                    end

                    6'b001100:begin
                        ALUop <= 4'b0100;
                    end

                    6'b001101:begin
                        ALUop <= 4'b0000;
                    end

                    6'b001110:begin
                        ALUop <= 4'b0000;
                    end

                    6'b001111:begin
                        ALUop <= 4'b0000;
                    end

                    6'b010000:begin
                        ALUop <= 4'b0000;
                    end

                    6'b010001:begin
                        ALUop <= 4'b0000;
                    end

                    6'b010010:begin
                    end

                    6'b010011:begin
                        ALUop <= 4'b0000;
                    end

                    6'b010100:begin
                        case(func)
                            6'b000000:begin
                            end
                        endcase
                    end

                    6'b010101:begin
                        case(func)
                            default:begin
                                ALUop <= 4'b0010;
                            end
                        endcase
                    end

                    6'b010110:begin
                        case(func)
                            6'b000000:begin
                            end
                        endcase
                    end

                    6'b010111:begin
                        case(func)
                            6'b000000:begin
                                ALUop <= 4'b0000;
                            end
                        endcase
                    end

                    6'b011000:begin
                        case(func)
                            6'b000000:begin
                            end
                        endcase
                    end

                    6'b011001:begin
                        case(func)
                            6'b000000:begin
                            end
                        endcase
                    end
                endcase
                state <= state + 4'd1;
            end

            5:begin
                case(opcode)
                    6'b000000:begin
                        case(func)
                        6'b000000:begin
                            MUXWB <= 1'b0;
                            RWMem <= 2'b00;
                        end
                        6'b000001:begin
                            MUXWB <= 1'b0;
                            RWMem <= 2'b00;
                        end
                        endcase
                    end

                    6'b000001:begin
                        case(func)
                        6'b000000:begin
                            MUXWB <= 1'b0;
                            RWMem <= 2'b00;
                        end
                        6'b000001:begin
                            MUXWB <= 1'b0;
                            RWMem <= 2'b00;
                        end
                        6'b000010:begin
                            MUXWB <= 1'b0;
                            RWMem <= 2'b00;
                        end
                        endcase
                    end

                    6'b000010:begin
                        case(func)
                        6'b000000:begin
                            MUXWB <= 1'b0;
                            RWMem <= 2'b00;
                        end
                        endcase
                    end

                    6'b000011:begin
                        case(func)
                        6'b000000:begin
                            MUXWB <= 1'b0;
                            RWMem <= 2'b00;
                        end
                        6'b000001:begin
                            MUXWB <= 1'b0;
                            RWMem <= 2'b00;
                        end
                        6'b000010:begin
                            MUXWB <= 1'b0;
                            RWMem <= 2'b00;
                        end
                        endcase
                    end

                    6'b000100:begin
                        MUXWB <= 1'b0;
                        RWMem <= 2'b00;
                    end

                    6'b000101:begin
                        MUXWB <= 1'b0;
                        RWMem <= 2'b00;
                    end

                    6'b000110:begin
                        MUXWB <= 1'b0;
                        RWMem <= 2'b00;
                    end

                    6'b000111:begin
                        MUXWB <= 1'b0;
                        RWMem <= 2'b00;
                    end

                    6'b001000:begin
                        MUXWB <= 1'b0;
                        RWMem <= 2'b00;
                    end

                    6'b001001:begin
                        MUXWB <= 1'b0;
                        RWMem <= 2'b00;
                    end

                    6'b001010:begin
                        MUXWB <= 1'b0;
                        RWMem <= 2'b00;
                    end

                    6'b001011:begin
                        MUXWB <= 1'b0;
                        RWMem <= 2'b00;
                    end

                    6'b001100:begin
                        MUXWB <= 1'b0;
                        RWMem <= 2'b00;
                    end

                    6'b001101:begin
                        MUXWB <= 1'b1;
                        RWMem <= 2'b10;
                    end

                    6'b001110:begin
                        // MUXWB <= 1'b0;
                        RWMem <= 2'b01;
                        MUXMemWrite <= 1'b0;
                    end

                    6'b001111:begin
                        // MUXWB <= 1'b0;
                        RWMem <= 2'b10;
                    end

                    6'b010000:begin
                        // MUXWB <= 1'b0;
                        RWMem <= 2'b01;
                        MUXMemWrite <= 1'b1;
                    end

                    6'b010001:begin
                        MUXWB <= 1'b0;
                        RWMem <= 2'b00;
                    end

                    6'b010010:begin
                        // MUXWB <= 1'b0;
                        RWMem <= 2'b01;
                        MUXMemWrite <= 1'b0;
                    end

                    6'b010011:begin
                        MUXWB <= 1'b1;
                        RWMem <= 2'b10;
                    end

                    6'b010100:begin
                        case(func)
                            6'b000000:begin
                                // MUXWB <= 1'b0;
                                RWMem <= 2'b00;
                            end
                        endcase
                    end

                    6'b010101:begin
                        case(func)
                            default:begin
                                // MUXWB <= 1'b0;
                                RWMem <= 2'b00;
                            end
                        endcase
                    end

                    6'b010110:begin
                        case(func)
                            6'b000000:begin
                                // MUXWB <= 1'b0;
                                RWMem <= 2'b01;
                                MUXMemWrite <= 1'b1;
                            end
                        endcase
                    end

                    6'b010111:begin
                        case(func)
                            6'b000000:begin
                                // MUXWB <= 1'b0;
                                RWMem <= 2'b10;
                            end
                        endcase
                    end

                    6'b011000:begin
                        case(func)
                            6'b000000:begin
                                // MUXWB <= 1'b0;
                                RWMem <= 2'b00;
                            end
                        endcase
                    end

                    6'b011001:begin
                        case(func)
                            6'b000000:begin
                                // MUXWB <= 1'b0;
                                RWMem <= 2'b00;
                            end
                        endcase
                    end
                endcase
                state <= state + 4'd1;
            end

            6:begin
                case(opcode)
                    6'b000000:begin
                        case(func)
                        6'b000000:begin
                            WReg <= 1'b1;
                        end
                        6'b000001:begin
                            WReg <= 1'b1;
                        end
                        endcase
                    end

                    6'b000001:begin
                        case(func)
                        6'b000000:begin
                            WReg <= 1'b1;
                        end
                        6'b000001:begin
                            WReg <= 1'b1;
                        end
                        6'b000010:begin
                            WReg <= 1'b1;
                        end
                        endcase
                    end

                    6'b000010:begin
                        case(func)
                        6'b000000:begin
                            WReg <= 1'b1;
                        end
                        endcase
                    end

                    6'b000011:begin
                        case(func)
                        6'b000000:begin
                            WReg <= 1'b1;
                        end
                        6'b000001:begin
                            WReg <= 1'b1;
                        end
                        6'b000010:begin
                            WReg <= 1'b1;
                        end
                        endcase
                    end

                    6'b000100:begin
                        WReg <= 1'b1;
                    end

                    6'b000101:begin
                        WReg <= 1'b1;
                    end

                    6'b000110:begin
                        WReg <= 1'b1;
                    end

                    6'b000111:begin
                        WReg <= 1'b1;
                    end

                    6'b001000:begin
                        WReg <= 1'b1;
                    end

                    6'b001001:begin
                        WReg <= 1'b1;
                    end

                    6'b001010:begin
                        WReg <= 1'b1;
                    end

                    6'b001011:begin
                        WReg <= 1'b1;
                    end

                    6'b001100:begin
                        WReg <= 1'b1;
                    end

                    6'b001101:begin
                        WReg <= 1'b1;
                    end

                    6'b001110:begin
                        WReg <= 1'b0;
                    end

                    6'b001111:begin
                        WReg <= 1'b0;
                    end

                    6'b010000:begin
                        WReg <= 1'b0;
                    end

                    6'b010001:begin
                        WReg <= 1'b1;
                    end

                    6'b010010:begin
                        WReg <= 1'b0;
                    end

                    6'b010011:begin
                        WReg <= 1'b1;
                    end

                    6'b010100:begin
                        case(func)
                            6'b000000:begin
                                WReg <= 1'b0;
                            end
                        endcase
                    end

                    6'b010101:begin
                        case(func)
                            default:begin
                                WReg <= 1'b0;
                            end
                        endcase
                    end

                    6'b010110:begin
                        case(func)
                            6'b000000:begin
                                WReg <= 1'b0;
                            end
                        endcase
                    end

                    6'b010111:begin
                        case(func)
                            6'b000000:begin
                                WReg <= 1'b0;
                            end
                        endcase
                    end

                    6'b011000:begin
                        case(func)
                            6'b000000:begin
                                WReg <= 1'b0;
                            end
                        endcase
                    end

                    6'b011001:begin
                        case(func)
                            6'b000000:begin
                                WReg <= 1'b0;
                            end
                        endcase
                    end
                endcase
                state <= 4'd15;
            end

            15:begin
                updatePC <= 1'b1;
                Readreg <= 2'b00;
                ALUop <= 4'b0000;
                MUXA1 <= 1'b0;
                MUXA2 <= 1'b0;
                WReg <= 1'b0;
                MUXWB <= 1'b0;
                RWMem <= 2'b00;
                LoadSP <= 2'b00;
                MUXMemWrite <= 1'b0;
                branch <= 3'b000;
                state <= 4'd0;
            end
        endcase
    end
endmodule