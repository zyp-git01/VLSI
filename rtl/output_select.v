module output_select(
    input clk,
    input wire [3:0] select,
    input wire [23:0] x,
    input wire [23:0] y,
    input wire [23:0] angle,
    input wire valid_in,

    output reg [23:0] CORDIC_OUT,
    output reg valid_out
);

parameter  k = 16'b0000000010011011;

wire u0_floating_out_ready;
wire u0_floating_out_valid;

wire u1_floating_out_ready;
wire u1_floating_out_valid;
floating_point_0 u0_floating_point(
  .aclk(clk),
  .s_axis_a_tvalid(select[0]),
  .s_axis_a_tready(valid_in),
  .s_axis_a_tdata(k),
  .s_axis_b_tvalid(select[0]),
  .s_axis_b_tready(valid_in),
  .s_axis_b_tdata(y[15:0]),
  .m_axis_result_tvalid(u0_floaring_out_valid),
  .m_axis_result_tready(u0_floating_ready),
  .m_axis_result_tdata(CODIC_OUT)
);

always @(posedge clk) begin
    if (select[0])      //sin
        CORDIC_OUT <= k * y;
    else if (select[1]) //cos
        CORDIC_OUT <= k * x;
    else if (select[2]) //tan待定
        CORDIC_OUT <= 0;
    else if (select[3])
        CORDIC_OUT <= angle;
    
end


always @(posedge clk) begin
    if (valid_in)
        valid_out <= valid_in;
end




endmodule