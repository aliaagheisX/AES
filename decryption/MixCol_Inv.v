module InvMixCol (data_in,data_out);

input [127:0] data_in;
output wire [127:0] data_out;

Inv_mx m0(data_in[127-:32],data_out[127-:32]);
Inv_mx m1(data_in[95-:32],data_out[95-:32]);
Inv_mx m2(data_in[63-:32],data_out[63-:32]);
Inv_mx m3(data_in[31-:32],data_out[31-:32]);


endmodule