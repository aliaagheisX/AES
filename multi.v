module mutli(clk,a,b,out);
input clk;
input [7:0] a;
input [7:0] b;
output reg [7:0] out;
reg [7:0] a1;
reg [7:0] b1;
reg [7:0] carry;

integer i;

always @ (posedge clk) begin
    out = 8'b0;
    a1 = a;
    b1 = b;

    for(i = 0;i < 8;i = i + 1) begin
        if((b1 & 1) == 1) out = out ^ a1;   //add if rightmost b is 1
        b1 = b1 >> 1;                       //divide b by X except X    0

        carry = (a1 & 8'b1000_0000);          //check if LSB is 1

        a1 = a1 << 1;
        if(carry == 8'b1000_0000) a1 = a1 ^ 8'b00011011;
    end

end

endmodule