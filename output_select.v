module output_select(
    input wire [3:0] select,
    input wire [15:0] x_sin_cos,
    input wire [15:0] y_sin_cos,
    input wire [15:0] angle_sin_cos,

    output wire [15:0] CORDIC_OUT
);

parameter  k = 16'b0000000010011011;

always @(*) begin
    if (select[0])
        CORDIC_OUT = ;
    else if (select[1])
        CORDIC_OUT = ;
    else if (select[2])
        CORDIC_OUT = ;
    else if (select[3])
        CORDIC_OUT = angle_sin_cos;
    
end







endmodule