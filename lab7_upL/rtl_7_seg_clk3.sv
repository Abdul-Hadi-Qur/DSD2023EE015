module top_module(
    input logic clk, reset, write,
    input logic [3:0] num,
    input logic [2:0] sel,
    output logic [6:0] cathode,
    output logic [7:0] anodes
);

    logic [3:0] mem_storage [7:0];   
    logic [2:0] new_sel;
    logic [16:0] new_clk;

    function automatic [7:0] an_dec(input logic [2:0] sel_in);
        case (sel_in)
            3'b000: an_dec = 8'b11111110;
            3'b001: an_dec = 8'b11111101;
            3'b010: an_dec = 8'b11111011;
            3'b011: an_dec = 8'b11110111;
            3'b100: an_dec = 8'b11101111;
            3'b101: an_dec = 8'b11011111;
            3'b110: an_dec = 8'b10111111;
            3'b111: an_dec = 8'b01111111;
            default: an_dec = 8'b11111111;
        endcase
    endfunction

    function automatic [6:0] cat_dec(input logic [3:0] num_in);
        case (num_in)
            4'b0000: cat_dec = 7'b1000000; // 0
            4'b0001: cat_dec = 7'b1111001; // 1
            4'b0010: cat_dec = 7'b0100100; // 2
            4'b0011: cat_dec = 7'b0110000; // 3
            4'b0100: cat_dec = 7'b0011001; // 4  
            4'b0101: cat_dec = 7'b0010010; // 5  
            4'b0110: cat_dec = 7'b0000010; // 6  
            4'b0111: cat_dec = 7'b1111000; // 7  
            4'b1000: cat_dec = 7'b0000000; // 8  
            4'b1001: cat_dec = 7'b0010000; // 9  
            4'b1010: cat_dec = 7'b0001000; // A  
            4'b1011: cat_dec = 7'b0000011; // B  
            4'b1100: cat_dec = 7'b1000110; // C  
            4'b1101: cat_dec = 7'b0100001; // D  
            4'b1110: cat_dec = 7'b0000110; // E  
            4'b1111: cat_dec = 7'b0001110; // F  
            default: cat_dec = 7'b1111111; 
        endcase
    endfunction

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            mem_storage[0] <= 4'b0000;
            mem_storage[1] <= 4'b0000;
            mem_storage[2] <= 4'b0000;
            mem_storage[3] <= 4'b0000;
            mem_storage[4] <= 4'b0000;
            mem_storage[5] <= 4'b0000;
            mem_storage[6] <= 4'b0000;
            mem_storage[7] <= 4'b0000;
        end else if (write) begin
            case (sel)
                3'b000: mem_storage[0] <= num;
                3'b001: mem_storage[1] <= num;
                3'b010: mem_storage[2] <= num;
                3'b011: mem_storage[3] <= num;
                3'b100: mem_storage[4] <= num;
                3'b101: mem_storage[5] <= num;
                3'b110: mem_storage[6] <= num;
                3'b111: mem_storage[7] <= num;
                default: ; 
            endcase
        end
    end9

    // Frequency Divider 
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            new_clk <= 17'b0;
        end else begin
            new_clk <= new_clk + 1;
        end
    end

    // counter
    always_ff @(posedge new_clk[1] or posedge reset) begin
        if (reset) begin
            new_sel <= 3'b000;
        end
        else if (!write) begin
            new_sel <= new_sel + 1;
        end
    end


    // Output
    always_comb begin
        if (write) begin
            cathode = cat_dec(mem_storage[sel]);
            anodes = an_dec(sel);
        end else begin
            cathode = cat_dec(mem_storage[new_sel]);
            anodes = an_dec(new_sel);
        end
    end

endmodule
