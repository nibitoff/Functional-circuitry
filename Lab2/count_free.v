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


always @(*) begin
    case (state)
        IDLE: begin
            next_state = COUNTING;
            result_rsp_o = 0;
            busy_o = 0;
        end
        COUNTING: begin
            next_state = WAITING;
            busy_o = 1;
        end
        WAITING: begin
            next_state = DONE;
            busy_o = 1;
        end
        DONE: begin
            next_state = IDLE;
            result_rsp_o = 1;
            busy_o = 0;
        end
    endcase  
end

always @ (posedge clk, negedge rst) begin
    if (!rst) begin
        state <= IDLE;
        count <= 0;
        data <= 0;
    end else begin
        case (state)
            IDLE: begin
                if (start_req_i) begin
                    data <= start_data_i;
                    state <= next_state;
                end
            end
            COUNTING: begin
                if (start_req_i) begin
                    data <= (data << 1) + start_data_i;
                end else begin
                    count <= 0;
                    state <= next_state;
                end
            end
            WAITING: begin
                if (count == data) state <= next_state;
                else count <= count + 1;
            end
            DONE: begin
                if (ready_i) state <= next_state;
            end
        endcase
    end
    
end
endmodule