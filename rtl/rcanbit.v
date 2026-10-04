`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 04:46:18 PM
// Design Name: 
// Module Name: rcanbit
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


module rcanbit#(
    parameter N = 4
)(
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire         cin,
    output wire [N-1:0] sum,
    output wire        cout
    );
    
    wire [N-1:0] c;
    
    generate
    
        genvar i;
    
        for(i = 0;i < N;i = i + 1) begin : full_adder
            fa adder (.a(a[i]), .b(b[i]), .cin(c[i]), .sum(sum[i]), .cout(c[i+1]));
        end
    
    endgenerate
    
    assign c[0] = cin;
    assign cout = c[N-1];

endmodule
