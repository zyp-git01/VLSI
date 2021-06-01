
// CORDIC协处理器的输入角度为16位有符号整数，采用角度制（例如90 = 90°）；输出的计算结果采用16位
// 有符号定点数，补码表示，即1位符号位+7位整数位+8位小数位。支持输出不同的三角函数的计算结果：
// sin，cos，tan，arctan。输出的选择通过软件进行配置。
// 最多六次迭代
//因此需要有一个判断信号(d_i)，0代表顺时针旋转，1代表逆时针旋转

//in_angle已经是经过计算的，限制在0-90度之间的角度
//select信号中，0位表示sin有效，3位表示arctan
//当需要求解arctan时，需要输入x和y，
//这时候就需要两个输入，其中第二个输入为another信号

//别忘了输入是16位的整数，但被限制在0-90度。

//软件配置角度时就已经算好了，约束在0-90度
module  CORDIC(
    input clk,
    input wire [15:0] in_angle,
    input wire valid,
    input wire [3:0] select,
    input wire [15:0] another,

    output wire [15:0] CORDIC_OUT,
    output wire out_valid
);

//S_C_T_ARCT
wire [23:0] x_out;
wire [23:0] y_out;
wire [23:0] angle_out;
wire [3:0] select_out;
wire ALU_valid_out;

//init
wire [23:0] x_init_out;
wire [23:0] y_init_out;
wire [23:0] angle_init_out;
wire valid_init_out;

init u_init(
    .clk(clk),
    .in_angle(in_angle),
    .another(another),
    .select(select),
    .valid(valid),

    .x(x_init_out),
    .y(y_init_out),
    .out_angle(angle_init_out),
    .valid_init_out(valid_init_out)
);


S_C_T_ARCT u_SIN_COS_TOP(
    .clk(clk),
    .reg_en(1'b1), 
    .valid(valid_init_out)
    .select(select),
    .x_init(x_init_out),
    .y_init(y_init_out),
    .target_angle(in_angle),

    .x_out(x_out),
    .y_out(y_out),
    .ALU_valid_out(ALU_valid_out),
    .angle_out(angle_out),
    .select_out(select_out)
);

output_select u_output_select(
    .select(select_out),
    .x(x_out),
    .y(y_out),
    .angle(angle_out),
    .valid_in(ALU_valid_out),

    .CORDIC_OUT(CORDIC_OUT),
    .valid_out(out_valid)
);





endmodule