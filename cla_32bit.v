module cla_32bit(
    input  [31:0] A,
    input  [31:0] B,
    input         Cin,
    output [31:0] Sum,
    output        Cout
);

    wire C16;

    cla_16bit cla0(
    .A(A[15:0]),
    .B(B[15:0]),
    .Cin(Cin),
    .Sum(Sum[15:0]),
    .Cout(C16)
);

    cla_16bit cla1(
    .A(A[31:16]),
    .B(B[31:16]),
    .Cin(C16),
    .Sum(Sum[31:16]),
    .Cout(Cout)
);

endmodule    