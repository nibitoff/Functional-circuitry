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
    input clk, // тактовый сигнал
    input rst, // сигнал сброса
    input start_req_i, // сигнал запроса валидности входных данных
    input start_data_i, // однобитный сигнал данных
    input ready_i, // сигнал готовности внешнего устройства прин€ть
    результат
    output reg result_rsp_o, // сигнал готовности результата
    output reg busy_o // сигнал зан€тости устройства
    // output reg [1:0] deb_state,
    // output reg [1:0] deb_next_state,
    // output reg [31:0] deb_count,
    // output reg [31:0] deb_data
);

// ¬нутренние сигналы и параметры
parameter IDLE = 0, COUNTING = 1, WAITING = 2, DONE = 3;
reg [31:0] count;
reg [31:0] data = 31'd0;
reg [1:0] state;
reg [1:0] next_state = IDLE;
// Ћогика переходов состо€ний
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

// Ћогика выполнени€
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
            // ≈сли начинаетс€ передача данных, начинаем записывать в
дата
if (start_req_i) begin
data = start_data_i;
next_state = COUNTING;
busy_o = 1;
end
end
COUNTING: begin
//≈сли сигнал валидности запроса, увеличиваем значение
регистра
if (start_req_i) begin
// data = {data[30:0], start_data_i};
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
// deb_state = state;
// deb_next_state = next_state;
// deb_count = count;
// deb_data = data;
end
endmodule
