module direct_mapped_cache(
    input[7:0] addr,
    input clk,
    output[7:0] out
);
integer i;
reg[7:0] data_mem[0:7];
reg[2:0] block;
reg[4:0] tag[0:7];
reg hit;
reg[7:0] op, ram_out_reg;
wire[7:0] ram_out;

ram ram1(
    .addr(addr),
    .clk(clk),
    .out(ram_out)
);
always @(*) begin
    block = addr[2:0];
    ram_out_reg = ram_out;
end
assign out = op;
always @(posedge clk) begin
    if (tag[block] == addr[7:3]) begin
        op = data_mem[block];
        hit = 1;
    end
    else
    begin
        op = ram_out_reg;
        data_mem[block] = ram_out_reg;
        tag[block] = addr[7:3];
        hit = 0;
    end
end
endmodule