`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2023 18:54:09
// Design Name: 
// Module Name: numberDisplay
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


module numberDisplay(
        input wire clock,
        input wire [11:0] number,
        output wire [7:0] AN,
        output wire [6:0] LEDS
    );
       
    wire clock_div;
    freq_div fdiv(
        .clk_in (clock),
        .clk_out (clock_div)
    );
    
    
    wire [1:0] r_counter;
    display_refresher disp_rfrshr(
        .clock(clock_div),
        .refresh_counter(r_counter)
    );
    
    anode_controller anode_cntrllr(
        .refresh_counter(r_counter),
        .an(AN)
    );
    
    wire [3:0] digit;
    bcd_controller bcd_cntrllr(
        .digit0(number[3:0]),
        .digit1(number[7:4]),
        .digit2(number[11:8]),
        .refresh_counter(r_counter),
        .output_digit(digit)
    );
    
    bcd_to_leds bcd_leds(
        .digit(digit),
        .leds(LEDS)
    );
endmodule
