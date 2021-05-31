module ALU_TOP (
    input signed wire [15:0] x_init,
    input signed wire [15:0] y_init,
    input signed wire [15:0] x_shift,
    input signed wire [15:0] y_shift,
    input wire [15:0] target_angle,
    input wire [3:0] select,
    input wire [15:0] angle,
    input wire [15:0] delta_angle,

    output signed wire [15:0] x_out,
    output signed wire [15:0] y_out,
    output wire [15:0] angle_out
);

wire d_i;

assign d_i = select[3]?y>:((angle < target_angle)?1'b1:1'b0);

ALU u_x_ALU(
    .data_in_one(x_init),
    .d_i(~d_i),
    .data_in_two(y_shift),
    .data_out(x_out)
);


ALU u_y_ALU(
    .data_in_one(y_init),
    .d_i(d_i),
    .data_in_two(x_shift),
    .data_out(y_out)    
);


ALU u_angle_ALU(
    .data_in_one(angle),
    .d_i(d_i),
    .data_in_two(delta_angle),
    .data_out(angle_out)
);
    

endmodule