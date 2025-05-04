
module lab3 (
    input a,b,c,
    output x,y
                      );
     assign x = (~ c) ^ (a | b);
     assign y = (a | b) & ( ~(a & b) ^ (a | b)); 
     
 logic not_out;
 logic or_out;
 logic nand_out;
 assign not_out = ~c;
 assign nand_out = ~(a & b);
 assign or_out = a | b;
     
endmodule
