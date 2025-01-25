`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2020 03:51:30 PM
// Design Name: 
// Module Name: DispOut
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Display(selcounter, seg);

  
    input [3:0] selcounter;
    output [6:0] seg;
    reg [6:0] seg;
    
    always @ (selcounter)
        begin
                case (selcounter)
                0: seg <=7'b1000000;
                1: seg <=7'b1111001;
                2: seg <=7'b0100100;
                3: seg <=7'b0110000;
                4: seg <=7'b0011001;
                5: seg <=7'b0010010; 
                6: seg <=7'b0000010; 
                7: seg <=7'b1111000;
                8: seg <=7'b0000000;
                9: seg <=7'b0011000;
                
                default seg <=7'b1110110;
                endcase
       end
endmodule
