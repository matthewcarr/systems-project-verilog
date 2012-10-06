module disp_x_token(
	input[3:0]num_token,
	input start,
	input clock,
	input reset,
	output pwm_out,
	output done,
	output [2:0]state_out);
	
	assign state_out=state;
	
	reg [2:0]state /* synthesis keep */;		//state and next state regs
	reg [2:0]nxt_state;
	reg [11:0]pulsecount;
	reg pulsecount_clear;
	reg [3:0]disp_count;
	reg [7:0]servo_pos /* synthesis keep */;
	reg done_sig;
	
	wire pwm_connect; 	//wire to transfer the pwm from the servo unit to output
	wire servo_update;
	
		//instation of the RCServo control module. this module generates the pwm that will controll the servo
	RCServo rc1 (.clk(clock), .RxD_data(servo_pos), .RC_cycle_start(servo_update) , .RCServo_pulse_out(pwm_connect));
	
	localparam 	s_reset = 3'b000, //state names local params so not over written by mistake
				s_init  = 3'b001,
				s_s_out = 3'b011,
				s_pause = 3'b010,
				s_s_in  = 3'b110,
				s_pause2= 3'b111,
				s_comp  = 3'b101;
				
	parameter	wait_cyles = 12'd5,   //declare as a param so they can be overwritten to 
				servo_out  = 8'hff, //be correct numm of cycles or servo positions
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
						if(start ==1'b1) nxt_state <= s_s_out;
						else nxt_state <=s_init;
					end
			s_s_out: begin
						nxt_state<=s_pause;
					end
			s_pause: begin 
						if(pulsecount==wait_cyles+1) nxt_state<= s_s_in;
						else nxt_state <= s_pause;
					end
			s_s_in: begin
						nxt_state <= s_pause2;
					end
			s_pause2: begin 
						if(pulsecount==wait_cyles+1) nxt_state<= s_comp;
						else nxt_state <= s_pause2;
					end
			s_comp: begin
						if(disp_count==num_token) nxt_state <= s_init;
						else nxt_state<= s_s_out;
					end
			default: nxt_state<=s_reset;
		endcase
	end
	
	//generate the outputs based on the nextstate the machine will enter
	always@(nxt_state) begin
		case(nxt_state)
			s_reset:begin
						servo_pos<=8'h0f; //push servo to half way on a reset, this means if using the push from both side then it wont dispense
						pulsecount_clear<='d1;  //but will be in a known position
						disp_count<='d0;
						done_sig<='d0;
					end
			s_init: begin
						pulsecount_clear<='d1; //in intial satge clear the pulse counter and set the done sig high
						disp_count<='d0;
						done_sig<='d1;						
					end
			s_s_out:begin
						servo_pos<=servo_out;//in servo out stage set the servo out and clear previous flags
						pulsecount_clear<='d0;
						done_sig<='d0;					
					end
			s_pause: begin 
						pulsecount_clear<='d0; //wait stage do nothing
						done_sig<='d0;
					end
			s_s_in: begin
						servo_pos<=servo_in;  //pull servo in clear the pulse counter and increment the tokens dispened counter
						pulsecount_clear<='d1;
						disp_count<=disp_count+1;
						done_sig<='d0;
					end
			s_pause2: begin 
						pulsecount_clear<='d0; //second wait state
						done_sig<='d0;
					end
			s_comp: begin
						pulsecount_clear<='d0; //comparison stage so not real outputs
						done_sig<='d0;
					end
			default:begin
						servo_pos<=8'h0f;  //deafulat stage is identical to reset on case something goes wrong
						pulsecount_clear<='d1;
						disp_count<='d0;
						done_sig<='d0;
					end
				endcase
			end
			
	always@(posedge clock) begin
			if (servo_update=='d1)pulsecount<=pulsecount+1;
			else if (pulsecount_clear=='d1)pulsecount<=0;
			end
			
	assign pwm_out  = pwm_connect;
	assign done = done_sig;	
							
	
endmodule
