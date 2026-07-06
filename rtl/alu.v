module alu #(
    parameter WIDTH = 32
)(
    input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,
    input [3:0] opcode,

    output reg [WIDTH-1:0] result,
    output reg zero,
    output reg carry,
    output reg overflow,
    output reg negative
);

reg [WIDTH:0] temp;

always @(*) begin

    result = 0;
    carry = 0;
    overflow = 0;

    case(opcode)

        4'b0000: begin
            temp = A + B;
            result = temp[WIDTH-1:0];
            carry = temp[WIDTH];
            overflow = (~(A[WIDTH-1]^B[WIDTH-1])) &
                       (A[WIDTH-1]^result[WIDTH-1]);
        end

        4'b0001: begin
            temp = A - B;
            result = temp[WIDTH-1:0];
            carry = temp[WIDTH];
            overflow = (A[WIDTH-1]^B[WIDTH-1]) &
                       (A[WIDTH-1]^result[WIDTH-1]);
        end

        4'b0010:
            result = A & B;

        4'b0011:
            result = A | B;

        4'b0100:
            result = A ^ B;

        4'b0101:
            result = ~A;

        4'b0110:
            result = A << 1;

        4'b0111:
            result = A >> 1;

        4'b1000:
            result = (A == B);

        4'b1001:
            result = ($signed(A) < $signed(B));

        default:
            result = 0;

    endcase

    zero = (result == 0);
    negative = result[WIDTH-1];

end

endmodule
