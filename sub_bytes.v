module sub_bytes (clk, in, out);
input clk;
input [127:0] in;
output reg [127:0] out;

wire [127:0] temp;

aes_sbox w0(in[127-:32], out[127-:32]);
aes_sbox w1(in[95-:32], out[95-:32]);
aes_sbox w2(in[63-:32], out[63-:32]);
aes_sbox w3(in[31-:32], out[31-:32]);

always @(posedge clk) begin
    out <= temp;
end
endmodule