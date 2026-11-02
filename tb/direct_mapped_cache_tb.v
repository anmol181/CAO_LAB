module direct_mapped_cache_tb;
    reg clk;
    reg[7:0] addr;
    wire[7:0] out;
    direct_mapped_cache cache1(addr,clk,out);
    initial begin
        clk = 1'b1;
        #49;
        addr = 8'h02;
        #20;
        addr = 8'h03;
        #20;
        addr = 8'h04;
        #20;
        addr = 8'h0A;
        #20;
        addr = 8'h1A;
        #20;
        addr = 8'h02;
        #20;
        addr = 8'h04;
        #20;
        addr = 8'h05;
        #20;
        addr = 8'h03;
        #20;
        $finish();
    end
    always #5 clk = ~clk;
endmodule