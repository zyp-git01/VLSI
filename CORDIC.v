
// CORDIC协处理器的输入角度为16位有符号整数，采用角度制（例如90 = 90°）；输出的计算结果采用16位
// 有符号定点数，补码表示，即1位符号位+7位整数位+8位小数位。支持输出不同的三角函数的计算结果：
// sin，cos，tan，arctan。输出的选择通过软件进行配置。
// 最多六次迭代
//因此需要有一个判断信号(d_i)，0代表顺时针旋转，1代表逆时针旋转
module  CORDIC(
    input clk,
    input wire [15:0] in_angle,
    input wire start,
    input wire [3:0] select,

    output wire [15:0] CORDIC_OUT
);
wire [15:0] x_init_out;
wire [15:0] y_init_out;
wire [15:0] angle_init_out;
init u_init(
    .in_angle(in_angle),
    .infor(),
    .x(x_init_out),
    .y(y_init_out),
    .out_angle(angle_init_out)
);

ALU_TOP u1_ALU_TOP(
    .x_init(),
    .y_init(),
    .x_shift(),
    .y_shift(),
    .target_angle(),
    .angle(),
    .delta_angle,

    .x_out(),
    .y_out(),
    .angle_out()
);

REG_TOP u1_REG_TOP(
    .clk(),
    .reg_en(),
    .x(),
    .y(),
    .angle(),

    .x_out(),
    .y_out(),
    .angle_out()
);

ALU_TOP u2_ALU_TOP(
    .x_init(),
    .y_init(),
    .x_shift(),
    .y_shift(),
    .target_angle(),
    .angle(),
    .delta_angle,

    .x_out(),
    .y_out(),
    .angle_out()
);

REG_TOP u2_REG_TOP(
    .clk(),
    .reg_en(),
    .x(),
    .y(),
    .angle(),

    .x_out(),
    .y_out(),
    .angle_out()
);

ALU_TOP u3_ALU_TOP(
    .x_init(),
    .y_init(),
    .x_shift(),
    .y_shift(),
    .target_angle(),
    .angle(),
    .delta_angle,

    .x_out(),
    .y_out(),
    .angle_out()
);

REG_TOP u3_REG_TOP(
    .clk(),
    .reg_en(),
    .x(),
    .y(),
    .angle(),

    .x_out(),
    .y_out(),
    .angle_out()
);

ALU_TOP u4_ALU_TOP(
    .x_init(),
    .y_init(),
    .x_shift(),
    .y_shift(),
    .target_angle(),
    .angle(),
    .delta_angle,

    .x_out(),
    .y_out(),
    .angle_out()
);

REG_TOP u4_REG_TOP(
    .clk(),
    .reg_en(),
    .x(),
    .y(),
    .angle(),

    .x_out(),
    .y_out(),
    .angle_out()
);

ALU_TOP u5_ALU_TOP(
    .x_init(),
    .y_init(),
    .x_shift(),
    .y_shift(),
    .target_angle(),
    .angle(),
    .delta_angle,

    .x_out(),
    .y_out(),
    .angle_out()
);

REG_TOP u5_REG_TOP(
    .clk(),
    .reg_en(),
    .x(),
    .y(),
    .angle(),

    .x_out(),
    .y_out(),
    .angle_out()
);

ALU_TOP u6_ALU_TOP(
    .x_init(),
    .y_init(),
    .x_shift(),
    .y_shift(),
    .target_angle(),
    .angle(),
    .delta_angle,

    .x_out(),
    .y_out(),
    .angle_out()
);


endmodule