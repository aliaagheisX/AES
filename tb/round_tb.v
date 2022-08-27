module round_tb (
);
reg clk;

wire [127:0] out;
wire [4*(4+7)*32-1:0] key;

Key_Expansion #(.Nk(4)) t_128(clk, 128'h000102030405060708090a0b0c0d0e0f, key);
round #(.rc(1)) r1 (.clk(clk),.data(128'h00102030405060708090a0b0c0d0e0f0),.key(Key),.rndout(out));


always #5 clk = ~clk;


initial 
begin
clk = 1;
end



endmodule