module led_control	(
	input [5:0] led_enable,		//LED enables
	input reset,				//reset, held high when not reset
	input clock,				//clock
	input mtne_mode,			//maintenance, sets all LEDs high
	output [5:0] led_output		//output LED
	);
	
	wire slow_clock; 
	
	reg [3:0] led_counter;		//counter
	
	clk_div #(
		.clock_div(10000000)
		) 
	c5hz (
		.old_clock(clock), 
		.reset(reset), 
		.new_clock(slow_clock)
		);

	always @(posedge slow_clock or negedge reset) begin		//on slow clock or reset
		if (reset ===1'b0) begin							//if reset
			led_counter<=4'b0;								//clear counter
		end else led_counter <= led_counter + 1'b1;			//else increment counter
	end
	
	//assign outputs as follows: if maintenance, set all to high, else if enable set based on counter value else  set low
	//the counter is used to set up patterns for flashing the LEDs
	assign led_output[0] = mtne_mode ? 1'b1: (led_enable[0] ? (led_counter===4'd1 || led_counter===4'd7) : 1'b0);
	assign led_output[1] = mtne_mode ? 1'b1: (led_enable[1] ? (led_counter===4'd2 || led_counter===4'd8) : 1'b0);
	//assign led_output[2] = mtne_mode ? 1'b1: (led_enable[2] ? (led_counter===4'd3 || led_counter===4'd9) : 1'b0);
	assign led_output[2] = mtne_mode ? 1'b1: (led_enable[2] ? (/*led_counter===4'd0 || */led_counter===4'd8) : 1'b0);	//blink the eyes
	assign led_output[3] = mtne_mode ? 1'b1: (led_enable[3] ? (led_counter===4'd4 || led_counter===4'd10) : 1'b0);
	assign led_output[4] = mtne_mode ? 1'b1: (led_enable[4] ? (led_counter===4'd5 || led_counter===4'd13) : 1'b0);
	assign led_output[5] = mtne_mode ? 1'b1: (led_enable[5] ? (led_counter===4'd6 || led_counter===4'd15) : 1'b0);
	
endmodule