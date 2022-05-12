module rcon_tb ();
    reg [3:0] i;
    wire [7:0] out;
    Key_Expansion_128 m(i, out);
    initial begin
        i = 0;
    end
    always #5 i = i+1;
    always @ (out) $display("%d=> %h",i, out);
endmodule