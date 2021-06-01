module output_select(
    input wire [3:0] select,
    input wire [15:0] x,
    input wire [15:0] y,
    input wire [15:0] angle,

    output wire [15:0] CORDIC_OUT
);

parameter  k = 16'b0000000010011011;

always @(*) begin
    if (select[0])      //sin
        CORDIC_OUT = k * y_sin_cos;
    else if (select[1]) //cos
        CORDIC_OUT = k * x_sin_cos;
    else if (select[2]) //tan待定
        CORDIC_OUT = 0;
    else if (select[3])
        CORDIC_OUT = angle_sin_cos;
    
end







endmodule