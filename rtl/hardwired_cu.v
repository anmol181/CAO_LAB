`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2026 04:52:31 PM
// Design Name: 
// Module Name: hardwired_cu
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


module hardwired_cu(
    input clk,
    input rst,
    input [3:0] ir_out,
    input mfc,
    output reg pc_in,
    output reg pc_out,
    output reg pc_inc,
    output reg mar_in,
    output reg mdr_ine,
    output reg mdr_out,
    output reg ir_in,
    output reg aout,
    output reg bout,
    output reg yin,
    output reg [3:0] opcode,
    output reg End
    );
    
    reg [1:0] state;
    parameter st0 = 0;
    parameter st1 = 1;
    parameter st2 = 2;
    parameter st3 = 3;
    
    always @(posedge clk) begin
        if(rst) begin
            state <= st0;
        end
        else begin
            case(state)
            st0 : begin
                state <= st1;
            end
            st1 : begin
                state <= mfc ? st2 : st1;
            end
            st2 : begin
                state <= st3;
            end
            st3 : begin
                state <= st0;
            end
            default : begin
                state <= st0;
            end
            endcase
        end
    end
    
    always @(*) begin
        case(state)
        st0 : begin
            pc_out = 1;
            mar_in = 1;
            pc_inc = 1;
        end
        st1 : begin
            mdr_ine = 1;
            pc_in = 1;
        end
        st2 : begin
            mdr_out = 1;
            ir_in = 1;
        end
        st3 : begin
            aout = 1;
            bout = 1;
            opcode = ir_out;
            yin = 1;
            End = 1;
        end
        default : begin
            pc_out = 0;
            mar_in = 0;
            pc_inc = 0;
            mdr_ine = 0;
            pc_in = 0;
            mdr_out = 0;
            ir_in = 0;
            aout = 0;
            bout = 0;
            opcode = 0;
            yin = 0;
            End = 0;
        end
        endcase
    end
endmodule
