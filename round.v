module round 
(
in, //state
key_sch,//key
out//output
);

input[127:0]in;
input [127:0] key_sch;
output wire [127:0]out;

wire [127:0] sb,sr,mcl;

sub_bytes p2 (.in(in),.out(sb));
Shift_Rows p3 (.in(sb),.out(sr));
MixCol p4 (.ip(sr),.op(mcl));

assign out = mcl ^ key_sch;

endmodule