`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2023 07:21:27
// Design Name: 
// Module Name: lru_buffer
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


module lru_buffer(clk, rst, valid_data, data,
                  out0, out1, out2, out3,
                  age0_debug, age1_debug, age2_debug, age3_debug, state_debug);
    input clk, rst, valid_data;
    input [7:0] data;
    output reg [7:0] out0, out1, out2, out3;
    output reg [3:0] age0_debug, age1_debug, age2_debug, age3_debug;
    output reg [1:0] state_debug;
    
    reg[1:0] state;
    
    reg [7:0] buffer[0:3];
    
    reg [3:0] ages[0:3];
    reg [3:0] hitIndex;
    reg [3:0] index;
    reg isHit;
    
    integer j;
    
    parameter IDLE = 0, CHECKING_HIT = 1, HIT_UPDATING = 2, nHIT_UPDATING = 3;
    
    always @ (posedge rst) begin
        out0 <= 7'd0;
        out1 <= 7'd0;
        out2 <= 7'd0;
        out3 <= 7'd0;
        isHit <= 1'b0;
        hitIndex <= 4'd0;
        for(j = 0; j < 4; j = j + 1) begin
            ages[j] <= j;
            buffer[j] <= 7'd0;
        end
        out0 <= 7'd0;
        out1 <= 7'd0;
        out2 <= 7'd0;
        out3 <= 7'd0;
        state <= IDLE;
        
        state_debug <= state;
    end
    
    always @ (posedge clk) begin
        case(state)
            IDLE: begin
                if(valid_data) begin 
                    state <= CHECKING_HIT;
                    hitIndex <= 0;
                    index <= 0;
                end
            end
            CHECKING_HIT: begin
                if(hitIndex > 3) state <= nHIT_UPDATING;
                else begin
//                    $display("STATE: checking_hit, hitindex: %d", hitIndex);
                    if(buffer[hitIndex] == data) state <= HIT_UPDATING;
                    else hitIndex <= hitIndex + 1;                
                end
            end
            HIT_UPDATING: begin
                if(index > 3) begin
                    state <= IDLE;
                    ages[hitIndex] = 0;
                end else begin
//                    $display("STATE: HIT_UPDATING, hitindex:%d, index: %d", hitIndex, index);
                    if(ages[index] < ages[hitIndex]) ages[index] <= ages[index] + 1;
                    index <= index + 1;                
                end
            end
            nHIT_UPDATING: begin
                if(index > 3) state <= IDLE;
                else begin
//                    $display("STATE: nHIT_UPDATING, index: %d", index);
                    if(ages[index] == 3) begin
                        ages[index] <= 0;
                        buffer[index] <= data;
                    end else ages[index] <= ages[index] + 1;
                    index <= index + 1;
                end
            end
        endcase

        out0 <= buffer[0];
        out1 <= buffer[1];
        out2 <= buffer[2];
        out3 <= buffer[3];
        age0_debug <= ages[0];
        age1_debug <= ages[1];
        age2_debug <= ages[2];
        age3_debug <= ages[3];
        state_debug <= state;
    end
endmodule
