`timescale 1ns / 1ps

module timedivisionmultiplexing(clk, dataSend, AN, selcounter, seg);

input clk;
input [7:0] dataSend;
output reg [3:0] AN;
output [6:0] seg;
output reg [3:0] selcounter;

reg [1:0] sel;

Display Dec0(selcounter, seg);

always @ (posedge clk)
begin
     sel <= sel +1;
end 

always @ (dataSend or sel)
begin 
    case(sel)
    0:begin
        selcounter<=((dataSend % 1000)%100)%10;    
        AN<= 4'b1110;
            
    end
    1: begin
        selcounter<=((dataSend % 1000)%100)/10;
     
        AN<=4'b1101;
       
    end
    2:begin 
        selcounter<=(dataSend % 1000)/100;
        AN<= 4'b1011;
        
    end
    3: begin
        selcounter<=dataSend/1000;
        AN<=4'b0111;
        
    end
    default AN<=4'b1111;
    endcase
end 
endmodule
    

