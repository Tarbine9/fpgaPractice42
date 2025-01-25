`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2023 06:51:21 PM
// Design Name: 
// Module Name: SPI_master
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


module SPI_master(inCLK, inMessage, MISO, inSelect, dataReady, outCLK, MOSI,outSelect1, outSelect2, outSelect3);

input inCLK, MISO, dataReady;
// dataReady is input from switches to SPI master to take current selected switchest as data
 // MISO Master input Slave Output. Communication to Master
 // inCLK is the clock Input from the system
input [7:0] inMessage;
input [1:0] inSelect; // inSelect is to select which 7 segment display that needs to be changed
output reg outSelect1; // outSelect1 is the select for 100ths place digit
output reg outSelect2;// outSelect2 is the select for 10th place digit
output reg outSelect3;// outSelect2 is the select for 10th place digit
output reg MOSI=0;  // MOSI Master Output Slave Input. Communication to Slave
output reg outCLK=0; // outCLK is the clock output to the Slave device from the Master device

reg [2:0] i;
reg [7:0] dataBack;
reg workFlag=0;


initial
begin
    outSelect1 <= 1; // in SPI select idle is High
    outSelect2 <= 1;
    outSelect3 <= 1;
    i<=0;
    dataBack<=0;
    workFlag<=0;
end

always @(posedge inCLK)// this block is to count to 7 for keeping track of the inMessage to MOSI register
begin
    if(dataReady ==1)// we are going to recive a message
    begin    
        workFlag<=dataReady;
        if(inSelect==0) // if device is not selected then send no data
        begin
            outSelect1 <= 1; // in SPI select idle is High
            outSelect2 <= 1;
            outSelect3 <= 1;
        end
        else if (inSelect==1)
            outSelect1<=0;// in SPI select on is low
        else if(inSelect==2)
            outSelect2<=0;
        else if(inSelect==3)
            outSelect3<=0;       
    end 
    else if (i==7)
    begin
        workFlag<=0;
        MOSI<=0;// clear MOSI
        outSelect1 <= 1; // turn off selection
        outSelect2 <= 1;
        outSelect3 <= 1;
    end
end

always @ (posedge inCLK or posedge workFlag )// shift register (inMessage out on the MOSI line)
begin
    if(workFlag == 1)
    begin
        MOSI<=inMessage[i]; // shift register
        dataBack[i]<= MISO;// do I want to shift in the data?
        i<=i+1;
    end else
    begin
        i<=0; //clear counter
        MOSI<=0;// clear MOSI
        dataBack<=0;// clear MISO data to wait for new data
    end
end

always @ (inCLK  or workFlag) // to sen outClock signals
begin
    if(workFlag==1)//clock needs to be on when sending data and retrieving it
    begin
        outCLK<=inCLK;
    end
    else
    begin
        outCLK<=0;
    end
end




endmodule
