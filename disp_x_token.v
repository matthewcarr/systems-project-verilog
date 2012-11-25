module disp_x_token(
	input[3:0]num_token,	//input to state num of tokens to dispense
	input start,			//trigger to start the FSM
	input clock,			//input for the 50MHZ clock
	input reset,			//reset line should be held high when the device does not need reset
	input mtne_mode,		//toggle to override normal opeerations and enter maintenance mode
	input [7:0]mtne_pos,	//position to go to in maintenance mode
	output pwm_out,			//output to the servo pin
	output done,			//output to tell master FSM all tokens dipsensed
	output [2:0]state_out	//debug output
	); 
	
	assign state_out=state; //for debug
	
	assign servo_pos_pass = mtne_mode ? mtne_pos : servo_pos_clked; //assign the position based on whether maintenance is on
	
	//following registers are needed in code. Note some have a keep command to stop the optimizer messing up
	reg [2:0]state /* synthesis keep */;		//state and next state regs
	reg [2:0]nxt_state;
	reg [11:0]pulsecount /* synthesis keep*/;
	reg pulsecount_clear;
	reg [3:0]disp_count;
	reg [7:0]servo_pos;
	reg start_reg;
	reg [7:0]servo_pos_clked /* synthesis keep */;
	reg flag;
	
	//wires to connect modules together
	wire pwm_connect; 	//wire to transfer the pwm from the servo unit to output
	wire servo_update;
	wire [7:0]servo_pos_pass /* synthesis keep */;
	
	//instantion of the RCServo control module. This module generates the pwm that will control the servo
	RCServo rc1 (
		.clk(clock), 
		.RxD_data(servo_pos_pass), 
		.RC_cycle_start(servo_update), 
		.RCServo_pulse_out(pwm_connect)
		);
	
	localparam 	s_reset = 3'b000, 	//state names local parameters so not over written by mistake
				s_init  = 3'b001,
				s_s_out = 3'b011,
				s_pause = 3'b010,
				s_s_in  = 3'b110,
				s_pause2= 3'b111,
				s_comp  = 3'b101;
				
	parameter	wait_cyles = 12'd2,		//declare as a parameter so they can be overwritten to 
				servo_out  = 8'hff, 	//be correct number of cycles or servo positions
				servo_in   = 8'h01;  
	
	//following block update the next state based on current state
	always@(posedge clock or negedge reset)begin
		if (reset==0) state = s_reset;
		else begin
			state = nxt_state;
		end
	end
	
	//calculate the next state based on the comb logic of inputs and current state
	always@(*) begin
		case(state) 
			s_reset: nxt_state<=s_init;
			s_init: begin
						if((start_reg ==1'b1) && (num_token!==1'b0)) nxt_state <= s_s_out;		//if told to start and number of tokens is not 0 then start dispensing
						else nxt_state <=s_init;												//else stay in state
					end
			s_s_out: begin
						nxt_state<=s_pause;										//go to wait at servo out position
					end
			s_pause: begin 
						if(pulsecount==wait_cyles) nxt_state<= s_s_in;			//once the pulse count has reached wait cycles move servo in
						else nxt_state <= s_pause;								//wait for wait cycles in servo out position
					end
			s_s_in: begin
						nxt_state <= s_pause2;									//go to wait at servo in position
					end
			s_pause2: begin 
						if(pulsecount==wait_cyles) nxt_state<= s_comp;			//once the pulse count has reached wait cycles move srevo out
						else nxt_state <= s_pause2;								//wait for wait cycles in servo in position
					end
			s_comp: begin
						if(disp_count==num_token) nxt_state <= s_init;			//once all tokens have been dispensed return to init
						else nxt_state<= s_s_out;								//move servo out
					end
			default: nxt_state<=s_reset;										//if unknown state reset
		endcase
	end
	
	//generate the outputs based on the next state the machine will enter
	always@(nxt_state) begin
		case(nxt_state)
			s_reset:begin
						servo_pos=servo_in; //push servo to half way on a reset, this means if using the push from both side then it won't dispense
						pulsecount_clear='d1;  //but will be in a known position
					end
			s_init: begin
						servo_pos=servo_in;
						pulsecount_clear='d1; //in initial stage clear the pulse counter and set the done signal high						
					end
			s_s_out:begin
						servo_pos=servo_out;//in servo out stage set the servo out and clear previous flags
						pulsecount_clear='d0;				
					end
			s_pause: begin
						servo_pos=servo_out;
						pulsecount_clear='d0; //wait stage do nothing
					end
			s_s_in: begin
						servo_pos=servo_in;  //pull servo in clear the pulse counter and increment the tokens dispensed counter
						pulsecount_clear='d1;
					end
			s_pause2: begin
						servo_pos=servo_in;
						pulsecount_clear='d0; //second wait state
					end
			s_comp: begin
						servo_pos=servo_in;
						pulsecount_clear='d1; //comparison stage so only reset and servo position hold
					end
			default:begin
						servo_pos=8'h0f;  //default stage is identical to reset on case something goes wrong
						pulsecount_clear='d1;
					end
				endcase
			end
						
	//block to update the pulse count resgister register is 12 bit and each pulse
	//~15ms thus giving an abilty to count ~4000 servo pulses giving a total delay in excess of
	//60 second real time. count is cleared when ever pulsecount clear is asserted
	always@(posedge clock) begin
		if (servo_update==='d1 && flag==='d0)begin
			pulsecount<=pulsecount+12'd1;
			flag<=1;
		end
		else if (servo_update==='d0 && flag==='d1) flag<=0;
		if (pulsecount_clear=='d1)pulsecount<=3'd0;
	end
	
	//to register the start input
	always@(posedge clock) begin
		start_reg=start;
	end
	
	//block that counts total number of dispenses
	//increment at servo in and clear at initial 
	always@(posedge clock) begin
		if (state===s_s_in)
			disp_count <= disp_count+4'd1;
		else if (state===s_init) 
			disp_count <=0;
	end
	
	//register to clock the value of the desired servo position
	always@(posedge clock or negedge reset) begin
		if (reset===1'b0)begin
			servo_pos_clked=servo_in;			//set servo to the in position
		end else begin
			servo_pos_clked=servo_pos;			//clock in the desired servo position
		end
	end
		
	assign pwm_out  = pwm_connect;
	assign done = (state===s_init);	
							
endmodule