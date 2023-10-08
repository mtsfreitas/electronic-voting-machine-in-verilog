`include "trabalho_pratico2.v"
module trabalho_pratico2_testbench();

	reg clock, finish, valid;
	reg [3:0] digit;
	wire votestatus;

	wire [7:0] totalvotos_nulos;
	wire [7:0] totalvotos_matheus;
	wire [7:0] totalvotos_luis;
	wire [7:0] totalvotos_vinicius;
	wire [7:0] totalvotos_random;

	reg [7:0] totalvotos_nulos_externo;
	reg [7:0] totalvotos_matheus_externo;
	reg [7:0] totalvotos_luis_externo;
	reg [7:0] totalvotos_vinicius_externo;
	reg [7:0] totalvotos_random_externo;

	always begin
		#1 clock = ~clock;
	end

	initial begin
		$dumpfile("trabalho_pratico2_testbench.vcd");
		$dumpvars(0, trabalho_pratico2_testbench);
		$display("Tempo\t clock\t finish\t valid\t digit\t votestatus \tC1 \tC2 \tC3 \tC4 \tVotos Nulos");
		$monitor("%g\t %b\t %b\t %b\t %b\t %b\t       %d\t%d\t%d\t%d\t%d", $time, clock, finish, valid, digit, votestatus, totalvotos_matheus_externo, totalvotos_luis_externo, totalvotos_vinicius_externo, totalvotos_random_externo, totalvotos_nulos_externo);
		clock = 0;
		finish = 0;
		valid = 0;


		// MATRICULA 3031

		#2 digit = 3;
		#2 valid = 1;
		#2 valid = 0;
		#2 digit = 0;
		#2 valid = 1;
		#2 valid = 0;
		#2 digit = 3;
		#2 valid = 1;
		#2 valid = 0;
		#2 digit = 1;
		#2 valid = 1;
		#2 valid = 0;
		#2 valid = 1;
		#2 valid = 0;

		// MATRICULA 3009

		#2 digit = 3;
		#2 valid = 1;
		#2 valid = 0;
		#2 digit = 0;
		#2 valid = 1;
		#2 valid = 0;
		#2 digit = 0;
		#2 valid = 1;
		#2 valid = 0;
		#2 digit = 9;
		#2 valid = 1;
		#2 valid = 0;
		#2 valid = 1;
		#2 valid = 0;


		// MATRICULA 2670


		#2 digit = 2;
		#2 valid = 1;
		#2 valid = 0;
		#2 digit = 6;
		#2 valid = 1;
		#2 valid = 0;
		#2 digit = 7;
		#2 valid = 1;
		#2 valid = 0;
		#2 digit = 0;
		#2 valid = 1;
		#2 valid = 0;
		#2 valid = 1;
		#2 valid = 0;

		// MATRICULA 2668


		#2 digit = 2;
		#2 valid = 1;
		#2 valid = 0;
		#2 digit = 6;
		#2 valid = 1;
		#2 valid = 0;
		#2 digit = 6;
		#2 valid = 1;
		#2 valid = 0;
		#2 digit = 8;
		#2 valid = 1;
		#2 valid = 0;
		#2 valid = 1;
		#2 valid = 0;

		// MATRICULA 2318 (INVALIDA)


		#2 digit = 2;
		#2 valid = 1;
		#2 valid = 0;
		#2 digit = 3;
		#2 valid = 1;
		#2 valid = 0;
		#2 digit = 1;
		#2 valid = 1;
		#2 valid = 0;
		#2 digit = 8;
		#2 valid = 1;
		#2 valid = 0;
		#2 valid = 1;
		#2 valid = 0;



		#2 finish = 1;
		#2 $finish;
	end

	always @ (finish) begin
		if(finish) begin
			totalvotos_nulos_externo <= totalvotos_nulos;
			totalvotos_matheus_externo <= totalvotos_matheus;
			totalvotos_luis_externo <= totalvotos_luis;
			totalvotos_vinicius_externo <= totalvotos_vinicius;
			totalvotos_random_externo <= totalvotos_random;
		end
		else begin
			totalvotos_nulos_externo <= 0;
			totalvotos_matheus_externo <= 0;
			totalvotos_luis_externo <= 0;
			totalvotos_vinicius_externo <= 0;
			totalvotos_random_externo <= 0;
		end
	end

	trabalho_pratico2 F_trabalho_pratico2(
		.clock(clock),
		.finish(finish),
		.valid(valid),
		.digit(digit),
		.votestatus(votestatus),
		.totalvotos_matheus(totalvotos_matheus),
		.totalvotos_luis(totalvotos_luis),
		.totalvotos_vinicius(totalvotos_vinicius),
		.totalvotos_nulos(totalvotos_nulos),
		.totalvotos_random(totalvotos_random)
	);

endmodule
