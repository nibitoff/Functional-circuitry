`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 12:58:25
// Design Name: 
// Module Name: bcd_to_leds
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


module bcd_to_leds(
        input wire[3:0] digit,
        output reg[6:0] leds
    );
    always @ (*)
        begin
            case(digit)
                0: leds = 7'b0000001;
                1: leds = 7'b1001111;
                2: leds = 7'b0010010;
                3: leds = 7'b0000110;
                4: leds = 7'b1001100;
                5: leds = 7'b0100100;
                6: leds = 7'b0100000;
                7: leds = 7'b0001111;
                8: leds = 7'b0000000;
                9: leds = 7'b0000100;
                10: leds = 7'b0001000; //A
                11: leds = 7'b1100000; //B
                12: leds = 7'b0110001; //C
                13: leds = 7'b1000010; //D
                14: leds = 7'b0110000; //E
                15: leds = 7'b0111000; //F 
                default: leds = 7'b0000001;
            endcase
    end
endmodule
