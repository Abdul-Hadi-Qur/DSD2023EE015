module rgb_led_tb;

    logic a1;
    logic a0;
    logic b1;
    logic b0;
    logic r;
    logic g;
    logic b;

localparam period = 10;

rgb_led UUT (

    .a1(a1), 
    .a0(a0),
    .b1(b1), 
    .b0(b0),

    .r(r),
    .g(g),
    .b(b)
);

initial begin

    a1 = 0;      a0 = 0;      b1 = 0;        b0 = 0;     #period;    //yellow
    a1 = 0;      a0 = 0;      b1 = 0;        b0 = 1;     #period;    //Cyan
    a1 = 0;      a0 = 0;      b1 = 1;        b0 = 0;     #period;    //Cyan
    a1 = 0;      a0 = 0;      b1 = 1;        b0 = 1;     #period;    //Cyan

    a1 = 0;      a0 = 1;      b1 = 0;        b0 = 0;     #period;    //Purple
    a1 = 0;      a0 = 1;      b1 = 0;        b0 = 1;     #period;    //yellow
    a1 = 0;      a0 = 1;      b1 = 1;        b0 = 0;     #period;    //Cyan
    a1 = 0;      a0 = 1;      b1 = 1;        b0 = 1;     #period;    //Cyan

    a1 = 1;      a0 = 0;      b1 = 0;        b0 = 0;     #period;    //Purple
    a1 = 1;      a0 = 0;      b1 = 0;        b0 = 1;     #period;    //Purple
    a1 = 1;      a0 = 0;      b1 = 1;        b0 = 0;     #period;    //yellow
    a1 = 1;      a0 = 0;      b1 = 1;        b0 = 1;     #period;     //Cyan

    a1 = 1;      a0 = 1;      b1 = 0;        b0 = 0;     #period;    //Purple
    a1 = 1;      a0 = 1;      b1 = 0;        b0 = 1;     #period;    //Purple
    a1 = 1;      a0 = 1;      b1 = 1;        b0 = 0;     #period;    //Purple
    a1 = 1;      a0 = 1;      b1 = 1;        b0 = 1;     #period;    //yellow

    $stop;

end

initial begin
    $monitor(" a1=%b, a0=%b, b1=%b,, b0=%b r=%b, g=%b, b=%b", a1,a0,b1,b0,r,g,b);
end

endmodule
