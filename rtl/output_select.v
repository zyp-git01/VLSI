module output_select(
    input clk,
    input wire [3:0] select,
    input wire [23:0] x,
    input wire [23:0] y,
    input wire [23:0] angle,
    input wire valid_in,

    output reg [23:0] CORDIC_OUT,
    output reg valid_out
);

parameter  k = 16'b0000000010011011;

always @(posedge clk) begin
    if (select[0])      //sin
        CORDIC_OUT <= k * y;
    else if (select[1]) //cos
        CORDIC_OUT <= k * x;
    else if (select[2]) //tan待定
        CORDIC_OUT <= 0;
    else if (select[3])
        CORDIC_OUT <= angle;
    
end


always @(posedge clk) begin
    if (valid_in)
        valid_out <= valid_in;
end




endmodule