`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2026 07:07:48 PM
// Design Name: 
// Module Name: u24ev052_assignment_cnt10
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


module u24ev052_assignment_cnt10(
    input clk,
    input rst,
    output reg [5:0] op
    );

    always @(posedge clk) begin
        if(rst || op == 6'b111101) begin
            op <= 6'b110100;
        end
        else begin
            op <= op + 1;
        end
    end
endmodule
