`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 11:43:05
// Design Name: 
// Module Name: counter
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

module counter(clk, rst, en, out);
    input clk, rst, en;
    output reg [31:0] out;
    
    always @ (posedge clk or negedge rst) begin
        if(! rst)
            out <= 0;
        else if (en)
            out <= out+1;
    end   
endmodule
