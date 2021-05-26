
// CORDIC协处理器的输入角度为16位有符号整数，采用角度制（例如90 = 90°）；输出的计算结果采用16位
// 有符号定点数，补码表示，即1位符号位+7位整数位+8位小数位。支持输出不同的三角函数的计算结果：
// sin，cos，tan，arctan。输出的选择通过软件进行配置。
// 最多六次迭代
module  CORDIC(
    input clk,
    input wire [15:0] angle,
    input wire start,
    input wire [3:0] select,

    output wire [15:0] CORDIC_OUT
);
    
endmodule