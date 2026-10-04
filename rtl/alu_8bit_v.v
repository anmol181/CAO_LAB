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


module alu_8bit_v #(
    parameter N = 8
)(
    input wire  [N-1:0] a,
    input wire  [N-1:0] b,
    input [3:0] opcode,
    output reg  [(2*N)-1:0] out,
    output wire cf,
    output reg  vf
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
        vf <= 0;
        case(opcode)
        0 : begin
            out <= a + b;
        end
        1 : begin
            out <= a - b;
        end
        2 : begin
            out <= a * b;
        end
        3 : begin
            if(b == 0) begin
                out <= {N{1'b1}};
                vf <= 1;
            end
            else begin
                out <= a/b;
            end
        end  
        4 : begin
            out <= ((a % b) + b) % b;
        end  
        5 : begin
            out <= a % b;
        end  
        6 : begin
            out <= ~a;
        end
        7 : begin
            out <= a & b;
        end 
        8 : begin
            out <= a ^ b;
        end  
        9 : begin
            out <= a >> b;
        end  
        10 : begin
            out <= a << b;
        end
        11 : begin
            out <= {a[0],a[N-1:1]};
        end 
        12 : begin
            out <= {a[N-2:0],a[N-1]};
        end  
        13 : begin
            if ( a >= 32 ) begin
                out <= {N{1'b1}};
                vf <= 1;
            end else if( a < -32 ) begin
                out <= {N{1'b1}};
                vf <= 1;
            end else begin
                out <= a*a*a;
            end
        end  
        14 : begin
            out <= a*a - b/2;
        end
        15 : begin
            out <= b*b - (a%b);
        end
        default : begin
            out <= {N{1'b0}};
        end
        
        endcase
    end
    assign cf = (opcode == 0 || opcode == 1) && out[N];
endmodule
