module rgb_led (
    
    input a1,
    input a0,
    input b0,
    input b1,
    output r,
    output g,
    output b
    );
    assign r = ((~b1 & ~b0) | (a1 & a0) | (a0 & ~b1) | (a1 & ~b1) | (a1 & b1 & ~b0));
    assign g = ((~a1 & ~a0) | (b1 & b0) | (~a1 & b1) | (~a1 & b0) | (~a0 & b1));
    assign b = ((a1 & ~b1) | (~a1 & b1) | (a0 & ~b0) | (~a0 & b0));


endmodule
