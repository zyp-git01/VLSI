module Reg (
    input clk,
    input Reg_en,
    input wire [15:0] Reg_in,

    output wire [15:0] Reg_out 
);
    
always @(posedge clk) begin
    if (Reg_en)
        Reg_out <= Reg_in;
end

endmodule