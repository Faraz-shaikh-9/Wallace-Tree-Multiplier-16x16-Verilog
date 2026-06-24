module cla_16bit(
    input  [15:0] A,
    input  [15:0] B,
    input         Cin,
    output [15:0] Sum,
    output        Cout
);

    wire C4;
    wire C8;
    wire C12;

    cla_4bit cla0(
    .A(A[3:0]),
    .B(B[3:0]),
    .Cin(Cin),
    .Sum(Sum[3:0]),
    .Cout(C4)
);

    cla_4bit cla1(
    .A(A[7:4]),
    .B(B[7:4]),
    .Cin(C4),
    .Sum(Sum[7:4]),
    .Cout(C8)
);

    cla_4bit cla2(
    .A(A[11:8]),
    .B(B[11:8]),
    .Cin(C8),
    .Sum(Sum[11:8]),
    .Cout(C12)
);

    cla_4bit cla3(
    .A(A[15:12]),
    .B(B[15:12]),
    .Cin(C12),
    .Sum(Sum[15:12]),
    .Cout(Cout)
);
endmodule    