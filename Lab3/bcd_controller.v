`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 12:51:48
// Design Name: 
// Module Name: bcd_controller
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


module bcd_controller(
    input [3:0] digit0,
    input [3:0] digit1,
    input [3:0] digit2,
    input [1:0] refresh_counter,
    output reg [3:0] output_digit
    );
    always@ (refresh_counter) begin
        case (refresh_counter)
            0:
                output_digit <= digit0;
            1:
                output_digit <= digit1;
            2:
                output_digit <= digit2;
        endcase
    end
endmodule
