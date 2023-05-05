`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2023 17:57:42
// Design Name: 
// Module Name: led
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


module top_module(
    input CLK,
    input BTN_RESET,         //wr_req     
    input BTN_WR, 
    output wire [6:0] LEDS,
    output wire [7:0] AN,
    input[15:0] SW,     //switches
    output wire DP);
    
    assign DP = 1;
    
    wire reset, write_en;
    button_controller btn_cntrller(
        .wr_en_btn(BTN_WR),
        .rst_btn(BTN_RESET),
        .clock(CLK),
        .rst(reset),
        .wr_en(write_en)
    );
    
    wire[11:0] output_number;
    
    lru_switch_buffer lru(
        .clk(CLK),
        .rst(reset),
        .valid_data(write_en),
        .data(SW[11:0]),
        .sw(SW[15:14]),
        .out(output_number)
    );
    
    numberDisplay display(
        .clock(CLK),
        .number(output_number),
        .LEDS(LEDS),
        .AN(AN)
    );
    
endmodule
