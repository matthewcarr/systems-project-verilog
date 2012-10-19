module led_control(
	input [5:0] led_enable,
	input reset,
	input clock,
	input mtne_mode,
	output [5:0] led_output);
	
	wire slow_clock; 
	
	reg [3:0] led_counter;
	
	clk_div #(.clock_div(10000000)) c5hz (.old_clock(clock), .reset(reset), .new_clock(slow_clock));

	always @(posedge slow_clock or negedge reset) begin
		if (reset ===1'b0) begin
			led_counter<=4'b0;
		end else led_counter <= led_counter + 1'b1;
	end
	
	assign led_output[0] = mtne_mode ? 1'b1: (led_enable[0] ? (led_counter===4'd1 || led_counter===4'd7) : 1'b0);
	assign led_output[1] = mtne_mode ? 1'b1: (led_enable[1] ? (led_counter===4'd2 || led_counter===4'd8) : 1'b0);
	assign led_output[2] = mtne_mode ? 1'b1: (led_enable[2] ? (led_counter===4'd3 || led_counter===4'd9) : 1'b0);
	assign led_output[3] = mtne_mode ? 1'b1: (led_enable[3] ? (led_counter===4'd4 || led_counter===4'd10) : 1'b0);
	assign led_output[4] = mtne_mode ? 1'b1: (led_enable[4] ? (led_counter===4'd5 || led_counter===4'd13) : 1'b0);
	assign led_output[5] = mtne_mode ? 1'b1: (led_enable[5] ? (led_counter===4'd6 || led_counter===4'd15) : 1'b0);
	
endmodule