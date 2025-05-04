`timescale 1ns/1ps

module top_module_tb;
    
    logic clk, reset, write;
    logic [3:0] num;
    logic [2:0] sel;
    logic [6:0] cathode;
    logic [7:0] anodes;
    
    top_module uut (
        .clk(clk),
        .reset(reset),
        .write(write),
        .num(num),
        .sel(sel),
        .cathode(cathode),
        .anodes(anodes)
    );
    
    always #5 clk = ~clk;  // 10ns period (100MHz)
    
    // Test sequence
    initial begin
        clk = 0;
        reset = 1;
        write = 0;
        num = 4'b0000;
        sel = 3'b000;
        
        #20 reset = 0;
        
        // tessting for roll number WHEN write=1

        write =1;

        sel = 3'b000;       num = 4'b0101;      #10;      //   5
        sel = 3'b001;       num = 4'b0001;      #10;      //   1
        sel = 3'b010;       num = 4'b1110;      #10;      //   E
        sel = 3'b011;       num = 4'b1110;      #10;      //   E
        sel = 3'b100;       num = 4'b0011;      #10;      //   3
        sel = 3'b101;       num = 4'b0010;      #10;      //   2
        sel = 3'b110;       num = 4'b0000;      #10;      //   0
        sel = 3'b111;       num = 4'b0010;      #10;      //   2
        
        write=0;
        
    end
    
endmodule
