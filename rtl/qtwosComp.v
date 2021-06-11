module qtwoComp
#(
    parameter Q = 15,
    parameter N = 32
)

(
    input [N-2:0] a,
    output [2*N-1:0] b
);

reg [2*N-1:0] flip;
reg [2*N-1:0] out;

assign b = out;
always @(a) begin
    flip <= ~a;
end

always @(flip) begin
    out <= flip + 1;
end


endmodule