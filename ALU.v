
//需要判断当前角度是否大于待求角度，如果大于待求角度，则顺时针旋转。
//如果小于待求角度，则逆时针旋转
//因此需要有一个判断信号(d_i)，0代表顺时针旋转，1代表逆时针旋转

module ALU (
    input signed wire [15:0] data_in_one,
    input wire d_i,
    input signed wire [15:0] data_in_two,

    output signed wire [15:0] data_out
);
    assign data_out = d_i?(data_in_one + data_in_two):(data_in_one - data_in_two);
endmodule