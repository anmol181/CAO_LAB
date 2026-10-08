`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 05:13:11 PM
// Design Name: 
// Module Name: rcanbit_tb
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


module rcanbit_tb();

parameter N = 4;

reg [N-1:0] a;
reg [N-1:0] b;
reg cin;

wire [N-1:0] sum;
wire cout;

rcanbit rca0 (
.a(a),
.b(b),
.cin(cin),
.cout(cout),
.sum(sum)
);

integer i,j,k;

initial begin

    for (i = 0;i < 2**N;i = i + 1) begin
        for (j = 0;j < 2**N;j = j + 1) begin
            for (k = 0;k < 2;k = k + 1) begin 
            a <= i;
            b <= j;
            cin <= k;
            #5;
            end
        end
    end

end

endmodule
