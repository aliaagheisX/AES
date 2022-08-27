module wrapper(clk,led1, led2, led3,reset,enable);
input clk,reset,enable;
wire decReset1;
wire decReset2;
wire decReset3;
reg [127:0]in=128'h00112233445566778899aabbccddeeff;
/* reg [127:0] key1=128'h000102030405060708090a0b0c0d0e0f;
reg[191:0]key2=192'h000102030405060708090a0b0c0d0e0f1011121314151617;
reg[255:0]key3=256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f; */
wire [127:0]out1,out2,out3,out_inv1,out_inv2,out_inv3;
output wire led1,led2,led3;
assign led1 = out_inv1==in ? 1'b1 : 1'b0;
assign led2 = out_inv2==in;
assign led3 = out_inv3==in;
enchiper#(.Nk(4)) p1(.enable(enable), .decReset(decReset1),.reset(reset),.clk(clk),.load(in),.out(out1),.key(128'h000102030405060708090a0b0c0d0e0f));
dechiper#(.Nk(4)) p2(.decReset(decReset1),.clk(clk),.in(out1),.out(out_inv1),.key(128'h000102030405060708090a0b0c0d0e0f));

enchiper#(.Nk(6)) p3(.enable(enable),.decReset(decReset2),.reset(reset),.clk(clk),.load(in),.out(out2),.key(192'h000102030405060708090a0b0c0d0e0f1011121314151617));
dechiper#(.Nk(6)) p4(.decReset(decReset2),.clk(clk),.in(out2),.out(out_inv2),.key(192'h000102030405060708090a0b0c0d0e0f1011121314151617));

enchiper#(.Nk(8)) p5(.enable(enable),.decReset(decReset3),.reset(reset),.clk(clk),.load(in),.out(out3),.key(256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f));
dechiper#(.Nk(8)) p6(.decReset(decReset3),.clk(clk),.in(out3),.out(out_inv3),.key(256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f));
always @(reset or enable or led1 or led2 or led3) begin
    if(reset & !led1 & !led2 & !led3) $display("Reset Working...");
    else if(enable & !led1 & !led2 & !led3) $display("Enable Working...");
    else if(led1 & led2 & led3) $display("Done Sucessefully...");
    else  $display("Waiting...");
end
endmodule