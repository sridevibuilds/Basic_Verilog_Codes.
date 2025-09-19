1.half_adder.v
module half_adder(
    input a,
    input b,
    output sum,
    output carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

2.full_adder.v
module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output carry
);
    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (a & cin);
endmodule

3.half_subtractor.v
module half_subtractor(
    input a,
    input b,
    output diff,
    output borrow
);
    assign diff = a ^ b;
    assign borrow = ~a & b;
endmodule

4.full_subtractor.v
module full_subtractor(
    input a,
    input b,
    input bin,
    output diff,
    output borrow
);
    assign diff = a ^ b ^ bin;
    assign borrow = (~a & b) | ((~a | b) & bin);
endmodule

5.comparator.v (2-bit)
module comparator(
    input [1:0] a,
    input [1:0] b,
    output a_greater,
    output a_equal,
    output a_less
);
    assign a_greater = (a > b);
    assign a_equal   = (a == b);
    assign a_less    = (a < b);
endmodule

6.binary_to_gray.v
module binary_to_gray(
    input [3:0] binary,
    output [3:0] gray
);
    assign gray[3] = binary[3];
    assign gray[2] = binary[3] ^ binary[2];
    assign gray[1] = binary[2] ^ binary[1];
    assign gray[0] = binary[1] ^ binary[0];
endmodule

7. gray_to_binary.v
module gray_to_binary(
    input [3:0] gray,
    output [3:0] binary
);
    assign binary[3] = gray[3];
    assign binary[2] = binary[3] ^ gray[2];
    assign binary[1] = binary[2] ^ gray[1];
    assign binary[0] = binary[1] ^ gray[0];
endmodule


4️⃣ Combinational Testbenches
1. half_adder_tb.v
`timescale 1ns/1ps
module half_adder_tb;
    reg a, b;
    wire sum, carry;

    half_adder uut (.a(a), .b(b), .sum(sum), .carry(carry));

    initial begin
        $display("A B | SUM CARRY");
        a=0; b=0; #10 $display("%b %b | %b %b", a,b,sum,carry);
        a=0; b=1; #10 $display("%b %b | %b %b", a,b,sum,carry);
        a=1; b=0; #10 $display("%b %b | %b %b", a,b,sum,carry);
        a=1; b=1; #10 $display("%b %b | %b %b", a,b,sum,carry);
        $finish;
    end
endmodule

2. full_adder_tb.v
`timescale 1ns/1ps
module full_adder_tb;
    reg a, b, cin;
    wire sum, carry;

    full_adder uut (.a(a), .b(b), .cin(cin), .sum(sum), .carry(carry));

    integer i;
    initial begin
        $display("A B CIN | SUM CARRY");
        for(i=0;i<8;i=i+1) begin
            {a,b,cin} = i;
            #10 $display("%b %b %b | %b %b", a,b,cin,sum,carry);
        end
        $finish;
    end
endmodule

3. half_subtractor_tb.v
`timescale 1ns/1ps
module half_subtractor_tb;
    reg a, b;
    wire diff, borrow;

    half_subtractor uut (.a(a), .b(b), .diff(diff), .borrow(borrow));

    initial begin
        $display("A B | DIFF BORROW");
        a=0; b=0; #10 $display("%b %b | %b %b", a,b,diff,borrow);
        a=0; b=1; #10 $display("%b %b | %b %b", a,b,diff,borrow);
        a=1; b=0; #10 $display("%b %b | %b %b", a,b,diff,borrow);
        a=1; b=1; #10 $display("%b %b | %b %b", a,b,diff,borrow);
        $finish;
    end
endmodule

4. full_subtractor_tb.v
`timescale 1ns/1ps
module full_subtractor_tb;
    reg a, b, bin;
    wire diff, borrow;

    full_subtractor uut (.a(a), .b(b), .bin(bin), .diff(diff), .borrow(borrow));

    integer i;
    initial begin
        $display("A B BIN | DIFF BORROW");
        for(i=0;i<8;i=i+1) begin
            {a,b,bin} = i;
            #10 $display("%b %b %b | %b %b", a,b,bin,diff,borrow);
        end
        $finish;
    end
endmodule

5. comparator_tb.v
`timescale 1ns/1ps
module comparator_tb;
    reg [1:0] a, b;
    wire a_greater, a_equal, a_less;

    comparator uut (.a(a), .b(b), .a_greater(a_greater), .a_equal(a_equal), .a_less(a_less));

    integer i,j;
    initial begin
        $display("A B | > = <");
        for(i=0;i<4;i=i+1) begin
            for(j=0;j<4;j=j+1) begin
                a=i; b=j; #10 $display("%b %b | %b %b %b", a,b,a_greater,a_equal,a_less);
            end
        end
        $finish;
    end
endmodule

6. binary_to_gray_tb.v
`timescale 1ns/1ps
module binary_to_gray_tb;
    reg [3:0] binary;
    wire [3:0] gray;

    binary_to_gray uut (.binary(binary), .gray(gray));

    integer i;
    initial begin
        $display("Binary | Gray");
        for(i=0;i<16;i=i+1) begin
            binary=i; #10 $display("%b | %b", binary, gray);
        end
        $finish;
    end
endmodule

7. gray_to_binary_tb.v
`timescale 1ns/1ps
module gray_to_binary_tb;
    reg [3:0] gray;
    wire [3:0] binary;

    gray_to_binary uut (.gray(gray), .binary(binary));

    integer i;
    initial begin
        $display("Gray | Binary");
        for(i=0;i<16;i=i+1) begin
            gray=i; #10 $display("%b | %b", gray, binary);
        end
        $finish;
    end
endmodule
