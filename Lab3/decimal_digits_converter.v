`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 14:47:54
// Design Name: 
// Module Name: decimal_digits_converter
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


module decimal_digits_converter(
        input wire clock,
        input wire write_en,
        input wire [7:0] number,
        output wire [3:0] digit0,
        output wire [3:0] digit1,
        output wire [3:0] digit2,
        output wire [3:0] digit3
    );
    
parameter IDLE = 0;
parameter PROCESS_D0 = 1;
parameter PROCESS_D1 = 2;
parameter PROCESS_D2= 3;
parameter PROCESS_D3 = 4;
parameter FINISH = 5;

reg [3:0] cur_state;

always @(posedge clock) begin
    case (cur_state)
        IDLE: begin
            if(write_en) begin 
                cur_state <= PROCESS_D0;
            end
        end
        PROCESS_D0: begin
            
            cur_state <= PROCESS_D1;
        end
        PROCESS_D1: begin
            cur_state <= PROCESS_D2;
        end
        PROCESS_D2: begin
            cur_state <= PROCESS_D3;
        end
        PROCESS_D3: begin
            cur_state <= FINISH;
        end
    endcase
end 
endmodule
