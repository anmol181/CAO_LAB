`timescale 1ns / 1ps

module hardwired_cu_tb();

    // Inputs
    reg clk;
    reg rst;
    reg [3:0] ir_out;
    reg mfc;

    // Outputs
    wire pc_in;
    wire pc_out;
    wire pc_inc;
    wire mar_in;
    wire mdr_ine;
    wire mdr_out;
    wire ir_in;
    wire aout;
    wire bout;
    wire yin;
    wire [3:0] opcode;
    wire End_flag;

    hardwired_cu dut (
        .clk(clk),
        .rst(rst),
        .ir_out(ir_out),
        .mfc(mfc),
        .pc_in(pc_in),
        .pc_out(pc_out),
        .pc_inc(pc_inc),
        .mar_in(mar_in),
        .mdr_ine(mdr_ine),
        .mdr_out(mdr_out),
        .ir_in(ir_in),
        .aout(aout),
        .bout(bout),
        .yin(yin),
        .opcode(opcode),
        .End(End_flag) 
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin

        rst = 1;
        ir_out = 4'b0000;
        mfc = 0;


        #20;
        rst = 0;




        #15;              
        ir_out = 4'b1010; 
        mfc = 1;          
        #10;
        mfc = 0;
        #30;              




        ir_out = 4'b0101;
        #40;              
        mfc = 1;          
        #10;
        mfc = 0;
        #30;




        ir_out = 4'b1111;
        #15;              
        mfc = 1;          
        #5;               
        rst = 1;          
        #10;
        rst = 0;          
        mfc = 0;
        #15;              




        ir_out = 4'b0011;
        mfc = 1;
        #10;
        mfc = 0;
        #30;




        ir_out = 4'b1001;
        #100;             
        mfc = 1;
        #10;
        mfc = 0;
        #30;              




        ir_out = 4'b0110;
        #10;              
        mfc = 1;
        #10;              
        rst = 1;          
        #10;
        rst = 0;          
        mfc = 0;
        #10;




        ir_out = 4'b1100;
        #10;              
        mfc = 1;
        #10;              
        mfc = 0;
        #10;              
        rst = 1;          
        #10;
        rst = 0;




        ir_out = 4'b1000;
        mfc = 1;          
        #40;              
        mfc = 0;




        #10;
        ir_out = 4'b0000; 
        #10;              
        mfc = 1;
        #10;
        mfc = 0;
        #30;





        ir_out = 4'b0001; #10; mfc = 1; #10; mfc = 0; #30;

        ir_out = 4'b0010; #10; mfc = 1; #10; mfc = 0; #30;

        ir_out = 4'b0100; #10; mfc = 1; #10; mfc = 0; #30;

        ir_out = 4'b0111; #10; mfc = 1; #10; mfc = 0; #30;

        ir_out = 4'b1011; #10; mfc = 1; #10; mfc = 0; #30;

        ir_out = 4'b1101; #10; mfc = 1; #10; mfc = 0; #30;

        ir_out = 4'b1110; #10; mfc = 1; #10; mfc = 0; #30;


        #40;
        $finish;
    end

endmodule