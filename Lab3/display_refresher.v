`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 12:39:10
// Design Name: 
// Module Name: display_refresher
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


module display_refresher(
    input wire clock,
    output reg[1:0] refresh_counter
    );
    always@ (posedge clock) begin
        case (refresh_counter) 
            2:
                refresh_counter <= 0;
            default:
                refresh_counter <= refresh_counter + 1;
        endcase
    end
endmodule
