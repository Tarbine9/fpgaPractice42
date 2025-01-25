`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2023 06:51:21 PM
// Design Name: 
// Module Name: SPI_Slave
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

module SPI_Slave(inCLK, MOSI, MISO, inSelect, dataSend);

input inCLK, MOSI,inSelect;
output reg MISO=0;
output reg [7:0] dataSend=0;

reg [7:0] data=0, dataBack='b10111001;
reg [2:0] i=0, j=7;

always @ (posedge inCLK)
begin
    if (inSelect == 0)//SPI select is Low when active
    begin
        data[i] <= MOSI;
        i<=i+1;
        MISO <= dataBack[j];// return data to sender
        j<=j-1;
        if(i==7)
            dataSend<=data; // send full register out
    end 
    else       
    begin
        MISO<=0;
        j<=7;
        i<=0;
        data<=0; 
    end
    
end





endmodule
