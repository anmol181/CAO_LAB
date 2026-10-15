`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 05:05:11 PM
// Design Name: 
// Module Name: binary_to_bcd
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


module binary_to_bcd(
    input [11:0] ip,
    output [15:0] op
    );
    
    wire [5:0] w1,w2,w3,w4;
    
    assign w1 = ip[3:0] > 9 ? ip[3:0] + 6 : ip[3:0];
    assign w2 = ip[7:4]+w1[5:4] > 9 ? ip[7:4]+w1[5:4] + 6 : ip[7:4]+w1[5:4];
    assign w3 = ip[11:8]+w2[5:4] > 9 ? ip[11:8]+w2[5:4] + 6 : ip[11:8]+w2[5:4];
    assign w4 = w3[5:4];
    
    assign op = {w4[3:0],w3[3:0],w2[3:0],w1[3:0]};
endmodule
