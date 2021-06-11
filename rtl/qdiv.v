module qdiv #(
    parameter Q = 15,
    parameter N = 32
)
(
    input [N-1:0] dividend,
    input [N-1:0] divisor,
    input start,
    input clk,
    output [N-1:0] quotient_out,
    output complete
);

reg [N-1:0] quotient;
reg [N-1:0] dividend_copy;
reg [2*(N-1)-1:0] divider_copy;

reg [5:0] bit_count;

reg done;

initial done = 1;

assign quotient_out = quotient;

assign complete = done;

always @(posedge clk) begin
    if (done && start) begin
        done <= 1'b0;
        bit_count <= N+Q-2;
        quotient <= 0;
        dividend_copy <= {1'b0,dividend[N-2:0]};

        divider_copy[2*(N-1)-1] <= 0;
        divider_copy[2*(N-1)-2:N-2] <= divisor[N-2:0];
        divider_copy[N-3:0] <= 0;

        if ((dividend[N-1] == 1 && divisor[N-1] == 0)||
            (dividend[N-1] == 0 && divisor[N-1] == 1))
            quotient[N-1] <= 1;
        else
            quotient[N-1] <= 0;
    end
    else if (!done) begin
        if (dividend_copy >= divider_copy) begin
            dividend_copy <= dividend_copy - divider_copy;

            quotient[bit_count] <= 1'b1;
        end
        divider_copy <= divider_copy >> 1;

        if (bit_count == 0)
            done <= 1'b1;
        bit_count <= bit_count - 1;
    end
end



endmodule