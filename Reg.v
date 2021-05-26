module reg (
    input clk,
    input reg_en,
    input wire [15:0] reg_in,

    output reg [15:0] reg_out 
);
    
always @(posedge clk) begin
    if (reg_en)
        reg_out <= reg_in;
end

endmodule