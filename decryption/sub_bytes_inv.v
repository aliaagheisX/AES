module sub_bytes_inv (in, out);
input [127:0] in;
output wire [127:0] out;

aes_sbox_inv w0(in[127-:32], out[127-:32]);
aes_sbox_inv w1(in[95-:32], out[95-:32]);
aes_sbox_inv w2(in[63-:32], out[63-:32]);
aes_sbox_inv w3(in[31-:32], out[31-:32]);


endmodule