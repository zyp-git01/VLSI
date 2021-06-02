`timescale 1ps/1ps

module sim(

);



reg clk;



initial begin
    #10 clk <= 1'b1;
end


always@(*) begin
    #5 clk <= ~clk;
end

wire [15:0] CORDIC_OUT;
wire out_valid;
CORDIC u_CORDIC(
    .clk(clk),
    .in_angle(16'h1e00),
    .valid(1'b1),
    .select(4'b0001),
    .another(16'h0000),

    .CORDIC_OUT(CORDIC_OUT),
    .out_valid(out_valid)
);

endmodule