module ALU_TOP (
    input signed wire [15:0] x_init,
    input signed wire [15:0] y_init,
    input signed wire [15:0] x_shift,
    input signed wire [15:0] y_shift,

    input  wire [15:0] angle,
    input wire [15:0] delta_angle

    output signed wire [15:0] x_out,
    output signed wire [15:0] y_out,
    output wire [15:0] angle_out
);
    
endmodule