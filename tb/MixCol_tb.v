module MixColTest();

reg clk;

reg [127:0]A;
wire [127:0]B;
wire [127:0]A_test;

MixCol uut(.ip(A),.op(B));
InvMixCol uutINV(clk, B, A_test);

initial begin

clk = 0;
A = 128'h0;

#5 A = 128'hd4_bf_5d_30_e0_b4_52_ae_b8_41_11_f1_1e_27_98_e5;


#5 A = 128'h84e1dd691a41d76f792d389783fbac70;

#5 A = 128'h1fb5430ef0accf64aa370cde3d77792c;

end 
always #2 clk = ~clk;

always @(A_test) $display("A = %h B = %h ATest = %h",A, B, A_test);
endmodule 