module lab3_tb;

logic a;
logic b;
logic c;
logic x;
logic y;

localparam period = 10;

lab3 UUT(

    .a(a),
    .b(b),
    .c(c),
    .x(x),
    .y(y)

);

initial begin

    a=0; b=0; c=0;
    #period;
    a=0; b=0; c=1;
    #period;
    a=0; b=1; c=0;
    #period;
    a=0; b=1; c=1;
    #period;
    a=1; b=0; c=0;
    #period;
    a=1; b=0; c=1;
    #period;
    a=1; b=1; c=0;
    #period;
    a=1; b=1; c=1;
    #period;
    $stop;

end

initial begin

    $monitor(" y=%b, x=%b, a=%b, b=%b, c=%b " , y, x, a, b, c);

end

endmodule


