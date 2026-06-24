module wallace_16x16(
    input  [15:0] A,
    input  [15:0] B,
    output [31:0] Product
);

    // Partial products
    wire [15:0] pp [0:15];

    // Shifted partial products
    wire [31:0] pp_shift [0:15];
    
    wire [31:0] sum   [0:13];
    wire [31:0] carry [0:13];
    wire [31:0] carry_shift [0:13];

genvar i;

generate
    for(i = 0; i < 16; i = i + 1)
    begin : PP_GEN

        assign pp[i] = A & {16{B[i]}};

        assign pp_shift[i] = {16'b0, pp[i]} << i;

    end
endgenerate

genvar j;

generate
    for(j = 0; j < 14; j = j + 1)
    begin : CARRY_SHIFT_GEN
        assign carry_shift[j] = carry[j] << 1;
    end
endgenerate

    csa #(32) csa1(
    .A(pp_shift[0]),
    .B(pp_shift[1]),
    .C(pp_shift[2]),
    .Sum(sum[0]),
    .Carry(carry[0])
);

    csa #(32) csa2(
    .A(pp_shift[3]),
    .B(pp_shift[4]),
    .C(pp_shift[5]),
    .Sum(sum[1]),
    .Carry(carry[1])
);

    csa #(32) csa3(
    .A(pp_shift[6]),
    .B(pp_shift[7]),
    .C(pp_shift[8]),
    .Sum(sum[2]),
    .Carry(carry[2])
);

    csa #(32) csa4(
    .A(pp_shift[9]),
    .B(pp_shift[10]),
    .C(pp_shift[11]),
    .Sum(sum[3]),
    .Carry(carry[3])
);

    csa #(32) csa5(
    .A(pp_shift[12]),
    .B(pp_shift[13]),
    .C(pp_shift[14]),
    .Sum(sum[4]),
    .Carry(carry[4])
);

    csa #(32) csa6(
    .A(sum[0]),
    .B(carry_shift[0]),
    .C(sum[1]),
    .Sum(sum[5]),
    .Carry(carry[5])
);

   csa #(32) csa7(
    .A(carry_shift[1]),
    .B(sum[2]),
    .C(carry_shift[2]),
    .Sum(sum[6]),
    .Carry(carry[6])
);

   csa #(32) csa8(
    .A(sum[3]),
    .B(carry_shift[3]),
    .C(sum[4]),
    .Sum(sum[7]),
    .Carry(carry[7])
);

    csa #(32) csa9(
    .A(sum[5]),
    .B(carry_shift[5]),
    .C(sum[6]),
    .Sum(sum[8]),
    .Carry(carry[8])
);

    csa #(32) csa10(
    .A(carry_shift[6]),
    .B(sum[7]),
    .C(carry_shift[7]),
    .Sum(sum[9]),
    .Carry(carry[9])
);

    csa #(32) csa11(
    .A(sum[8]),
    .B(carry_shift[8]),
    .C(sum[9]),
    .Sum(sum[10]),
    .Carry(carry[10])
);

    csa #(32) csa12(
    .A(carry_shift[9]),
    .B(carry_shift[4]),
    .C(pp_shift[15]),
    .Sum(sum[11]),
    .Carry(carry[11])
);

    csa #(32) csa13(
    .A(sum[10]),
    .B(carry_shift[10]),
    .C(sum[11]),
    .Sum(sum[12]),
    .Carry(carry[12])
);

    csa #(32) csa14(
    .A(sum[12]),
    .B(carry_shift[12]),
    .C(carry_shift[11]),
    .Sum(sum[13]),
    .Carry(carry[13])
);

    wire final_cout;
    

    cla_32bit final_add(
    .A(sum[13]),
    .B(carry_shift[13]),
    .Cin(1'b0),
    .Sum(Product),
    .Cout(final_cout)
);

endmodule
