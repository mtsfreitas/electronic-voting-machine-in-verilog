module mux_2x1(
  entrada_0,
  entrada_1,
  seletor,
  saida
);

input wire [7:0] entrada_0;
input wire [7:0] entrada_1;
input wire 		 seletor;
output reg [7:0] saida;

always @ (*) begin
  case (seletor)
    0:begin
      saida = entrada_0;
    end
    1:begin
      saida = entrada_1;
    end
  endcase
end

endmodule
