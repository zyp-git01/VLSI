//此模块用于将16位的整数角度输入转换成0~90
//其中infor信号用于表示转换前的原信号的一些信息
//𝒄𝒐𝒔 𝝓 + 𝟗𝟎° = −𝒔𝒊𝒏𝝓
//𝒔𝒊𝒏 𝝓 + 𝟗𝟎° = 𝒄𝒐𝒔𝝓
//𝒄𝒐𝒔 𝝓 + 𝟏𝟖𝟎° = −𝒄𝒐𝒔𝝓
//𝒔𝒊𝒏 𝝓 + 𝟏𝟖𝟎° = −𝒔𝒊𝒏𝝓

//当需要求解arctan时，需要输入x和y，
//这时候就需要两个输入，其中第二个输入为another信号

module init (
    input clk,
    input  [15:0] in_angle,
    input signed [15:0] another,
    input wire [3:0] select,
    input wire valid,

    output reg [31:0] x,
    output reg [31:0] y,
    output reg [31:0] out_angle,
    output reg [3:0] select_out,
    output reg valid_init_out
);

always @(posedge clk) begin
    if (valid)
        x <= select[3] ? {in_angle,{16{0}}} : 32'h00010000;
end

always @(posedge clk) begin
    if (valid)
        y <= select[3] ? {another,{16{0}}} :32'h00000000;
end 

always @(posedge clk) begin
    if (valid)
        out_angle <= select[3] ? 32'h00000000: {in_angle,{16'h0000}};
end

always @(posedge clk) begin
    if (valid)
        valid_init_out <= 1'b1;
    else
        valid_init_out <= 1'b0;
end

always @(posedge clk) begin
    if (valid)
        select_out <= select;
end

endmodule