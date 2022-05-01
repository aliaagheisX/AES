module mxTest();

reg [31:0]A;
wire [31:0]B;

mx uut(.in(A),.out(B));

initial 

begin 

A = 32'h876e46a6;

# 10 A = 32'h 84e1dd69;

#15 A = 32'h 1fb5430e;

$monitor("%h",B);

end
endmodule 