module S_C_T_ARCT (
    input clk,
    input reg_en,
    input wire valid,
    input wire [3:0] select, 
    input wire [31:0] x_init,
    input wire [31:0] y_init,
    input wire [31:0] target_angle,

    output wire [31:0] x_out,
    output wire [31:0] y_out,
    output wire ALU_valid_out,
    output wire [31:0] angle_out,
    output wire [3:0] select_out
);

//32位中，16位小数
parameter  angle_45 = 32'h002d0000;
parameter  angle_26 = 32'h001a90a3;
parameter  angle_14 = 32'h000e0937;
parameter  angle_7 = 32'h00072000;
parameter  angle_3 = 32'h00039388;
parameter  angle_1 = 32'h0001ca36;


//1
wire [31:0] ALU1_x_out;
wire [31:0] ALU1_y_out;
wire [31:0] ALU1_angle_out;
wire ALU1_valid_out;
wire [3:0] ALU1_select_out;
wire [31:0] ALU1_target_angle_out;

wire [3:0] reg1_select_out;
wire [31:0] reg1_target_angle_out;

wire reg1_valid_out;
wire [31:0] reg1_x_out;
wire [31:0] reg1_y_out;
wire [31:0] reg1_angle_out;

//2

wire [31:0] ALU2_x_out;
wire [31:0] ALU2_y_out;
wire [31:0] ALU2_angle_out;
wire ALU2_valid_out;
wire [3:0] ALU2_select_out;
wire [31:0] ALU2_target_angle_out;

wire [3:0] reg2_select_out;
wire [31:0] reg2_target_angle_out;
wire reg2_valid_out;
wire [31:0] reg2_x_out;
wire [31:0] reg2_y_out;
wire [31:0] reg2_angle_out;

//3
wire [31:0] ALU3_x_out;
wire [31:0] ALU3_y_out;
wire [31:0] ALU3_angle_out;
wire ALU3_valid_out;
wire [3:0] ALU3_select_out;
wire [31:0] ALU3_target_angle_out;

wire [3:0] reg3_select_out;
wire [31:0] reg3_target_angle_out;
wire reg3_valid_out;
wire [31:0] reg3_x_out;
wire [31:0] reg3_y_out;
wire [31:0] reg3_angle_out;

//4
wire [31:0] ALU4_x_out;
wire [31:0] ALU4_y_out;
wire [31:0] ALU4_angle_out;
wire ALU4_valid_out;
wire [3:0] ALU4_select_out;
wire [31:0] ALU4_target_angle_out;

wire [3:0] reg4_select_out;
wire [31:0] reg4_target_angle_out;
wire reg4_valid_out;
wire [31:0] reg4_x_out;
wire [31:0] reg4_y_out;
wire [31:0] reg4_angle_out;

//5
wire [31:0] ALU5_x_out;
wire [31:0] ALU5_y_out;
wire [31:0] ALU5_angle_out;
wire ALU5_valid_out;
wire [3:0] ALU5_select_out;
wire [31:0] ALU5_target_angle_out;

wire [3:0] reg5_select_out;
wire [31:0] reg5_target_angle_out;
wire reg5_valid_out;
wire [31:0] reg5_x_out;
wire [31:0] reg5_y_out;
wire [31:0] reg5_angle_out;


//1
ALU_TOP u1_ALU_TOP(
    .x_init(x_init),
    .y_init(y_init),
    .x_shift(x_init),
    .y_shift(y_init),
    .target_angle(target_angle),
    .select(select),
    .valid(valid),
    .angle(32'd0),
    .delta_angle(angle_45),

    .x_out(ALU1_x_out),
    .y_out(ALU1_y_out),
    .angle_out(ALU1_angle_out),
    .select_out(ALU1_select_out),
    .target_angle_out(ALU1_target_angle_out),
    .ALU_valid_out(ALU1_valid_out)
);

REG_TOP u1_REG_TOP(
    .clk(clk),
    .reg_en(reg_en),
    .x(ALU1_x_out),
    .y(ALU1_y_out),
    .angle(ALU1_angle_out),
    .reg_select_in(ALU1_select_out),
    .reg_target_angle_in(ALU1_target_angle_out),
    .reg_valid_in(ALU1_valid_out),

    
    .x_out(reg1_x_out),
    .y_out(reg1_y_out),
    .reg_select_out(reg1_select_out),
    .reg_target_angle_out(reg1_target_angle_out),
    .angle_out(reg1_angle_out),
    .reg_valid_out(reg1_valid_out)
);


//2
ALU_TOP u2_ALU_TOP(
    .x_init(reg1_x_out),
    .y_init(reg1_y_out),
    .x_shift({{1'b0},reg1_x_out[31:1]}),
    .y_shift({{1'b0},reg1_y_out[31:1]}),
    .target_angle(target_angle),
    .select(reg1_select_out),
    .angle(reg1_angle_out),
    .delta_angle(angle_26),
    .valid(reg1_valid_out),

    .x_out(ALU2_x_out),
    .y_out(ALU2_y_out),
    .angle_out(ALU2_angle_out),
    .select_out(ALU2_select_out),
    .target_angle_out(ALU2_target_angle_out),
    .ALU_valid_out(ALU2_valid_out)
);

REG_TOP u2_REG_TOP(
    .clk(clk),
    .reg_en(reg_en),
    .x(ALU2_x_out),
    .y(ALU2_y_out),
    .angle(ALU2_angle_out),
    .reg_select_in(ALU2_select_out),
    .reg_target_angle_in(ALU2_target_angle_out),
    .reg_valid_in(ALU2_valid_out),

    .x_out(reg2_x_out),
    .y_out(reg2_y_out),
    .reg_select_out(reg2_select_out),
    .reg_target_angle_out(reg2_target_angle_out),
    .angle_out(reg2_angle_out),
    .reg_valid_out(reg2_valid_out)
);

ALU_TOP u3_ALU_TOP(
    .x_init(reg2_x_out),
    .y_init(reg2_y_out),
    .x_shift({{2'b00},reg2_x_out[31:2]}),
    .y_shift({{2'b00},reg2_y_out[31:2]}),
    .target_angle(target_angle),
    .select(reg2_select_out),
    .angle(reg2_angle_out),
    .delta_angle(angle_14),
    .valid(reg2_valid_out),

    .x_out(ALU3_x_out),
    .y_out(ALU3_y_out),
    .ALU_valid_out(ALU3_valid_out),
    .angle_out(ALU3_angle_out),
    .target_angle_out(ALU3_target_angle_out),
    .select_out(ALU3_select_out)
);

REG_TOP u3_REG_TOP(
    .clk(clk),
    .reg_en(reg_en),
    .x(ALU3_x_out),
    .y(ALU3_y_out),
    .angle(ALU3_angle_out),
    .reg_valid_in(ALU3_valid_out),
    .reg_target_angle_in(ALU3_target_angle_out),
    .reg_select_in(ALU3_select_out),

    .x_out(reg3_x_out),
    .y_out(reg3_y_out),
    .reg_valid_out(reg3_valid_out),
    .angle_out(reg3_angle_out),
    .reg_select_out(reg3_select_out),
    .reg_target_angle_out(reg3_target_angle_out)

);

ALU_TOP u4_ALU_TOP(
    .x_init(reg3_x_out),
    .y_init(reg3_y_out),
    .x_shift({{3'b000},reg3_x_out[31:3]}),
    .y_shift({{3'b000},reg3_y_out[31:3]}),
    .target_angle(target_angle),
    .select(reg3_select_out),
    .angle(reg3_angle_out),
    .delta_angle(angle_7),
    .valid(reg3_valid_out),

    .x_out(ALU4_x_out),
    .y_out(ALU4_y_out),
    .angle_out(ALU4_angle_out),
    .select_out(ALU4_select_out),
    .target_angle_out(ALU4_target_angle_out),
    .ALU_valid_out(ALU4_valid_out)
);

REG_TOP u4_REG_TOP(
    .clk(clk),
    .reg_en(reg_en),
    .x(ALU4_x_out),
    .y(ALU4_y_out),
    .angle(ALU4_angle_out),
    .reg_target_angle_in(ALU4_target_angle_out),
    .reg_select_in(ALU4_select_out),
    .reg_valid_in(ALU4_valid_out),

    .x_out(reg4_x_out),
    .y_out(reg4_y_out),
    .angle_out(reg4_angle_out),
    .reg_valid_out(reg4_valid_out),
    .reg_target_angle_out(reg4_target_angle_out),
    .reg_select_out(reg4_select_out)
);

ALU_TOP u5_ALU_TOP(
    .x_init(reg4_x_out),
    .y_init(reg4_y_out),
    .x_shift({{4'b0000},reg4_x_out[31:4]}),
    .y_shift({{4'b0000},reg4_y_out[31:4]}),
    .target_angle(target_angle),
    .angle(reg4_angle_out),
    .select(reg4_select_out),
    .delta_angle(angle_3),
    .valid(reg4_valid_out),

    .x_out(ALU5_x_out),
    .y_out(ALU5_y_out),
    .ALU_valid_out(ALU5_valid_out),
    .select_out(ALU5_select_out),
    .target_angle_out(ALU5_target_angle_out),
    .angle_out(ALU5_angle_out)
);

REG_TOP u5_REG_TOP(
    .clk(clk),
    .reg_en(reg_en),
    .x(ALU5_x_out),
    .y(ALU5_y_out),
    .angle(ALU5_angle_out),
    .reg_valid_in(ALU5_valid_out),
    .reg_select_in(ALU5_select_out),
    .reg_target_angle_in(ALU5_target_angle_out),

    .x_out(reg5_x_out),
    .y_out(reg5_y_out),
    .reg_valid_out(reg5_valid_out),
    .reg_select_out(reg5_select_out),
    .reg_target_angle_out(reg5_target_angle_out),
    .angle_out(reg5_angle_out)
);

ALU_TOP u6_ALU_TOP(
    .x_init(reg5_x_out),
    .y_init(reg5_y_out),
    .x_shift({{5'b00000},reg5_x_out[31:5]}),
    .y_shift({{5'b00000},reg5_y_out[31:5]}),
    .target_angle(target_angle),
    .select(reg5_select_out),
    .angle(reg5_angle_out),
    .delta_angle(angle_1),
    .valid(reg5_valid_out),
    

    .x_out(x_out),
    .y_out(y_out),
    .ALU_valid_out(ALU_valid_out),
    .select_out(select_out),
    .target_angle_out(),
    .angle_out(angle_out)
);



endmodule