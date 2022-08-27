module Inv_round
(
data, //state
key,//key
rndout//output
);

input[127:0]data;
input [127:0] key;
output wire [127:0]rndout;

wire [127:0] isb,isr,ik_add;

INV_Shift_Rows p5(.in(data),.out(isr));
sub_bytes_inv p6 (.in(isr),.out(isb));
assign ik_add = key ^ isb;
InvMixCol p7 (.data_in(ik_add),.data_out(rndout));

endmodule