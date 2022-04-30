module test(a, b,out);
input [7:0] a;
input [7:0] b;

output reg [14:0]out;
integer  i,j;

    
always @(a or b) begin
    out = 15'b0;
    
    for( i = 0;i < 8;i = i+1) begin
        for( j = 0;j < 8;j = j+1) begin
            out[i+j] = out[i+j] + (a[i] && b[j]);
    $display("a[%d]=%d | b[%d]=%d | out[%d] = %d",i,a[i],j,b[j],i+j,out[i+j]);
        end
    end

    $display("%b", out);

    for(i = 14;i >=8;i = i - 1) begin
    $display("%d\t%d\t%b", i, i - 9, out[i-:9]);
        if(out[i] == 1'b1)
            out[i-:9] = out[i-:9]  ^ 9'b100011011;
    $display("%d\t%d\t%b", i, i - 9, out[i-:9]);
    end 
    
    $display("%d", out);
end

endmodule