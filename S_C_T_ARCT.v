module S_C_T_ARCT (
    input clk,
    input reg_en,
    input wire [3:0] select, 
    input wire [15:0] x_init,
    input wire [15:0] y_init,
    input wire [15:0] target_angle,

    output wire [15:0] x_out,
    output wire [15:0] y_out,
    output wire [15:0] angle_out,
    output wire [3:0] select_out
);


parameter  angle_45 = 16'b0010110100000000;
parameter  angle_26 = 16'b0001101010010000;
parameter  angle_14 = 16'b0000111000001001;
parameter  angle_7 = 16'b0000011100100000;
parameter  angle_3 = 16'b0000001110010011;
parameter  angle_1 = 16'b0000000111001010;
//1
wire [15:0] ALU1_x_out;
wire [15:0] ALU1_y_out;
wire [15:0] ALU1_angle_out;

wire [15:0] reg1_x_out;
wire [15:0] reg1_y_out;
wire [15:0] reg1_angle_out;

//2
wire [15:0] ALU2_x_out;
wire [15:0] ALU2_y_out;
wire [15:0] ALU2_angle_out;

wire [15:0] reg2_x_out;
wire [15:0] reg2_y_out;
wire [15:0] reg2_angle_out;

//3
wire [15:0] ALU3_x_out;
wire [15:0] ALU3_y_out;
wire [15:0] ALU3_angle_out;

wire [15:0] reg3_x_out;
wire [15:0] reg3_y_out;
wire [15:0] reg3_angle_out;

//4
wire [15:0] ALU4_x_out;
wire [15:0] ALU4_y_out;
wire [15:0] ALU4_angle_out;

wire [15:0] reg4_x_out;
wire [15:0] reg4_y_out;
wire [15:0] reg4_angle_out;

//5
wire [15:0] ALU5_x_out;
wire [15:0] ALU5_y_out;
wire [15:0] ALU5_angle_out;

wire [15:0] reg5_x_out;
wire [15:0] reg5_y_out;
wire [15:0] reg5_angle_out;

//6
wire [15:0] ALU6_x_out;
wire [15:0] ALU6_y_out;
wire [15:0] ALU6_angle_out;


//1
ALU_TOP u1_ALU_TOP(
    .x_init(x_init),
    .y_init(y_init),
    .x_shift(x_init),
    .y_shift(y_init),
    .target_angle(target_angle),
    .select(select),
    .angle(16'd0),
    .delta_angle(agnle_45),

    .x_out(ALU1_x_out),
    .y_out(ALU1_y_out),
    .angle_out(ALU1_angle_out)
);

REG_TOP u1_REG_TOP(
    .clk(clk),
    .reg_en(reg_en),
    .x(ALU1_x_out),
    .y(ALU1_y_out),
    .angle(ALU1_angle_out),

    .x_out(reg1_x_out),
    .y_out(reg1_y_out),
    .angle_out(reg1_angle_out)
);


//2
ALU_TOP u2_ALU_TOP(
    .x_init(reg1_x_out),
    .y_init(reg1_y_out),
    .x_shift({1{0},reg1_x_out[15:1]}),
    .y_shift({1{0},reg1_y_out[15:1]}),
    .target_angle(target_angle),
    .angle(reg1_angle_out),
    .delta_angle(angle_26),

    .x_out(ALU2_x_out),
    .y_out(ALU2_y_out),
    .angle_out(ALU2_angle_out)
);

REG_TOP u2_REG_TOP(
    .clk(clk),
    .reg_en(reg_en),
    .x(ALU2_x_out),
    .y(ALU2_y_out),
    .angle(ALU2_angle_out),

    .x_out(reg2_x_out),
    .y_out(reg2_y_out),
    .angle_out(reg2_angle_out)
);

ALU_TOP u3_ALU_TOP(
    .x_init(reg2_x_out),
    .y_init(reg2_y_out),
    .x_shift({2{0},reg2_x_out[15:2]}),
    .y_shift({2{0},reg2_y_out[15:2]}),
    .target_angle(target_angle),
    .angle(reg2_angle_out),
    .delta_angle(angle_14),

    .x_out(ALU3_x_out),
    .y_out(ALU3_y_out),
    .angle_out(ALU3_angle_out)
);

REG_TOP u3_REG_TOP(
    .clk(clk),
    .reg_en(reg_en),
    .x(ALU3_x_out),
    .y(ALU3_y_out),
    .angle(ALU3_angle_out),

    .x_out(reg3_x_out),
    .y_out(reg3_y_out),
    .angle_out(reg3_angle_out)
);

ALU_TOP u4_ALU_TOP(
    .x_init(reg3_x_out),
    .y_init(reg3_y_out),
    .x_shift({3{0},reg3_x_out[15:3]}),
    .y_shift({3{0},reg3_y_out[15:3]}),
    .target_angle(target_angle),
    .angle(reg3_angle_out),
    .delta_angle(angle_7),

    .x_out(ALU4_x_out),
    .y_out(ALU4_y_out),
    .angle_out(ALU4_angle_out)
);

REG_TOP u4_REG_TOP(
    .clk(clk),
    .reg_en(reg_en),
    .x(ALU4_x_out),
    .y(ALU4_y_out),
    .angle(ALU4_angle_out),

    .x_out(reg4_x_out),
    .y_out(reg4_y_out),
    .angle_out(reg4_angle_out)
);

ALU_TOP u5_ALU_TOP(
    .x_init(reg4_x_out),
    .y_init(reg4_y_out),
    .x_shift({4{0},reg4_x_out[15:4]}),
    .y_shift({4{0},reg4_y_out[15:4]}),
    .target_angle(target_angle),
    .angle(reg4_angle_out),
    .delta_angle(angle_3),

    .x_out(ALU5_x_out),
    .y_out(ALU5_y_out),
    .angle_out(ALU5_angle_out)
);

REG_TOP u5_REG_TOP(
    .clk(clk),
    .reg_en(reg_en),
    .x(ALU5_x_out),
    .y(ALU5_y_out),
    .angle(ALU5_angle_out),

    .x_out(reg5_x_out),
    .y_out(reg5_y_out),
    .angle_out(reg5_angle_out)
);

ALU_TOP u6_ALU_TOP(
    .x_init(reg5_x_out),
    .y_init(reg5_y_out),
    .x_shift({5{0},reg5_x_out[15:5]}),
    .y_shift({5{0},reg5_y_out[15:5]}),
    .target_angle(target_angle),
    .angle(reg5_angle_out),
    .delta_angle(angle_1),

    .x_out(x_out),
    .y_out(y_out),
    .angle_out(angle_out)
);



endmodule