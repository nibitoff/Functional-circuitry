`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 22:04:47
// Design Name: 
// Module Name: count_free
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


module count_free(
    input clk,
    input rst,
    input start_req_i,
    input start_data_i,
    input ready_i,
    output reg result_rsp_o,
    output reg busy_o
);

parameter IDLE = 0, COUNTING = 1, WAITING = 2, DONE = 3;
reg [31:0] count;
reg [31:0] data = 31'd0;
reg [1:0] state;
reg [1:0] next_state = IDLE;

always @ (posedge clk, posedge rst) begin
    if (rst) begin
        state <= IDLE;
        count <= 0;
        busy_o <= 0;
    end else begin
        state <= next_state;
        count <= count + 1;
    end
end

always @ (posedge clk, posedge rst) begin
    if (rst) begin
        state <= IDLE;
        count <= 0;
        busy_o <= 0;
    end else begin
        if ((state == IDLE) || (state == DONE))
            busy_o = 0;
        else
            busy_o = 1;
            
        next_state = state;
        
        case (state)
            IDLE: begin
                result_rsp_o = 0;

                if (start_req_i) begin
                    data = start_data_i;
                    next_state = COUNTING;
                    busy_o = 1;
                end
            end
            COUNTING: begin
                if (start_req_i) begin
                    data = (data << 1) + start_data_i;
                end else begin
                    next_state = WAITING;
                    count = 0;
                end
            end
           WAITING: begin
                if (count == data) begin
                    next_state = DONE;
                    result_rsp_o = 1;
                    if(ready_i)
                        next_state = IDLE;
                    end
                end
           DONE: begin
                if (ready_i) begin
                    next_state = IDLE;
                end
            end
        endcase
    end
end
endmodule