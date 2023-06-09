`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2023 21:47:40
// Design Name: 
// Module Name: lru_buffer_one_tact
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


module lru_buffer_one_tact(clk, rst, valid_data, data, sw, out);
    input clk, rst, valid_data;
    input [11:0] data;
    input [1:0] sw;
    output [11:0] out;
    
    reg [11:0] buff_mem [3:0];
    reg [1:0] ages [3:0];
    reg [1:0] hitIndex;
    reg [1:0] index;
    
    integer i;
    
    assign out = buff_mem[sw];
    
    reg valid_data_latched;
    always @(posedge clk) valid_data_latched <= valid_data;
    
    // ages update
    always @(posedge clk) begin
        if (rst) begin  
            for(i = 0; i < 4; i = i + 1) ages[i] <= i;
        end else if (!valid_data_latched && valid_data) begin
            for (i = 0; i < 4; i = i + 1) begin
                if (i == hitIndex) begin
                    ages[i] <= 0;
                end
                else if (ages[i] < ages[hitIndex]) begin
                    ages[i] <= ages[i] + 1;
                end
            end
        end
    end
    
    
    // buff mem update
    always @(posedge clk) begin
        if (rst) begin
            for(i = 0; i < 4; i = i + 1) begin
                buff_mem[i]  <= 12'd0;
            end
        end else if (!valid_data_latched && valid_data) begin
            buff_mem[hitIndex] <= data;
        end
    end
    
    // hitIndex update
    reg hit;
    always @(*) begin
        hit = 0;
        hitIndex = 0;
        for(i = 0; i < 4; i = i + 1) begin
            if(buff_mem[i] == data) begin
                hitIndex = i;
                hit = 1;
            end
        end
        if(!hit) begin
            for(i = 0; i < 4; i = i + 1) begin
                if(ages[i] == 3) hitIndex = i;
            end
        end 
    end

endmodule
