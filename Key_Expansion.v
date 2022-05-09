module Key_Expansion_128 (
    in,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10
);
input [127:0] in;
output reg [127:0]out1,out2,out3,out4,out5,out6,out7,out8,out9,out10;


function [31:0] RotWord;
    input [31:0] word;
    begin
        RotWord = (word << 1 | word >> 7);
    end
    
endfunction

function [7:0] rcon;
    input [3:0] i;/* 128 10round=4bit */
    begin
        case (i)
            4'h1: rcon = 8'h01; //x0 = 0001
            4'h2: rcon = 8'h02; //x = 0010
            4'h3: rcon = 8'h04; //x2 = 0100
            4'h4: rcon = 8'h08; //x3 = 1000
            4'h5: rcon = 8'h10; //x4 =0001 0000
            4'h6: rcon = 8'h20; //x5 =0010 0000
            4'h7: rcon = 8'h40; //x6 =0100 0000
            4'h8: rcon = 8'h80; //x7 =1000 0000
            4'h9: rcon = 8'h1B; //x8 =0001 1011 x4+x3+x1+1
            4'h10: rcon = 8'h36;//x9 =0011 0110 x5+x4+x2+x1
            default: rcon = 8'h00;
        endcase
    end
    
endfunction
endmodule