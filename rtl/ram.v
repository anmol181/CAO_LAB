module ram(
    input[7:0] addr,
    input clk,
    output[7:0] out
);
    reg[7:0] RAM[0:255];
    assign out = RAM[addr];
    integer i;
    initial begin
        for(i=0;i<256;i=i+1) begin
            RAM[i] = i+127;
        end
    end
endmodule