`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2026 07:07:48 PM
// Design Name: 
// Module Name: u24ev052_assignment_alu
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


module u24ev052_assignment_alu(
    input [2:0]opcode,
    input [7:0] a,
    input [7:0] b,
    output [15:0] op
    );

    reg [15:0] result;
    always @(*) begin
        case(opcode)
            3'b000: begin
                result = a + b + 100;
            end
            3'b001: begin
                result = (3*a) - b;
            end
            3'b010: begin
                result = 2*a*b;
            end
            3'b011: begin
                if(b == 0) begin
                    result = 16'hffff;
                end else begin
                    result = (2*a) / b;
                end
            end
            3'b100: begin
                result = {8'b0, {a, a} >> b[2:0]};
            end
            3'b101: begin
                result = (a | b | 16'h19);
            end
            3'b110: begin
                result = ~(a ^ b);
            end
            3'b111: begin
                result = a;
            end
            default: begin
                result = 16'b0;
            end
        endcase
    end

    assign op = result;
endmodule