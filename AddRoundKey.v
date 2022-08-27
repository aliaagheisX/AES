module AddRoundKey(state,key, out);
parameter NK=4;
parameter round=0;
/* access it with:
1- defparam "module instance name".NK= value
2- AddRoundKey #(value) "instance name"(ports)
*/
input [4*(NK+7)*32-1:0] key;
input [127:0]state;
output wire [127:0] out;

assign out[127:120]=state[127:120]^key[(4*(NK+7)*32-1)-(round*128):4*(NK+7)*32-1-(round*128)-7];
assign out[119:112]=state[119:112]^key[(4*(NK+7)*32-1)-(round*128)-8:4*(NK+7)*32-1-(round*128)-15];
assign out[111:104]=state[111:104]^key[(4*(NK+7)*32-1)-(round*128)-16:4*(NK+7)*32-1-(round*128)-23];
assign out[103:96]=state[103:96]^key[(4*(NK+7)*32-1)-(round*128)-24:4*(NK+7)*32-1-(round*128)-31];

assign out[95:88]=state[95:88]^key[(4*(NK+7)*32-1)-(round*128)-32:4*(NK+7)*32-1-(round*128)-39];
assign out[87:80]=state[87:80]^key[(4*(NK+7)*32-1)-(round*128)-40:4*(NK+7)*32-1-(round*128)-47];
assign out[79:72]=state[79:72]^key[(4*(NK+7)*32-1)-(round*128)-48:4*(NK+7)*32-1-(round*128)-55];
assign out[71:64]=state[71:64]^key[(4*(NK+7)*32-1)-(round*128)-56:4*(NK+7)*32-1-(round*128)-63];

assign out[63:56]=state[63:56]^key[(4*(NK+7)*32-1)-(round*128)-64:4*(NK+7)*32-1-(round*128)-71];
assign out[55:48]=state[55:48]^key[(4*(NK+7)*32-1)-(round*128)-72:4*(NK+7)*32-1-(round*128)-79];
assign out[47:40]=state[47:40]^key[(4*(NK+7)*32-1)-(round*128)-80:4*(NK+7)*32-1-(round*128)-87];
assign out[39:32]=state[39:32]^key[(4*(NK+7)*32-1)-(round*128)-88:4*(NK+7)*32-1-(round*128)-95];

assign out[31:24]=state[31:24]^key[(4*(NK+7)*32-1)-(round*128)-96:4*(NK+7)*32-1-(round*128)-103];
assign out[23:16]=state[23:16]^key[(4*(NK+7)*32-1)-(round*128)-104:4*(NK+7)*32-1-(round*128)-111];
assign out[15:8]=state[15:8]^key[(4*(NK+7)*32-1)-(round*128)-112:4*(NK+7)*32-1-(round*128)-119];
assign out[7:0]=state[7:0]^key[(4*(NK+7)*32-1)-(round*128)-120:4*(NK+7)*32-1-(round*128)-127];

endmodule