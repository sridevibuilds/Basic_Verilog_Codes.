and_gate.v:-
module and_gate(
    input a,
    input b,
    output y
);
    assign y = a & b;
endmodule
and_gate_tb.v:-
`timescale 1ns/1ps
module and_gate_tb;
    reg a, b;
    wire y;
    and_gate uut (.a(a), .b(b), .y(y));
    initial begin
        $display("A B | Y");
        a=0; b=0; #10 $display("%b %b | %b", a,b,y);
        a=0; b=1; #10 $display("%b %b | %b", a,b,y);
        a=1; b=0; #10 $display("%b %b | %b", a,b,y);
        a=1; b=1; #10 $display("%b %b | %b", a,b,y);
        $finish;
    end
endmodule


or_gate.v
module or_gate(
    input a,
    input b,
    output y
);
    assign y = a | b;
endmodule
or_gate_tb.v
`timescale 1ns/1ps
module or_gate_tb;
    reg a, b;
    wire y;
    or_gate uut (.a(a), .b(b), .y(y));
    initial begin
        $display("A B | Y");
        a=0; b=0; #10 $display("%b %b | %b", a,b,y);
        a=0; b=1; #10 $display("%b %b | %b", a,b,y);
        a=1; b=0; #10 $display("%b %b | %b", a,b,y);
        a=1; b=1; #10 $display("%b %b | %b", a,b,y);
        $finish;
    end
endmodule


not_gate.v
module not_gate(
    input a,
    output y
);
    assign y = ~a;
endmodule
not_gate_tb.v
`timescale 1ns/1ps
module not_gate_tb;
    reg a;
    wire y;
    not_gate uut (.a(a), .y(y));
    initial begin
        $display("A | Y");
        a=0; #10 $display("%b | %b", a,y);
        a=1; #10 $display("%b | %b", a,y);
        $finish;
    end
endmodule


xor_gate.v
module xor_gate(
    input a,
    input b,
    output y
);
    assign y = a ^ b;
endmodule
xor_gate_tb.v
`timescale 1ns/1ps
module xor_gate_tb;
    reg a, b;
    wire y;
    xor_gate uut (.a(a), .b(b), .y(y));
    initial begin
        $display("A B | Y");
        a=0; b=0; #10 $display("%b %b | %b", a,b,y);
        a=0; b=1; #10 $display("%b %b | %b", a,b,y);
        a=1; b=0; #10 $display("%b %b | %b", a,b,y);
        a=1; b=1; #10 $display("%b %b | %b", a,b,y);
        $finish;
    end
endmodule


