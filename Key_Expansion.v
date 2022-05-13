module Key_Expansion #(parameter Nk = 4) (
    clk,key,out
);
input clk;
localparam Nr = Nk+6;
localparam keylen = Nk*32;
//total number of out words Nr*4
input [keylen-1:0] key;
reg [14:0] temp;
wire [31:0] subword [0:4*Nr+3];
/* output reg [31:0] out[0:4*Nr+3]; */
output reg [(4*Nr+4) * 32 - 1:0] out;

wire [31:0] out_words[0:4*Nr+3];

integer j;
genvar i;
generate 
    
    for(i = 0;i <=4*Nr+3;i=i+1)begin : generate_block
        if(i < Nk) begin
            assign out_words[i] = key[(keylen-1)-32*i -:32];
        end

        else begin
            if(i % Nk == 0) begin
                aes_sbox s0(RotWord(out_words[i-1]), subword[i]);
                assign out_words[i] = out_words[i-Nk] ^ subword[i] ^ rcon(i/Nk);
            end
            else if(Nk > 6 && i % Nk == 4) begin
                aes_sbox s1(out_words[i-1], subword[i]);
                assign out_words[i] = out_words[i-Nk] ^ subword[i];
            end
            else begin
                assign out_words[i] = out_words[i-Nk] ^ out_words[i-1];
            end
        end
    end
endgenerate 
generate 
integer m;
always @(posedge clk) begin
    for(m = 0;m <=4*Nr+3;m=m+1)begin : generate_block_loop
        out[(4*Nr+4) * 32 - 1 - 32*m  -:32] = out_words[m];
    end
end
endgenerate 


function [31:0] RotWord;
    input [31:0] word;
    begin
        RotWord = {word[23-:8*3], word[31-:8]};
    end
    
endfunction

function [31:0] rcon;
    input [3:0] k;/* 256 => 14 round => 4 bit */
//integer j;
    begin
        case(k)
            4'h1: rcon=32'h01000000;
            4'h2: rcon=32'h02000000;
            4'h3: rcon=32'h04000000;
            4'h4: rcon=32'h08000000;
            4'h5: rcon=32'h10000000;
            4'h6: rcon=32'h20000000;
            4'h7: rcon=32'h40000000;
            4'h8: rcon=32'h80000000;
            4'h9: rcon=32'h1b000000;
            4'ha: rcon=32'h36000000;
            default: rcon=32'h00000000;
        endcase
    end
    
endfunction
endmodule
/* 
        temp = 16'd1 << k;
        for(j = 14;j >=8;j = j - 1) begin
            if(temp[j] == 1'b1)
                temp[j-:9] = temp[j-:9]  ^ 9'b100011011;
        end 
        rcon = temp[7:0]; */

/*         case (k)
            4'd1: rcon = 8'h01;
            4'd2: rcon = 8'h02;
            4'd3: rcon = 8'h04;
            4'd4: rcon = 8'h08;
            4'd5: rcon = 8'h10;
            4'd6: rcon = 8'h20;
            4'd7: rcon = 8'h40;
            4'd8: rcon = 8'h80;
            4'd9: rcon = 8'h1B;
            4'd10: rcon = 8'h36;
            default: rcon = 8'h00;
        endcase */

