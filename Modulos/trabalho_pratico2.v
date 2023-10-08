module trabalho_pratico2(clock, 
finish, 
valid, 
digit, 
votestatus, 
totalvotos_matheus, 
totalvotos_luis, 
totalvotos_vinicius, 
totalvotos_nulos, 
totalvotos_random,
state,
next_state
);

	input wire clock;
	input wire finish;
	input wire valid;
	input wire [3:0] digit;
	output reg votestatus;
	
	output reg [7:0] totalvotos_nulos;
	output reg [7:0] totalvotos_matheus;
	output reg [7:0] totalvotos_luis;
	output reg [7:0] totalvotos_vinicius;
	output reg [7:0] totalvotos_random;

	parameter q0  = 4'b0000;
	parameter q1  = 4'b0001;
	parameter q2  = 4'b0010;
	parameter q3  = 4'b0011;
	parameter q4  = 4'b0100;
	parameter q5  = 4'b0101;
	parameter q6  = 4'b0110;
	parameter q7  = 4'b0111;
	parameter q8  = 4'b1000;
	parameter q9  = 4'b1001;
	parameter q10 = 4'b1010;
	parameter q11 = 4'b1011;
	parameter q12 = 4'b1100;
	parameter q13 = 4'b1101;

	output reg [3:0] state;
	output reg [3:0] next_state;
	reg resetar;
	initial begin
		state <= q0;
		votestatus <= 0;
		totalvotos_nulos <= 0;
		totalvotos_matheus <= 0;
		totalvotos_luis <= 0;
		totalvotos_vinicius <= 0;
		totalvotos_random <= 0;
		next_state<=q0;
		resetar <= 0;
	end
	
	always @ (posedge clock) begin
		
		if(finish) begin
			resetar = 1;
		end 
		else begin				
			if (valid == 1)begin
				if(next_state == q5) begin
					case(state) 
						q3:begin							
							totalvotos_matheus = totalvotos_matheus +1;							
						end
						q4: begin
							totalvotos_luis = totalvotos_luis +1;
						end
						q8: begin
							totalvotos_vinicius = totalvotos_vinicius +1;
						end						
						q13: begin
							totalvotos_random = totalvotos_random +1;
						end
					endcase
				end
				if(next_state == q12 && state != next_state) begin
					totalvotos_nulos = totalvotos_nulos+1;
				end
				state = next_state;
				case(state)
					q0: begin				
						votestatus = 0;		
					end
					q5: begin
						votestatus = 1;
					end
					q12: begin
						votestatus = 0;												
					end
					
				endcase
			end
			if(resetar) begin
				state = q0;
				votestatus = 0;			
				totalvotos_nulos = 0;
				totalvotos_matheus = 0;
				totalvotos_luis = 0;
				totalvotos_vinicius = 0;
				totalvotos_random = 0;
				resetar = 0;
			end
		end
	end
	
	
	always @ (valid or finish) begin
		if(finish) begin
			//totalvotos_nulos <= 0;
			//totalvotos_matheus <= 0;
			//totalvotos_luis <= 0;
			//totalvotos_vinicius <= 0;
			//totalvotos_random <= 0;
			next_state <= q0;
		end
		else begin
			
			if(valid == 0) begin
				case(state)
					q0: begin
						if(digit == 2)
							next_state = q6;
						else
							if(digit == 3) begin
								next_state = q1;
							end
							else begin
								next_state = q9;
								//totalvotos_nulos = totalvotos_nulos+1;
							end
					end
					q1: begin
						if(digit == 0)
							next_state = q2;
						else begin
							next_state = q10;
							//totalvotos_nulos = totalvotos_nulos+1;
						end
					end
					q2: begin
						if(digit == 3)
							next_state = q3;
						else
							if(digit == 0)
								next_state = q4;
							else begin
								next_state = q11;
								//totalvotos_nulos = totalvotos_nulos+1;
							end
					end
					q3: begin
						if(digit == 1) begin
							//totalvotos_matheus = totalvotos_matheus +1;
							next_state = q5;
							//totalvotos_matheus = totalvotos_matheus +1;
						end
						else begin
							next_state = q12;
							//totalvotos_nulos = totalvotos_nulos+1;
						end
					end
					q4: begin
						if(digit == 9) begin
							next_state = q5;
							//totalvotos_luis = totalvotos_luis +1;

						end
						else begin
							next_state = q12;
							//totalvotos_nulos = totalvotos_nulos+1;
						end
					end
					q5: begin
						next_state = q0; // entrada para novo candidato.
					end
					q9: begin
						next_state = q10; // não importa o valor de entrada, a senha já está errada.
					end
					q10: begin
						next_state = q11;
					end
					q11: begin
						next_state = q12;
					end
					q12: begin
						next_state = q0; // entrada para novo candidato.
					end
					q6: begin
						if(digit == 6)
							next_state = q7;
						else begin 
							next_state = q10;
							//totalvotos_nulos = totalvotos_nulos+1;
						end
					end
					q7: begin
						if(digit == 7)
							next_state = q8;
						else 
							if(digit == 6)
								next_state = q13;
							else begin
								next_state = q11;
								//totalvotos_nulos = totalvotos_nulos+1;
							end
						end
					q8: begin
						if(digit == 0) begin
							next_state = q5;
							//totalvotos_vinicius = totalvotos_vinicius +1;
						end
						else begin
							next_state = q12;
							//totalvotos_nulos = totalvotos_nulos+1;
						end
					end
					q13: begin
						if(digit == 8) begin
							next_state = q5;
							//totalvotos_random = totalvotos_random +1;
						end
						else begin
							next_state = q12;
							//totalvotos_nulos = totalvotos_nulos+1;
						end
					end
				endcase
				//if(state == q12 && next_state == q12)
					//totalvotos_nulos = totalvotos_nulos+1;
			end
			else begin
				//next_state = state; //permanece no mesmo estado
			end
		end
	end

endmodule
