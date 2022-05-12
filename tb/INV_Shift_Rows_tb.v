module INV_Shift_Rows_tb;
reg [127:0]in;
reg clk=1'b0;
wire [127:0]out;
initial 
begin

in[127:120]<=8'hD4;
in[119:112]<=8'hBF;
in[111:104]<=8'h5D;
in[103:96]<=8'h30;

in[95:88]<=8'hE0;
in[87:80]<=8'hB4;
in[79:72]<=8'h52;
in[71:64]<=8'hAE;

in[63:56]<=8'hB8;
in[55:48]<=8'h41;
in[47:40]<=8'h11;
in[39:32]<=8'hF1;

in[31:24]<=8'h1E;
in[23:16]<=8'h27;
in[15:8]<=8'h98;
in[7:0]<=8'hE5;
end
always
begin
#40 clk=~clk;
end

INV_Shift_Rows uut(.in(in),.out(out),.clk(clk));

endmodule