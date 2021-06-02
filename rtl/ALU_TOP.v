module ALU_TOP (
    input wire signed [23:0] x_init,
    input wire signed [23:0] y_init,
    input wire signed [23:0] x_shift,
    input wire signed [23:0] y_shift,
    input wire [23:0] target_angle,
    input wire [3:0] select,
    input wire valid,
    input wire [23:0] angle,
    input wire [23:0] delta_angle,

    output wire signed [23:0] x_out,
    output wire signed [23:0] y_out,
    output wire [23:0] angle_out,
    output wire [3:0] select_out,
    output wire [23:0] target_angle_out,
    output wire ALU_valid_out
);

wire d_i;

assign ALU_valid_out = valid;
assign target_angle_out = target_angle;
assign select_out = select;

assign d_i = select[3]?1'b1:((angle < target_angle)?1'b1:1'b0);

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