module main (
	input A,
	output Z);
	
	reg reset;
	reg [3:0]tokens;
	reg start;
	reg clock;
	wire pwm;
	
	disp_x_token red (.num_token(tokens),.start(start),.clock(clock),.reset(reset),.pwm_out(pwm));

	assign Z =pwm;
	
	
endmodule


