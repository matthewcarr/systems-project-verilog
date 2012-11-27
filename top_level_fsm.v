module top_level_fsm ( 			//will need inputs of a clock, reset, datain and outputs of dataout, servopwms, LEDs
	input clk50m,				//pin l1, main clock
	input reset,				//pin b14, hard reset
	input serial_receive,		//pin b13, incoming serial data from mbed
	output serial_return,		//pin a13, outgoing serial data to mbed
	//input [7:0]data,			//input 8 bit data, used for debugging
	//input data_trig,			//manual trigger for data, used for debugging
	output [5:0] state_out,		//output the current state, used for debugging
	output [6:0] HEX0,			//seven segment display outputs
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output txbusy,				//transmitter is busy
	output [4:0] pwm,			//pwm signals for servos and motor
	output reg [5:0] led_out,	//LED outputs
	output [3:0] sound_ID_out,
	output start_sound_out,
	output [5:0] mtne_flags 
	);

	reg [7:0]serial_in; 	//register to store the value of the most recent valid command from the RS232
	reg [7:0]trans_word; 	//register to store the value to send to the Mbed controller over rs232
	reg [5:0]state;
	reg [5:0]nxt_state;
	
	//verb and arguments with clocked versions
	reg [7:0]verb;
	reg [7:0]verb_clk;
	reg [7:0]arg1;
	reg [7:0]arg1_clk;
	reg [7:0]arg2;
	reg [7:0]arg2_clk;
	reg [7:0]arg3;
	reg [7:0]arg3_clk;
	
	//servo and motor positions
	reg [7:0]servo_pos1;
	reg [7:0]servo_pos2;
	reg [7:0]servo_pos3;
	reg [7:0]servo_pos_lid;
	reg [7:0]motor_pos;
	
	//update servo and motor maintenance
	reg	servo1_mtne_up;		
	reg servo2_mtne_up;
	reg servo3_mtne_up;
	reg servo_lid_mtne_up;
	reg motor_mtne_up;
	
	//set maintenance mode for servos and motor
	reg mtne_servo1;		
	reg mtne_servo2;
	reg mtne_servo3;
	reg mtne_servo_lid;
	reg mtne_motor;
	reg mled;				//LED maintenance, sets all LEDs high
	reg mled_clk;
	reg tran_trig;			//allow transmission
	reg tran_trig_clk;		
	reg [7:0]trans_word_clk;
	reg start_disp;			//start dispensing
	reg start_disp_clk;		//start dispensing (clocked)
	reg start_led;
	reg [5:0] led_en;		//LED enables
	reg start_sound;		//start playing the buffered sound file
	reg start_sound_clk;
	reg set_sound;			//set the sound file to be buffered
	reg servo_anim;			//lid animatronics enable
	reg servo_anim_clk;
	reg motor_anim;			//motor (mouth) enable
	reg motor_anim_clk;
	reg mtne_servo1_clk;
	reg mtne_servo2_clk;
	reg mtne_servo3_clk;
	reg mtne_servo_lid_clk;
	reg mtne_motor_clk;
	reg [3:0]sound_ID_clk;
	
	//wires for module instantiations
	wire [7:0]w_serial_data; 	//wire to connect to the reciver
	wire w_data_ready;			//data is ready to be read
	wire w_serial_out;			//serial data to be transmitted
	wire w_trans_busy;			//transmission busy
	wire w_all_done;			//all dispensing done
	wire w_red_done;			//done from red dispense
	wire w_green_done;			//done from green dispense
	wire w_blue_done;			//done from blue dispense
	wire w_pwm_red;				//pwm signal for red dispense servo
	wire w_pwm_green;			//pwm signal for green dispense servo
	wire w_pwm_blue;			//pwm signal for blue dispense servo
	wire w_pwm_servo_lid;		//pwm signal for lid servo
	wire w_pwm_motor;			//pwm signal for motor
	wire [5:0] w_led_out;		//output from LED control
	wire w_mled;				//LED maintenance

	//assignments for wires
	//assign  w_data_ready 	= 	data_trig;			//overrides the receiver, used for debugging
	//assign  w_serial_data 	= 	data;				//overrides the receiver, used for debugging
	assign  serial_return 	= 	w_serial_out;		//serial data out
	assign  txbusy 			= 	w_trans_busy;	//transmission busy
	assign	state_out 		= 	state;				//output current state, used for debugging
	assign  w_all_done 		= 	(w_red_done && w_blue_done && w_green_done);		//all servo modules are done processing
	assign  pwm[0] 			= 	w_pwm_red;			//pin l18, pwm for red dispense servo
	assign  pwm[1] 			= 	w_pwm_green;		//pin l19, pwm for green dispense servo
	assign  pwm[2] 			= 	w_pwm_blue;			//pin k20, pwm for blue dispense servo
	assign 	pwm[3]			=	w_pwm_servo_lid;	//pin j18, pwm for lid servo
	assign	pwm[4]			=	w_pwm_motor;		//pin j20, pwm for mouth motor
	assign  start_sound_out = 	start_sound_clk;
	assign	sound_ID_out	=	sound_ID_clk;
	assign  mtne_flags[0]	=	mtne_servo1;
	assign  mtne_flags[1]	=	mtne_servo2;
	assign  mtne_flags[2]	=	mtne_servo3;
	assign  mtne_flags[3]	=	mtne_servo_lid;
	assign  mtne_flags[4]	=	mtne_motor;
	assign  mtne_flags[5]	=	mled;

	//list of states
	localparam  s_reset 	=	6'd0,		//reset state, clears everything
				s_init 		= 	6'd1,		//init state
				s_init_tran	= 	6'd2,		//announce state, responds with r_init
				s_wt_ftran 	= 	6'd3,		//wait for transmission to finish
				s_wt_verb 	= 	6'd4,		//wait for verb data
				s_wt_arg1 	= 	6'd5,		//wait for first argument
				s_wt_arg2 	= 	6'd6,		//wait for second argument
				s_wt_arg3 	= 	6'd7,		//wait for third argument
				s_decode 	= 	6'd8,		//decode verb
				s_ping 		= 	6'd9,		//respond with pong
				s_disp 		= 	6'd10,		//start dispense branch
				s_disp_tran = 	6'd11,		//wait for acknowledge to finish transmitting
				s_disp_txvb =	6'd12,		//transmit verb
				s_wt_disp 	= 	6'd13,		//wait for dispensing modules to finish
				s_mtne 		= 	6'd14,		//start maintenance branch
				s_mclear	=	6'd15,		//clear maintenance
				s_mservo1 	= 	6'd16,		//start maintenance for servo 1 
				s_mservo2 	= 	6'd17,		//start maintenance for servo 2
				s_mservo3 	= 	6'd18,		//start maintenance for servo 3
				s_mservo_lid = 	6'd19,		//start maintenance for servo 4, the lid
				s_m_motor 	= 	6'd20,		//start maintenance for motor
				s_mservo_tran = 6'd21,		//wait for acknowledge to finish transmitting
				s_mservo_txvb = 6'd22,		//transmit verb
				s_mled 		= 	6'd23,		//start maintenance of LEDs
				s_mled_tran = 	6'd24,		//wait for acknowledge to finish transmitting
				s_mled_txvb = 	6'd25,		//transmit verb
				s_anim 		= 	6'd26,		//start animatronics branch
				s_anim_tran = 	6'd27,		//wait for acknowledge to finish transmitting
				s_anim_txvb = 	6'd28,		//transmit verb
				s_sound 	= 	6'd29,		//start sound branch
				s_sound_tran =	6'd30,		//wait for acknowledge to finish transmitting
				s_sound_txvb =	6'd31,		//transmit verb
				s_sound_buffer =6'd32,		//extra state to buffer sound for longer
				s_wt_fresp 	= 	6'd33,		//wait for transmission to finish
				s_confirm 	= 	6'd34,
				s_sound_buffer2 =6'd35,
				s_sound_buffer3 =6'd36,
				s_sound_buffer4 =6'd37,
				s_sound_buffer5 =6'd38,
				s_sound_buffer6 =6'd39,
				s_sound_buffer7 =6'd40,
				s_sound_buffer8 =6'd41,
				s_sound_buffer9 =6'd42,		//respond with dispense done
				s_init2_tran	=6'd43,
				s_wt_ftran2		=6'd44;	
				

	//verb list
	localparam  v_ping 	= 	8'd2,		//ping verb, will respond with pong
				v_mtne 	= 	8'd3,		//start maintenance, allows direct hardware control
				v_sound = 	8'd4,		//start sound, will play sound files
				v_anim 	= 	8'd5,		//start animatronics, moves lid, mouth and flashes LEDs
				v_go 	= 	8'd6;		//start dispense, dispenses tokens

	//response list
	localparam  r_init 	= 	8'd13,		//response of init, sent when FPGA is reset
				r_init2 =	8'd37,
				r_error = 	8'd2,		//response of error, sent when unknown state is encountered
				r_done 	= 	8'd3,		//response of done, sent when all selected tokens are dispensed
				r_ack 	= 	8'd4,		//response of ack, sent to acknowledge a command has been received, verb is sent after
				r_pong 	= 	8'd5;		//response of pong, sent to confirm connectivity to mbed

	//maintenance argument list, used in 'mtne' decode state
	localparam 	m_clear		=	8'd0,	//clear maintenance
				m_servo1 	= 	8'd1,	//maintenance of servo 1 (red)
				m_servo2 	= 	8'd2,	//maintenance of servo 2 (green)
				m_servo3 	= 	8'd3,	//maintenance of servo 3 (blue)	
				m_servo_lid = 	8'd4,	//maintenance of lid servo
				m_motor 	= 	8'd5,	//maintenance of motor
				m_leds 		= 	8'd6;	//maintenance of LEDs


	//instantiate the transmitter/reciver
	
	async_receiver #(
		.ClkFrequency(50000000), 		//clock frequency
		.Baud(115200)					//baud rate of receiver (must be same as mbed transmitter)
		) 
	rec1 (
		.clk(clk50m), 					//input clock
		.RxD(serial_receive), 			//input serial data
		.RxD_data_ready(w_data_ready), 	//data ready to be read
		.RxD_data(w_serial_data)		//8 bit data to be read
		);
	
	
	async_transmitter #(
		.ClkFrequency(50000000), 		//clock frequency
		.Baud(115200)					//baud rate of transmitter (must be same as mbed receiver)
		) 
	tran1 (
		.clk(clk50m), 					//input clock
		.TxD_start(tran_trig_clk), 		//start transmission
		.TxD_data(trans_word_clk), 		//8 bit data to be transmitted
		.TxD(w_serial_out), 			//serial data being transmitted
		.TxD_busy(w_trans_busy)			//transmission is busy
		);
	
		
	//instatiate the led_controller
	led_control		led	(
		.led_enable(led_en), 	//LED enables
		.reset(reset), 			//reset signal
		.clock(clk50m), 		//input clock
		.mtne_mode(mled), 		//maintenance enable, switches all LEDs on
		.led_output(w_led_out)	//LED outputs
		);
	
	//instatiate the 3 token dispensers
	disp_x_token  #(
		.wait_cyles(12'h040),
		.servo_out(8'h50),
		.servo_in(8'hff)
		)
	red_tokens (
		.num_token(arg1_clk) ,		//input [3:0] num_token_sig
		.start(start_disp_clk) ,	//input start_sig
		.clock(clk50m) ,			//input clock_sig
		.reset(reset) ,				//input reset_sig
		.mtne_mode(mtne_servo1) ,	//input mtne_mode_sig
		.mtne_pos(servo_pos1) ,		//input [7:0] mtne_pos_sig
		.pwm_out(w_pwm_red) ,		//output pwm_out_sig
		.done(w_red_done)			//output done_sig
		);

	disp_x_token  #(
		.wait_cyles(12'h040),
		.servo_out(8'h68),
		.servo_in(8'hff)
		)
	green_tokens
		(
		.num_token(arg2_clk) ,		//input [3:0] num_token_sig
		.start(start_disp_clk) ,	//input start_sig
		.clock(clk50m) ,			//input clock_sig
		.reset(reset) ,				//input reset_sig
		.mtne_mode(mtne_servo2) ,	//input mtne_mode_sig
		.mtne_pos(servo_pos2) ,		//input [7:0] mtne_pos_sig
		.pwm_out(w_pwm_green) ,		//output pwm_out_sig
		.done(w_green_done)			//output done_sig
		);

	disp_x_token  #(
		.wait_cyles(12'h040),
		.servo_out(8'h50),
		.servo_in(8'hf9)
		)
	blue_tokens
		(
		.num_token(arg3_clk) ,		//input [3:0] num_token_sig
		.start(start_disp_clk) ,	//input start_sig
		.clock(clk50m) ,			//input clock_sig
		.reset(reset) ,				//input reset_sig
		.mtne_mode(mtne_servo3) ,	//input mtne_mode_sig
		.mtne_pos(servo_pos3) ,		//input [7:0] mtne_pos_sig
		.pwm_out(w_pwm_blue) ,		//output pwm_out_sig
		.done(w_blue_done)			//output done_sig
		);

	//instantiate lid servo control
	RCServo lid_servo (
		.clk(clk50m),							//input clock
		.RxD_data(servo_pos_lid),				//data to set position of lid
		.RCServo_pulse_out(w_pwm_servo_lid)		//pwm signal for lid
		);

	//instantiate motor control
	motor_control	#(
		.wait_time	(12'd4),		//time to wait while driving motor
		.m_up		(8'hff),		//drive the motor 'up'
		.m_down		(8'h0f),		//drive the motor 'down'
		.m_halt		(8'h50)			//stop the motor
		)
	motor1	(
		.reset		(reset),		//reset signal
		.pwm		(w_pwm_motor),	//pwm signal for motor
		.clk_50		(clk50m),		//input clock
		.direct		(motor_pos[0])	//set direction of motor
		);

	//whenever there is valid data avalible from the reciver
	//update the register serial in. if no new data is ready hold
	//value

	always @(posedge clk50m or negedge reset) begin		//set input serial data
		if (reset===1'b0)begin
			serial_in <=8'd0;							//clear serial data in when reset
		end else if (w_data_ready===1'b1) begin
			serial_in <=w_serial_data;					//if there is data ready set the serial data to input data
		end else begin
			serial_in<=serial_in;						//if neither reset of new data, hold old value
		end
	end

	always @(posedge clk50m or negedge reset) begin		//set the state
		if (reset===1'b0) begin
			state<=s_reset;								//set state to reset
		end else begin
			state<=nxt_state;							//set the state to the next state
		end
	end

	always @ (*) begin							//state transitions
		case(state) 
			s_reset: 	begin
							nxt_state <=s_init;		//once in reset state move to initalise
						end
			s_init:   	begin
							nxt_state <=s_init_tran;	//move to announce state to respond with r_init
						end
			s_init_tran:begin
							nxt_state <=s_wt_ftran;	//move to wait for transmission to respond with r_ack
						end					
			s_wt_ftran: begin
							if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin	//check if busy transmitting
								nxt_state <=s_wt_ftran;								//if so, stay in state
							end else begin
								nxt_state <=s_init2_tran;								//go to 
							end
						end
			s_init2_tran:begin
							nxt_state <=s_wt_ftran2;	//move to wait for transmission to respond with r_ack
						end					
			s_wt_ftran2: begin
							if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin	//check if busy transmitting
								nxt_state <=s_wt_ftran2;								//if so, stay in state
							end else begin
								nxt_state <=s_wt_verb;								//go to 
							end
						end
			s_wt_verb: 	begin
							if(w_data_ready===1'b1) begin
								nxt_state <=s_wt_arg1;
							end else begin
								nxt_state <=s_wt_verb;
							end
						end				
			s_wt_arg1:	begin
							if(w_data_ready===1'b1) begin
								nxt_state <=s_wt_arg2;
							end else begin
								nxt_state <=s_wt_arg1;
							end
						end			
			s_wt_arg2:	begin
							if(w_data_ready===1'b1) begin
								nxt_state <=s_wt_arg3;
							end else begin
								nxt_state <=s_wt_arg2;
							end
						end					
			s_wt_arg3:	begin
							if(w_data_ready===1'b1) begin
								nxt_state <=s_decode;
							end else begin
								nxt_state <=s_wt_arg3;
							end
						end					
			s_decode:	begin
							case(verb)
							0:		begin
									nxt_state <= s_wt_verb;
									end
							1:		begin
									nxt_state <= s_reset;
									end
							v_ping: begin
									nxt_state <= s_ping;
									end
							v_go:	begin
									nxt_state <= s_disp;
									end
							v_mtne:	begin
									nxt_state <= s_mtne;
									end
							v_sound: begin
									 nxt_state <= s_sound;
									 end
							v_anim:	begin
									nxt_state <= s_anim;
									end
							default: begin
									nxt_state <= s_wt_verb;
									end
							endcase
						end
			s_ping:		begin
						nxt_state <= s_wt_ftran2;
						end
			s_disp:		begin
						nxt_state <= s_disp_tran;
						end
			s_disp_tran:begin
						if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin
								nxt_state <=s_disp_tran;
							end else begin
								nxt_state <=s_disp_txvb;
							end	
						end
			s_disp_txvb:begin
						 nxt_state <=s_wt_disp;
						end				
			s_wt_disp:	begin
							if (w_all_done===1'b1) begin
								nxt_state <=s_wt_fresp;
							end else begin
								nxt_state <=s_wt_disp;
							end
						end
			s_sound:	begin
							nxt_state <= s_sound_buffer;
						end
		s_sound_buffer:	begin
							nxt_state <= s_sound_buffer2;
						end
		s_sound_buffer2:	begin
							nxt_state <= s_sound_buffer3;
						end
		s_sound_buffer3:	begin
							nxt_state <= s_sound_buffer4;
						end
		s_sound_buffer4:	begin
							nxt_state <= s_sound_buffer5;
						end
		s_sound_buffer5:	begin
							nxt_state <= s_sound_buffer6;
						end
		s_sound_buffer6:	begin
							nxt_state <= s_sound_buffer7;
						end
		s_sound_buffer7:	begin
							nxt_state <= s_sound_buffer8;
						end
		s_sound_buffer8:	begin
							nxt_state <= s_sound_buffer9;
						end
		s_sound_buffer9:	begin
							nxt_state <= s_sound_tran;
						end

			s_sound_tran:	begin
							if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin
									nxt_state <=s_sound_tran;
								end else begin
									nxt_state <=s_sound_txvb;
								end	
							end
			s_sound_txvb: 	begin
								nxt_state <= s_wt_ftran2;
							end

			s_mtne:		begin
							case(arg1_clk)
							m_clear:	begin
										nxt_state <= s_mclear;
										end
							m_servo1:	begin
										nxt_state <= s_mservo1;
										end
							m_servo2:	begin
										nxt_state <= s_mservo2;
										end
							m_servo3:	begin
										nxt_state <= s_mservo3;
										end
							m_servo_lid:	begin
										nxt_state <= s_mservo_lid;
										end
							m_motor:	begin
										nxt_state <= s_m_motor;
										end
							m_leds: 	begin
										nxt_state <= s_mled;
										end
							default:	begin
										nxt_state <= s_wt_verb;
										end
							endcase
						end
			s_mclear:	begin
							nxt_state <= s_mservo_tran;
						end
			s_mservo1:	begin
							nxt_state <= s_mservo_tran;
						end
			s_mservo2:	begin
							nxt_state <= s_mservo_tran;
						end
			s_mservo3:	begin
							nxt_state <= s_mservo_tran;
						end
			s_mservo_lid:	begin
							nxt_state <= s_mservo_tran;
						end
			s_m_motor:	begin
							nxt_state <= s_mservo_tran;
						end
			s_mservo_tran:begin
							if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin
									nxt_state <=s_mservo_tran;
								end else begin
									nxt_state <=s_mservo_txvb;
								end	
							end
			s_mservo_txvb:begin
							nxt_state <=s_wt_verb;
							end				
//			s_wt_mservo:	begin
////							if (arg2_clk[0]===1'b0) begin
////								nxt_state <=s_wt_fresp;
////							end else begin
////								nxt_state <=s_wt_mservo;
////							end
//							nxt_state <=s_wt_verb;
//							end
			s_mled:		begin
						nxt_state <= s_mled_tran;
						end
			s_mled_tran:begin
						if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin
								nxt_state <=s_mled_tran;
							end else begin
								nxt_state <=s_mled_txvb;
							end	
						end
			s_mled_txvb:begin
						 nxt_state <=s_wt_verb;
						end				

			s_anim:		begin
							nxt_state <= s_anim_tran;
						end
//			s_aleds:		begin
//							nxt_state <= s_aleds_tran;
//						end
//			s_aleds_tran:begin
//						if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin
//								nxt_state <=s_aleds_tran;
//							end else begin
//								nxt_state <=s_aleds_txvb;
//							end	
//						end
//			s_aleds_txvb:begin
//						 nxt_state <=s_wt_verb;
//						end				
//			s_wt_aleds:	begin
////							if (arg2_clk[0]===1'b0) begin
////								nxt_state <=s_wt_fresp;
////							end else begin
////								nxt_state <=s_wt_aleds;
////							end
//							nxt_state <=s_wt_verb;
//						end
//			s_aservos:	begin
//							nxt_state <= s_aservos_tran;
//						end
//			s_aservos_tran:begin
//							if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin
//									nxt_state <=s_aservos_tran;
//								end else begin
//									nxt_state <=s_aservos_txvb;
//							end	
//						end
//			s_aservos_txvb:begin
//						 nxt_state <=s_wt_verb;
//						end				
//			s_wt_aservos:	begin
////							if (arg2_clk[0]===1'b0) begin
////								nxt_state <=s_wt_fresp;
////							end else begin
////								nxt_state <=s_wt_aservos;
////							end
//							nxt_state <=s_wt_verb;
//							end
			s_anim_tran:	begin
							if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin
									nxt_state <=s_anim_tran;
								end else begin
									nxt_state <=s_anim_txvb;
								end	
							end
			s_anim_txvb:	begin
								nxt_state <=s_wt_verb;
							end		
			s_wt_fresp:	begin
							if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin		//this state will probably not be used as it has been decide not to send done after every command
								nxt_state <=s_wt_fresp;
							end else begin
								nxt_state <=s_confirm;
							end						
						end
			s_confirm:  begin
							nxt_state <= s_wt_ftran2;
						end
			default:	begin
							nxt_state <=reset;
						end
			endcase
		end

	always @ (*) begin							//general outputs
		case(state)
			s_reset:begin						//clear everything
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						tran_trig=1'b0;
						trans_word=8'b0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = 1'b0;
						motor_anim = 1'b0;
						mled = 1'b0;
						mtne_servo1 = 1'b0;
						mtne_servo2 = 1'b0;
						mtne_servo3 = 1'b0;
						mtne_servo_lid = 1'b0;
						mtne_motor = 1'b0;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
					end
			s_init: begin
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						tran_trig=1'b0;
						trans_word=8'd0;
						start_disp=1'b0;
						start_led = 1'b1;				//set high to clear leds
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
					end
			s_init_tran: begin
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						trans_word=r_init;
						tran_trig=1'b1;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
					end				
			s_wt_ftran:begin
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						tran_trig=1'b0;
						trans_word=8'b0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end				
		s_init2_tran: begin
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						trans_word=r_init2;
						tran_trig=1'b1;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
					end				
			s_wt_ftran2:begin
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						tran_trig=1'b0;
						trans_word=8'b0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end				
			s_wt_verb:begin
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						tran_trig=1'b0;
						trans_word=8'b0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b1;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk; 
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end					
			s_wt_arg1:begin
						verb =serial_in;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						tran_trig = 1'b0;
						trans_word=8'b0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_wt_arg2:begin
						verb =verb_clk;
						arg1 =serial_in;
						arg2 =0;
						arg3 =0;
						tran_trig = 1'b0;
						trans_word=8'b0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						 end
			s_wt_arg3:begin 
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =serial_in;
						arg3 =0;
						tran_trig = 1'b0;
						trans_word=8'b0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
					end
			s_decode: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =serial_in; 
						trans_word=r_ack;
						tran_trig=1'b0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
					end
			s_ping:begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						trans_word=r_pong;
						tran_trig=1'b1;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_sound:begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						trans_word=r_ack;
						tran_trig=1'b0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b1;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_sound_buffer: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=r_ack;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_sound_buffer2: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=r_ack;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_sound_buffer3: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=r_ack;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_sound_buffer4: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=r_ack;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_sound_buffer5: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=r_ack;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_sound_buffer6: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=r_ack;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_sound_buffer7: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=r_ack;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_sound_buffer8: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=r_ack;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_sound_buffer9: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b1;
						trans_word=r_ack;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_sound_tran: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=8'd0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b1;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_sound_txvb: begin
					   	verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						tran_trig =1'b1; 
						trans_word=verb;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b1;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
					   end
//			s_sound_buffer: begin
//						verb =verb_clk;
//						arg1 =arg1_clk;
//						arg2 =arg2_clk;
//						arg3 =arg3_clk; 
//						start_disp=1'b0;
//						tran_trig=1'b0;
//						trans_word=8'd0;
//						start_disp=1'b0;
//						start_led = 1'b0;
//						set_sound = 1'b0;
//						start_sound = 1'b1;
//						servo_anim = servo_anim_clk;
//						motor_anim = motor_anim_clk;
//						mled = mled_clk;
//						mtne_servo1 = mtne_servo1_clk;
//						mtne_servo2 = mtne_servo2_clk;
//						mtne_servo3 = mtne_servo3_clk;
//						mtne_servo_lid = mtne_servo_lid_clk;
//						mtne_motor = mtne_motor_clk;
//						servo1_mtne_up = 1'b0;
//						servo2_mtne_up = 1'b0;
//						servo3_mtne_up = 1'b0;
//						servo_lid_mtne_up = 1'b0;
//						motor_mtne_up = 1'b0;
//						end
			s_disp:	begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b1;
						trans_word=r_ack;		
						tran_trig=1'b1;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
					 end
			s_disp_tran: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=8'd0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_disp_txvb: begin
					   	verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						tran_trig =1'b1; 
						trans_word=verb;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
					   end
			s_wt_disp: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						tran_trig = 1'b0; 
						trans_word=8'd0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = 1'b1;				//change to 1 to close mouth while dispensing
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;						
						end
				s_anim:	begin
						tran_trig=1'b1;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=r_ack;
						start_led = 1'b1;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = arg1_clk[6];
						motor_anim = arg1_clk[7];		
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
					end					
			s_anim_tran: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=8'd0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_anim_txvb: begin
					   	verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						tran_trig =1'b1; 
						trans_word=verb;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
					   end
			s_mtne:		begin 
						tran_trig=1'b1;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=r_ack;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_mclear:	begin
						tran_trig=1'b1;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=r_ack;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = 1'b0;
						mtne_servo1 = 1'b0;
						mtne_servo2 = 1'b0;
						mtne_servo3 = 1'b0;
						mtne_servo_lid = 1'b0;
						mtne_motor = 1'b0;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_mservo1:	begin
						tran_trig=1'b1;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=verb;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = 1'b1;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b1;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_mservo2:	begin 
						tran_trig=1'b1;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=verb;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = 1'b1;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b1;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_mservo3:	begin 
						tran_trig=1'b1;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=verb;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = 1'b1;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b1;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_mservo_lid:	begin 
						tran_trig=1'b1;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=verb;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = 1'b1;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b1;
						motor_mtne_up = 1'b0;
						end
			s_m_motor:	begin 
						tran_trig=1'b1;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=verb;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = 1'b1;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b1;
						end
			s_mservo_tran: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=8'd0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_mservo_txvb: begin
					   	verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						tran_trig =1'b1; 
						trans_word=verb;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
					   end
			s_mled:		begin
						tran_trig=1'b0;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=8'd0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = arg2_clk[0];
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_mled_tran: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=8'd0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_mled_txvb: begin
					   	verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						tran_trig =1'b1; 
						trans_word=verb;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
					   end
			s_wt_fresp: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						tran_trig=1'b0;
						trans_word=8'd0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = motor_anim_clk;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			s_confirm: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						tran_trig=1'b1;
						trans_word=r_done;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = servo_anim_clk;
						motor_anim = 1'b0;
						mled = mled_clk;
						mtne_servo1 = mtne_servo1_clk;
						mtne_servo2 = mtne_servo2_clk;
						mtne_servo3 = mtne_servo3_clk;
						mtne_servo_lid = mtne_servo_lid_clk;
						mtne_motor = mtne_motor_clk;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
			default: 	begin
						verb =8'd0;
						arg1 =8'd0;
						arg2 =8'd0;
						arg3 =8'd0;
						tran_trig=1'b1;
						trans_word=r_error;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b0;
						start_sound = 1'b0;
						servo_anim = 1'b0;
						motor_anim = 1'b0;
						mled = 1'b0;
						mtne_servo1 = 1'b0;
						mtne_servo2 = 1'b0;
						mtne_servo3 = 1'b0;
						mtne_servo_lid = 1'b0;
						mtne_motor = 1'b0;
						servo1_mtne_up = 1'b0;
						servo2_mtne_up = 1'b0;
						servo3_mtne_up = 1'b0;
						servo_lid_mtne_up = 1'b0;
						motor_mtne_up = 1'b0;
						end
		endcase
	end

	always @(posedge clk50m or negedge reset) begin		//controls led module inputs
		if (reset ===1'b0) begin
			led_en[5:0] = 6'd0;
		end else if (start_led===1'b1) begin
			led_en[5:0] = 6'd0;
			led_en[5:0] = arg1_clk[5:0];
		end else begin
			led_en[5:0] = led_en[5:0];
			end
		end

	always @(posedge clk50m or negedge reset) begin
		if (reset ===1'b0) begin
			sound_ID_clk <= 6'd0;
		end else if (set_sound===1'b1) begin
			//sound_ID_clk = 6'd0;
			sound_ID_clk <= arg1_clk[3:0];
		end else begin
			sound_ID_clk <= sound_ID_clk;
			end
		end

	always @ (posedge clk50m or negedge reset) begin		//servo and motor variables control
		if (reset===1'b0) begin
			servo_pos1 = 8'd0;
			servo_pos2 = 8'd0;
			servo_pos3 = 8'd0;
			servo_pos_lid = 8'd0;
			motor_pos = 8'd0;
		//if any of the maintenance values are to be updated
		end else if (servo1_mtne_up===1'b1 || servo2_mtne_up===1'b1 || servo3_mtne_up===1'b1 ||servo_lid_mtne_up===1'b1 ||motor_mtne_up===1'b1) begin
			if (servo1_mtne_up===1'b1) begin
				servo_pos1 = arg2_clk;
				servo_pos2 = servo_pos2;
				servo_pos3 = servo_pos3;
				servo_pos_lid = servo_pos_lid;
				motor_pos = motor_pos;
			end if (servo2_mtne_up===1'b1) begin
				servo_pos1 = servo_pos1;
				servo_pos2 = arg2_clk;
				servo_pos3 = servo_pos3;
				servo_pos_lid = servo_pos_lid;
				motor_pos = motor_pos;
			end if (servo3_mtne_up===1'b1) begin
				servo_pos1 = servo_pos1;
				servo_pos2 = servo_pos2;
				servo_pos3 = arg2_clk;
				servo_pos_lid = servo_pos_lid;
				motor_pos = motor_pos;
			end if (servo_lid_mtne_up===1'b1) begin
				servo_pos1 = servo_pos1;
				servo_pos2 = servo_pos2;
				servo_pos3 = servo_pos3;
				servo_pos_lid = arg2_clk;
				motor_pos = motor_pos;
			end if (motor_mtne_up===1'b1) begin
				servo_pos1 = servo_pos1;
				servo_pos2 = servo_pos2;
				servo_pos3 = servo_pos3;
				servo_pos_lid = servo_pos_lid;
				motor_pos = arg2_clk[0];			//only first bit does anything, 1 for up, 0 for down
			end 
		//if maintenance is off
		end else if (mtne_servo1===1'b0 && mtne_servo2===1'b0 && mtne_servo3===1'b0 && mtne_servo_lid===1'b0 && mtne_motor===1'b0) begin
				servo_pos1 = servo_pos1;
				servo_pos2 = servo_pos2;
				servo_pos3 = servo_pos3;
				if (servo_anim===1'b1) begin
					servo_pos_lid = 8'he8;			//set to out position
				end else begin
					servo_pos_lid = 8'd0;			//set to in position
				end
				if (motor_anim===1'b1) begin
					motor_pos = 8'h01;			//set the motor to up
				end else begin
					motor_pos = 8'h00;			//set the motor to down
				end
		end else begin
			servo_pos1 = servo_pos1;
			servo_pos2 = servo_pos2;
			servo_pos3 = servo_pos3;
			servo_pos_lid = servo_pos_lid;
			motor_pos = motor_pos;			
			end
	end

	always @ (posedge clk50m or negedge reset) begin		//clock variables to prevent reading wrong data on transitions
		if (reset===1'b0) begin
			verb_clk=8'd0;
			arg1_clk=8'd0;
			arg2_clk=8'd0;
			arg3_clk=8'd0;
			tran_trig_clk=1'd0;
			trans_word_clk=8'd0;
			start_disp_clk=1'd0;
			led_out = 6'd0;
			servo_anim_clk = 1'd0;
			motor_anim_clk = 1'd0;
			mled_clk = 6'd0;
			mtne_servo1_clk = 1'b0;
			mtne_servo2_clk = 1'b0;
			mtne_servo3_clk = 1'b0;
			mtne_servo_lid_clk = 1'b0;
			mtne_motor_clk = 1'b0;
			start_sound_clk = 1'b0;
		end else begin
			verb_clk=verb;
			arg1_clk=arg1;
			arg2_clk=arg2;
			arg3_clk=arg3;
			tran_trig_clk=tran_trig;
			trans_word_clk=trans_word;
			start_disp_clk=start_disp;
			led_out = w_led_out;
			servo_anim_clk = servo_anim;
			motor_anim_clk = motor_anim;
			mled_clk = mled;
			mtne_servo1_clk = mtne_servo1;
			mtne_servo2_clk = mtne_servo2;
			mtne_servo3_clk = mtne_servo3;
			mtne_servo_lid_clk = mtne_servo_lid;
			mtne_motor_clk = mtne_motor;
			start_sound_clk = start_sound;
		end
	end


	hexdisplay h1 (verb, HEX3[6:0] );
	hexdisplay h2 (arg1, HEX2[6:0] );
	hexdisplay h3 (arg2, HEX1[6:0] );
	hexdisplay h4 (arg3, HEX0[6:0] );

	endmodule 