`timescale 1ns / 1ps

module lru_buffer_tb;

reg clock, reset, valid_data_in;
reg [7:0] data_in;
wire[7:0] out0;
wire[7:0] out1;
wire[7:0] out2;
wire[7:0] out3;

wire[3:0] ages0;
wire[3:0] ages1;
wire[3:0] ages2;
wire[3:0] ages3;
wire[1:0] state;

lru_buffer lru(
    .clk (clock),
    .rst (reset),
    .valid_data(valid_data_in),
    .data(data_in),
    .out0(out0),
    .out1(out1),
    .out2(out2),
    .out3(out3),
    .age0_debug(ages0),
    .age1_debug(ages1),
    .age2_debug(ages2),
    .age3_debug(ages3),
    .state_debug(state)
);

integer i,j;
integer test_sequence[0:20];
initial begin
    test_sequence[0] = 4;
    test_sequence[1] = 5;
    test_sequence[2] = 1;
    test_sequence[3] = 2;
    test_sequence[4] = 3;
    test_sequence[5] = 4;
    test_sequence[6] = 5;
    test_sequence[7] = 3;
    test_sequence[8] = 4;
    test_sequence[9] = 5;
    test_sequence[10] = 7;
    test_sequence[11] = 8;
    
    i = 0;
    j = 0;
    clock = 0;
    reset = 0;
    valid_data_in = 0;
    
    #5 reset = 1;
    #5 reset = 0;
    
    for( j = 0; j < 12; j = j + 1) begin 
        data_in = test_sequence[j];
        #5 clock = ~clock;
        valid_data_in = 1;
        #5 clock = ~clock;
        valid_data_in = 0;
        
        for (i = 0 ; i < 15; i = i + 1) begin
            #5 clock = ~clock;
            #5 clock = ~clock;
        end
        
        $display("inserted %d, out = [%d, %d, %d, %d]", test_sequence[j], out0, out1, out2, out3);
    end
    $stop;
end
endmodule