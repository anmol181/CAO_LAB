`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 05:09:25 PM
// Design Name: 
// Module Name: alu_nbit_tb
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


module alu_nbit_tb();

parameter N = 6;

reg [N-1:0] a;
reg [N-1:0] b;
reg [3:0] opcode;
wire [(2*N)-1:0] out;
wire cf;
wire vf;

alu_8bit #(.N(N)) dut (
    .a(a),
    .b(b),
    .opcode(opcode),
    .out(out),
    .cf(cf),
    .vf(vf)
);

initial begin

    a = 0;
    b = 0;
    opcode = 0;

    #10;

    a = 15;
    b = 10;
    opcode = 0; // Addition
    #10;

    a = 15;
    b = 10;
    opcode = 1; // Subtraction
    #10;

    a = 15;
    b = 10;
    opcode = 2; // Multiplication
    #10;

    a = 15;
    b = 0;
    opcode = 3; // Division by zero
    #10;

    a = 15;
    b = 5;
    opcode = 3; // Division
    #10;

    a = 15;
    b = 4;
    opcode = 4; // Modulus
    #10;

    a = 15;
    b = 4;
    opcode = 5; // Modulus
    #10;

    a = 15;
    b = 10;
    opcode = 6; // Bitwise NOT
    #10;

    a = 15;
    b = 10;
    opcode = 7; // Bitwise AND
    #10;

    a = 15;
    b = 10;
    opcode = 8; // Bitwise XOR
    #10;

    a = 15;
    b = 2;
    opcode = 9; // Right Shift
    #10;

    a = 15;
    b = 2;
    opcode = 10; // Left Shift
    #10;

    a = 15;
    b = 0;
    opcode = 11; // Rotate Right
    #10;

    a = 15;
    b = 0;
    opcode = 12; // Rotate Left
    #10;

    a = 2;
    b = 0;
    opcode = 13; // Cube
    #10;

    a = 5;
    b = 0;
    opcode = 13; // Cube
    #10;

    a = 5;
    b = 2;
    opcode = 14; // Custom operation
    #10;

    a = 15;
    b = 10;
    opcode = 15; // Invalid operation
    #10;

    $finish;
end

endmodule
