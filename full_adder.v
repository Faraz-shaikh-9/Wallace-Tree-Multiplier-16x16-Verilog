// 1-Bit Full Adder Module
module full_adder (
    input wire a,    // Input bit A
    input wire b,    // Input bit B
    input wire cin,  // Carry-in bit
    output wire sum, // Sum output
    output wire cout // Carry-out output
);

    // Logic equations for a Full Adder
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);

endmodule
