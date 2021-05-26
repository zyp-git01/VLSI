module REG_TOP (
    input clk,
    input reg_en,
    input wire [15:0] x,
    input wire [15:0] y,
    input wire [15:0] angle,

    output wire [15:0] x_out,
    output wire [15:0] y_out,
    output wire [15:0] angle_out
);


Reg u_x_Reg(
    .clk(clk),
    .reg_en(reg_en)
    .reg_in(x),
    .reg_out(x_out)
);

Reg u_y_Reg(
    .clk(clk),
    .reg_en(reg_en)
    .reg_in(y),
    .reg_out(y_out)
);


Reg u_angle_Reg(
    .clk(clk),
    .reg_en(reg_en)
    .reg_in(angle),
    .reg_out(angle_out)
);




endmodule