`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 12:47:48
// Design Name: 
// Module Name: fsm_4
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


module fsm_4(
    input clk,
    input reset,
    input valid_data,
    input [31:0] A,
    input [31:0] B,
    output reg [35:0] result
);

parameter IDLE = 0;
parameter A_SUM_B = 1;
parameter SUM_MUL_4 = 2;
parameter ADD_B= 3;
parameter DIV_B_2 = 4;
parameter A_MUL_4 = 5;
parameter DIV_ADD_MULL = 6;
parameter LEFT_DIV_2 = 7;
parameter ADD_ALL = 8;
parameter FINISH = 9;

reg [3:0] cur_state, next_state;
reg [35:0] adder_1, mult_1, div_1, adder_2;


always @(posedge clk, negedge reset) begin
    if (!reset)
        cur_state <= IDLE;
    else if(cur_state != IDLE)
        cur_state <= next_state;
    else if(valid_data) begin
        result <= 0; 
        cur_state <= next_state;
    end
    
end

always @(*) begin 
case (cur_state)
        IDLE:
            next_state = A_SUM_B;
        A_SUM_B:
            next_state = SUM_MUL_4;
        SUM_MUL_4:
            next_state = ADD_B;
        ADD_B:
            next_state = DIV_B_2;
        DIV_B_2:
            next_state = A_MUL_4;
        A_MUL_4:
            next_state = DIV_ADD_MULL;
        DIV_ADD_MULL:
            next_state = LEFT_DIV_2;
        LEFT_DIV_2:
            next_state = ADD_ALL;
        ADD_ALL:
            next_state = FINISH;
        FINISH:
            next_state = IDLE;
        default:
            next_state = IDLE;
    endcase
end

always @(posedge clk) begin
    case (cur_state)
        IDLE:
            ;
        A_SUM_B:
            adder_1 <= A + B;
        SUM_MUL_4:
            mult_1 <= adder_1 << 2;
        ADD_B:
            adder_1 <= mult_1 + B;
        DIV_B_2:
            div_1 <= B >> 1;
        A_MUL_4:
            mult_1 <= A << 2;
        DIV_ADD_MULL:
            adder_2 <= mult_1 + div_1;
        LEFT_DIV_2:
            div_1 <= adder_1 >> 1;
        ADD_ALL:
            adder_1 <= div_1 + adder_2;
        FINISH:
            result <= adder_1;
        default:
            next_state <= IDLE;
    endcase
end
endmodule
