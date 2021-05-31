//此模块用于将16位的整数角度输入转换成0~90
//其中infor信号用于表示转换前的原信号的一些信息
//𝒄𝒐𝒔 𝝓 + 𝟗𝟎° = −𝒔𝒊𝒏𝝓
//𝒔𝒊𝒏 𝝓 + 𝟗𝟎° = 𝒄𝒐𝒔𝝓
//𝒄𝒐𝒔 𝝓 + 𝟏𝟖𝟎° = −𝒄𝒐𝒔𝝓
//𝒔𝒊𝒏 𝝓 + 𝟏𝟖𝟎° = −𝒔𝒊𝒏𝝓

//当需要求解arctan时，需要输入x和y，
//这时候就需要两个输入，其中第二个输入为another信号

module init (
    input signed [15:0] in_angle,
    input signed [15:0] another,
    input wire [3:0] select,

    output [] infor,
    output signed wire [15:0] x,
    output signed wire [15:0] y,
    output wire [15:0] out_angle
);
    
assign x = select[3] ? in_angle : 16'h0001;
assign y = select[3] ? another : 16'h0000;


endmodule