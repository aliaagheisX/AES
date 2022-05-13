module AddRoundKey_tb;
reg [4*11*32-1:0] key;
reg clk;
reg [127:0]state0;
reg [127:0]state1;
reg [127:0]state2;
reg [127:0]state3;
reg [127:0]state4;
reg [127:0]state5;
reg [127:0]state6;
reg [127:0]state7;
reg [127:0]state8;
reg [127:0]state9;
reg [127:0]state10;

wire [127:0] out0;
wire [127:0] out1;
wire [127:0] out2;
wire [127:0] out3;
wire [127:0] out4;
wire [127:0] out5;
wire [127:0] out6;
wire [127:0] out7;
wire [127:0] out8;
wire [127:0] out9;
wire [127:0] out10;

initial begin
clk=0;
state0=128'h54776f204f6e65204e696e652054776f;

state1=128'hba75f47a84a48d32e88d060e1b407d5d;

state2=128'h15ce8965c94d71477f4bbe979dc288cd;

state3=128'haa163db3650cc14bfa05de5a883a2a0a;

state4=128'h10d85324bc94ea40d3e09e73f3e0257b;

state5=128'h2a781b5b261ea7628f0c6f00e97a0a3f;

state6=128'ha9aee7f037d86cfdaa0cb167f2219c3b;

state7=128'h9faf634b37ec39fb518c04b137fa66d7;

state8=128'he874d3558a751f8a4bee750cf5e65838;

state9=128'hb68434e8e78860d7519866708ccafb51;

state10=128'h013e8ea73ab004bc8ce23d4d2133b81c;

key=1408'h5468617473206D79204B756E67204675E232FCF191129188B159E4E6D679A29356082007C71AB18F76435569A03AF7FAD2600DE7157ABC686339E901C3031EFBA11202C9B468BEA1D75157A01452495BB1293B3305418592D210D232C6429B69BD3DC2B7B87C47156A6C9527AC2E0E4ECC96ED1674EAAA031E863F24B2A8316A8E51EF21FABB4522E43D7A0656954B6CBFE2BF904559FAB2A16480B4F7F1CBD828FDDEF86DA4244ACCC0A4FE3B316F26;

end
AddRoundKey uut0(.key(key),.clk(clk),.state(state0),.out(out0));
defparam uut0.round=0;
defparam uut0.NK=4;

AddRoundKey uut1(.key(key),.clk(clk),.state(state1),.out(out1));
defparam uut1.round=1;
defparam uut1.NK=4;

AddRoundKey uut2(.key(key),.clk(clk),.state(state2),.out(out2));
defparam uut2.round=2;
defparam uut2.NK=4;

AddRoundKey uut3(.key(key),.clk(clk),.state(state3),.out(out3));
defparam uut3.round=3;
defparam uut3.NK=4;

AddRoundKey uut4(.key(key),.clk(clk),.state(state4),.out(out4));
defparam uut4.round=4;
defparam uut4.NK=4;

AddRoundKey uut5(.key(key),.clk(clk),.state(state5),.out(out5));
defparam uut5.round=5;
defparam uut5.NK=4;


AddRoundKey uut6(.key(key),.clk(clk),.state(state6),.out(out6));
defparam uut6.round=6;
defparam uut6.NK=4;

AddRoundKey uut7(.key(key),.clk(clk),.state(state7),.out(out7));
defparam uut7.round=7;
defparam uut7.NK=4;

AddRoundKey uut8(.key(key),.clk(clk),.state(state8),.out(out8));
defparam uut8.round=8;
defparam uut8.NK=4;

AddRoundKey uut9(.key(key),.clk(clk),.state(state9),.out(out9));
defparam uut9.round=9;
defparam uut9.NK=4;

AddRoundKey uut10(.key(key),.clk(clk),.state(state10),.out(out10));
defparam uut10.round=10;
defparam uut10.NK=4;
always
begin
#40 clk=~clk;
end
endmodule