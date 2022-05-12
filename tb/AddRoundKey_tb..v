module AddRoundKey_tb;
reg [4*11*32-1:0] key;
reg clk;
reg [127:0]state;
wire [127:0] out;
initial begin
clk=0;
state[127:120]=8'h04;
state[119:112]=8'h66;
state[111:104]=8'h81;
state[103:96]=8'hE5;

state[95:88]=8'hE0;
state[87:80]=8'hCB;
state[79:72]=8'h19;
state[71:64]=8'h9A;

state[63:56]=8'h48;
state[55:48]=8'hF8;
state[47:40]=8'hD3;
state[39:32]=8'h7A;

state[31:24]=8'h28;
state[23:16]=8'h06;
state[15:8]=8'h26;
state[7:0]=8'h4C;

key[1407:1400]=8'hA0;
key[1399:1392]=8'hFA;
key[1391:1384]=8'hFE;
key[1383:1376]=8'h17;

key[1375:1368]=8'h88;
key[1367:1360]=8'h54;
key[1359:1352]=8'h2C;
key[1351:1344]=8'hB1;

key[1343:1336]=8'h23;
key[1335:1328]=8'hA3;
key[1327:1320]=8'h39;
key[1319:1312]=8'h39;

key[1311:1304]=8'h2A;
key[1303:1296]=8'h6C;
key[1295:1288]=8'h76;
key[1287:1280]=8'h05;
key[1279:0]=1280'd0;
end
AddRoundKey uut(.key(key),.clk(clk),.state(state),.out(out));
defparam uut.round=1;
defparam uut.NK=4;
always
begin
#40 clk=~clk;
end
endmodule