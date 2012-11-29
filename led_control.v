module led_control(
	input [5:0] led_enable,
	input reset,				//reset, held high when not reset
	input clock,				//clock from top level
	input mtne_mode,			//maintenance mode, puts all LEDs on
	output [5:0] led_output		//output on/off state of LEDs
	);

	wire slow_clock;

	reg [3:0] led_counter;

	clk_div #(
		.clock_div(10000000)
		) 
	c5hz (
		.old_clock(clock), 
		.reset(reset), 
		.new_clock(slow_clock)
		);

	always @(posedge slow_clock or negedge reset) begin
	if (reset ===1'b0) begin								//if reset
		led_counter<=4'b0;									//reset counter
	end else led_counter <= led_counter + 1'b1;				//else increment counter
	end

	//assign the LED outputs based on if maintenance mode is on, else it is dependant on the enable and counter
	//the counter trigger values can be changed to produce different patterns
	assign led_output[0] = mtne_mode ? 1'b1: (led_enable[0] ? (1'b1)																										 	: 1'b0);
	assign led_output[1] = mtne_mode ? 1'b1: (led_enable[1] ? (led_counter===4'd0 || led_counter===4'd4 || led_counter===4'd8 || led_counter===4'd12)						 	: 1'b0);
	assign led_output[2] = mtne_mode ? 1'b1: (led_enable[2] ? (1'b1) 																											: 1'b0);
	assign led_output[3] = mtne_mode ? 1'b1: (led_enable[3] ? (led_counter===4'd1 || led_counter===4'd4 || led_counter===4'd7 || led_counter===4'd10|| led_counter===4'd13) 	: 1'b0);
	assign led_output[4] = mtne_mode ? 1'b1: (led_enable[4] ? (led_counter===4'd2 || led_counter===4'd5 || led_counter===4'd8 || led_counter===4'd11|| led_counter===4'd14) 	: 1'b0);
	assign led_output[5] = mtne_mode ? 1'b1: (led_enable[5] ? (led_counter===4'd3 || led_counter===4'd6 || led_counter===4'd9 || led_counter===4'd12|| led_counter===4'd15) 	: 1'b0);

endmodule