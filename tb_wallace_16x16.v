module tb_wallace_16x16;

    reg  [15:0] A;
    reg  [15:0] B;

    wire [31:0] Product;

    wallace_16x16 uut(
        .A(A),
        .B(B),
        .Product(Product)
    );

    initial begin

        $monitor("A=%d B=%d Product=%d", A, B, Product);
        
        $dumpfile("wallace_16x16.vcd");
        $dumpvars(0, tb_wallace_16x16);

        A = 0;      B = 0;      #10;
        A = 2;      B = 3;      #10;
        A = 5;      B = 5;      #10;
        A = 15;     B = 15;     #10;
        A = 100;    B = 50;     #10;
        A = 255;    B = 255;    #10;
        A = 1000;   B = 1000;   #10;
        A = 65535;  B = 65535;  #10;

        $finish;
    end

endmodule