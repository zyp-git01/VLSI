module output_select(
    input clk,
    input wire [3:0] select,
    input wire [31:0] x,
    input wire [31:0] y,
    input wire [31:0] angle,
    input wire valid_in,

    output wire [31:0] CORDIC_OUT,
    output reg valid_out
);

parameter  k = 32'h00009b7b;

wire [31:0] CORDIC_sin_out;
wire [31:0] CORDIC_cos_out;
wire [31:0] CORDIC_tan_out;


always @(posedge clk) begin
    if (valid_in)
        valid_out <= valid_in;
end


assign CORDIC_OUT = select[0] ?CORDIC_sin_out:(select[1]?CORDIC_cos_out:(select[2]?CORDIC_tan_out:angle));

qmult #(16,32) uut_cos(k,x,CORDIC_cos_out);
qmult #(16,32) uut_sin(k,y,CORDIC_sin_out);










endmodule