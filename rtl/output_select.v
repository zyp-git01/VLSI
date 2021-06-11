module output_select(
    input clk,
    input wire [3:0] select,
    input wire [31:0] x,
    input wire [31:0] y,
    input wire [31:0] angle,
    input wire valid_in,

    output wire [16:0] CORDIC_OUT,
    output reg valid_out
);

parameter  k = 32'h00009b7b;

wire [31:0] CORDIC_sin_out;
wire [31:0] CORDIC_cos_out;
wire [31:0] CORDIC_tan_out;
wire tan_done;

always @(posedge clk) begin
    if (~select[2])
        valid_out <= valid_in;
    else
        valid_out <= tan_done;
end


assign CORDIC_OUT = select[0] ?CORDIC_sin_out[23:8]:(select[1]?CORDIC_cos_out[23:8]:(select[2]?CORDIC_tan_out[23:8]:angle[23:8]));

qmult #(16,32) uut_cos(k,x,CORDIC_cos_out);
qmult #(16,32) uut_sin(k,y,CORDIC_sin_out);


qdiv #(16,32) uut_tan(
    .dividend(CORDIC_sin_out),
    .divisor(CORDIC_cos_out),
    .start(valid_in && select[2]),
    .clk(clk),
    .quotient_out(CORDIC_tan_out),
    .complete(tan_done)
);









endmodule