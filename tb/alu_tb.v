`timescale 1ns/1ps

module alu_tb;

parameter WIDTH = 32;

reg [WIDTH-1:0] A;
reg [WIDTH-1:0] B;
reg [3:0] opcode;

wire [WIDTH-1:0] result;
wire zero;
wire carry;
wire overflow;
wire negative;

alu #(WIDTH) DUT (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .zero(zero),
    .carry(carry),
    .overflow(overflow),
    .negative(negative)
);

initial begin

    $display("========================================");
    $display(" PARAMETERIZED ALU TEST");
    $display("========================================");

    // ADD
    A = 10; B = 20; opcode = 4'b0000;
    #10;
    if(result == 30)
        $display("ADD PASS");
    else
        $display("ADD FAIL");

    // SUB
    A = 30; B = 15; opcode = 4'b0001;
    #10;
    if(result == 15)
        $display("SUB PASS");
    else
        $display("SUB FAIL");

    // AND
    A = 12; B = 10; opcode = 4'b0010;
    #10;
    if(result == (12 & 10))
        $display("AND PASS");
    else
        $display("AND FAIL");

    // OR
    A = 12; B = 10; opcode = 4'b0011;
    #10;
    if(result == (12 | 10))
        $display("OR PASS");
    else
        $display("OR FAIL");

    // XOR
    A = 12; B = 10; opcode = 4'b0100;
    #10;
    if(result == (12 ^ 10))
        $display("XOR PASS");
    else
        $display("XOR FAIL");

    // NOT
    A = 12; opcode = 4'b0101;
    #10;
    if(result == ~12)
        $display("NOT PASS");
    else
        $display("NOT FAIL");

    // Shift Left
    A = 5; opcode = 4'b0110;
    #10;
    if(result == (5 << 1))
        $display("SLL PASS");
    else
        $display("SLL FAIL");

    // Shift Right
    A = 8; opcode = 4'b0111;
    #10;
    if(result == (8 >> 1))
        $display("SRL PASS");
    else
        $display("SRL FAIL");

    // Equal
    A = 10; B = 10; opcode = 4'b1000;
    #10;
    if(result == 1)
        $display("EQ PASS");
    else
        $display("EQ FAIL");

    // Less Than
    A = 5; B = 10; opcode = 4'b1001;
    #10;
    if(result == 1)
        $display("SLT PASS");
    else
        $display("SLT FAIL");

    $display("========================================");
    $display("Simulation Finished");
    $display("========================================");

    $finish;

end

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);
end

endmodule