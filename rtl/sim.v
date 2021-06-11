`timescale 1ps/1ps

module sim(

);



reg clk;

reg valid;

initial begin
    #10 clk <= 1'b1;

    valid <= 1'b1;

    #10 valid <= 1'b0;
end


always@(*) begin
    #5 clk <= ~clk;
end

wire [15:0] CORDIC_OUT;
wire out_valid;
CORDIC u_CORDIC(
    .clk(clk),
    .in_angle(16'h001e),
    .valid(valid),
    .select(4'b0100),
    .another(16'h0000),

    .CORDIC_OUT(CORDIC_OUT),
    .out_valid(out_valid)
);

endmodule