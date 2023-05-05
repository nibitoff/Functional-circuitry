`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 12:37:28
// Design Name: 
// Module Name: anode_controller
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


module anode_controller(
        input wire[1:0] refresh_counter,
        output reg[7:0] an
    );
    always@(refresh_counter) begin
        case(refresh_counter)
            0: begin
                an <= 8'b11111110;
            end
            1: begin
                an <= 8'b11111101;
            end
            2: begin
                an <= 8'b11111011;
            end
            3: begin
                an <= 8'b11110111;
            end
        endcase
    end
endmodule
