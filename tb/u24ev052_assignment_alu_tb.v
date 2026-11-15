`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2026 07:14:16 PM
// Design Name: 
// Module Name: u24ev052_assignment_alu_tb
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


module u24ev052_assignment_alu_tb();

    reg [2:0] opcode;
    reg [7:0] a;
    reg [7:0] b;
    wire [15:0] op;

    u24ev052_assignment_alu dut (
        .opcode(opcode),
        .a(a),
        .b(b),
        .op(op)
    );

    integer i;

    initial begin
        a = 8'd52; b = 8'd30;
        for (i = 0; i < 8; i = i + 1) begin
            opcode = i;
            #10;
        end
        #50 $finish;
    end
endmodule
