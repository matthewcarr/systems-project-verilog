module hexdisplay (value, display, overflow);

	// Define our inputs
	input 			overflow;	// Single bit to represent an overflow
	input	[3:0] 	value;		// A 4 bit binary number
	
	// Define our seven-segment output, 7 bits
	output	[6:0] 	display;
	
	// Hold the display value in a register
	reg		[6:0] 	display;
	
	always @ (value)
	begin
	
		// Hard coded decoder to convert decimal
		// to the appropriate signal for the display
		case(value)
			4'd0: display= 7'b1000000;
			4'd1: display= 7'b1111001;
			4'd2: display= 7'b0100100;
			4'd3: display= 7'b0110000;
			4'd4: display= 7'b0011001;
			4'd5: display= 7'b0010010;
			4'd6: display= 7'b0000010;
			4'd7: display= 7'b1111000;
			4'd8: display= 7'b0000000;
			4'd9: display= 7'b0011000;
			default: display= 7'b0001110;
			
		endcase
		
	// Display F if the overflow bit is high
	if (overflow) display= 7'b0001110;
	
	end
	
endmodule
	

