module mx (
input [31:0] in,
output [31:0] out
);


wire [7:0]s0;
wire [7:0]s1;
wire [7:0]s2;
wire [7:0]s3;
wire [7:0]q0;
wire [7:0]q1;
wire [7:0]q2;
wire [7:0]q3;


assign s3 = in[7:0];
assign s2 = in[15:8];
assign s1 = in[23:16];
assign s0 = in[31:24];

assign q0 = (s0[7]==1'b1)?((s0<<1)^(8'h1b)):(s0<<1);
assign q1 = (s1[7]==1'b1)?((s1<<1)^(8'h1b)):(s1<<1);
assign q2 = (s2[7]==1'b1)?((s2<<1)^(8'h1b)):(s2<<1);
assign q3 = (s3[7]==1'b1)?((s3<<1)^(8'h1b)):(s3<<1);

assign out[7:0] = q3^s2^s1^s0^q0 ;
assign out[15:8] = q2^s1^s0^s3^q3 ;
assign out[23:16] = q1^s0^s3^q2^s2;
assign out[31:24] = q0^s3^s2^s1^q1;

endmodule 

 