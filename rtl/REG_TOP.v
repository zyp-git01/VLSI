module REG_TOP (
    input clk,
    input reg_en,
    input wire [31:0] x,
    input wire [31:0] y,
    input wire [31:0] angle,
    input wire [3:0] reg_select_in,
    input wire [31:0] reg_target_angle_in,
    input wire reg_valid_in,

    output wire [31:0] x_out,
    output wire [31:0] y_out,
    output reg [3:0] reg_select_out,
    output reg [31:0] reg_target_angle_out,
    output wire [31:0] angle_out,
    output reg reg_valid_out
);

always @(posedge clk) begin
    if (reg_en)
        reg_valid_out <= reg_valid_in;
end

always @(posedge clk) begin
    if (reg_en)
        reg_target_angle_out <= reg_target_angle_in;
end

always @(posedge clk) begin
    if (reg_en)
        reg_select_out <= reg_select_in;
end


Reg u_x_Reg(
    .clk(clk),
    .reg_en(reg_en),
    .reg_in(x),
    .reg_out(x_out)
);

Reg u_y_Reg(
    .clk(clk),
    .reg_en(reg_en),
    .reg_in(y),
    .reg_out(y_out)
);


Reg u_angle_Reg(
    .clk(clk),
    .reg_en(reg_en),
    .reg_in(angle),
    .reg_out(angle_out)
);




endmodule