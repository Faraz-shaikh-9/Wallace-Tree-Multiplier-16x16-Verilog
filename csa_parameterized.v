module csa #(parameter N = 16)(
    input  [N-1:0] A,
    input  [N-1:0] B,
    input  [N-1:0] C,
    output [N-1:0] Sum,
    output [N-1:0] Carry
);

    genvar i;

    generate
        for(i = 0; i < N; i = i + 1)
        begin : CSA_GEN

            full_adder fa(
                .a(A[i]),
                .b(B[i]),
                .cin(C[i]),
                .sum(Sum[i]),
                .cout(Carry[i])
            );

        end
    endgenerate
   
endmodule