`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2026 04:39:08 PM
// Design Name: 
// Module Name: alu_8bit_v
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_8bit_v(
    input a,
    input b,
    input opcode,
    output reg out,
    output reg cf,
    output reg vf
    );
    
//    localparam zero = 0;
//    localparam one = 1;
//    localparam two = 2;
//    localparam three = 3;
//    localparam four = 4;
//    localparam five = 5;
//    localparam six = 6;
//    localparam seven = 7;
    always @(*) begin
        case(opcode)
        1 : begin
            {cf,out} <= a + b;
        end
        2 : begin
            {cf,out} <= a - b;
        end
        3 : begin
            {cf,out} <= a * b;
        end
        4 : begin
            if(b == 0) begin
                out <= 8'hff;
                vf <= 1;
            end
            else begin
                out <= a/b;
            end
        end  
        5 : begin
            out <= ((a % b) + b) % b;
        end  
        6 : begin
            out <= a % b;
        end  
        7 : begin
            out <= ~a;
        end
        8 : begin
            out <= a & b;
        end 
        9 : begin
            
        end  
        4 : begin
        
        end  
        4 : begin
        
        end
        4 : begin
        
        end 
        4 : begin
        
        end  
        4 : begin
        
        end  
        4 : begin
        
        end
        4 : begin
        
        end
        default : begin
        
        end
        
        endcase
    end
endmodule
