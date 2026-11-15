`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2026 07:14:16 PM
// Design Name: 
// Module Name: u24ev052_assignment_cnt10_tb
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


module u24ev052_assignment_cnt10_tb();

    reg clk;
    reg rst;
    wire [5:0] count;

    u24ev052_assignment_cnt10 dut (
        .clk(clk),
        .rst(rst),
        .op(count)
    );

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        rst = 1;
        #10 rst = 0;

        #300 $finish;
    end
endmodule
