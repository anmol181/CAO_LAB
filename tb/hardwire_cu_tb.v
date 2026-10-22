`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2026 05:31:50 PM
// Design Name: 
// Module Name: hardwire_cu_tb
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


module hardwired_cu_tb( );

reg [3:0] ir_out;
reg mfc;
reg clk;
reg rst;

dut hardwired_cu(
    .clk(clk),
    .rst(rst),
    .ir_out(ir_out),
    .pc_in(pc_in),
    .pc_out(pc_out),
    .pc_inc(pc_inc),
    .mar_in(

initial begin

    clk = 0;
    forever #5 clk = ~clk;

end

initial begin

end
endmodule
