module top_level_fsm ( //will need inputs of a clock,reset,datain,dataout,servopwms,leds
	input clk50m,				//pin l1, main clock
	input reset,				//pin b14, hard reset
	input serial_receive,			//pin b13, incoming serial data from mbed
	output serial_return,		//pin a13, outgoing serial data to mbed
	input [7:0]data,			//input 8 bit data, used for debugging
	input data_trig,			//manual trigger for data, used for debugging
	output [4:0] state_out,		//output the current state, used for debugging
	output [6:0] HEX0,			//seven segment display outputs
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output txbusy,				//transmitter is busy
	output [4:0] pwm,			//pwm signals for servos and motor
	output reg [5:0] led_out,	//led outputs
	output reg [3:0] sound_ID
	);

	reg [7:0]serial_in; //register to store the value of the most recent valid command from the RS232
	reg [7:0]trans_word; //register to store the value to send to the Mbed controller over rs232
	reg [5:0]state;
	reg [5:0]nxt_state;
	//verb and arguments and clocked versions
	reg [7:0]verb;
	reg [7:0]verb_clk;
	reg [7:0]arg1;
	reg [7:0]arg1_clk;
	reg [7:0]arg2;
	reg [7:0]arg2_clk;
	reg [7:0]arg3;
	reg [7:0]arg3_clk;
	//servo positions and maintenance
	reg [7:0]servo_pos1;
	reg [7:0]servo_pos2;
	reg [7:0]servo_pos3;
	reg [7:0]servo_pos_lid;
	reg [7:0]motor_pos;
	reg	servo1_mtne_up;		//update maintenance
	reg servo2_mtne_up;
	reg servo3_mtne_up;
	reg servo_lid_mtne_up;
	reg motor_mtne_up;
	reg mtne_servo1;		//set maintenance mode for servo
	reg mtne_servo2;
	reg mtne_servo3;
	reg mtne_servo_lid;
	reg mtne_motor;
	reg mled;				//led maintenance, sets all leds high
	reg tran_trig_clk;		
	reg tran_trig;			//allow transmission
	reg start_disp;			//start dispensing
	reg [7:0]trans_word_clk;
	reg start_disp_clk;		//start dispensing (clocked)
	reg [5:0] led_en;		//led enables
	reg start_led;			
	reg servo_anim;
	reg servo_anim_clk;
	reg motor_anim;
	reg motor_anim_clk;
	reg mled_clk;
	reg mtne_servo1_clk;
	reg mtne_servo2_clk;
	reg mtne_servo3_clk;
	reg mtne_servo_lid_clk;
	reg mtne_motor_clk;
	//reg [3:0] sound_ID;
	reg set_sound;
	reg start_sound;

	wire [7:0]w_serial_data; 	//wire to connect to the reciver
	wire w_data_ready;
	wire w_serial_out;
	wire w_trans_busy;
	wire w_all_done;			
	wire w_red_done;			//done from servo controls
	wire w_blue_done;
	wire w_green_done;
	wire w_pwm_red;
	wire w_pwm_blue;
	wire w_pwm_green;
	wire w_pwm_servo_lid;
	wire w_pwm_motor;
	wire [5:0] w_led_out;		//output from led control
	wire w_mled;				

	assign  w_data_ready 	= 	data_trig;		//overrides the receiver, used for debugging
	assign  w_serial_data 	= 	data;		//overrides the receiver, used for debugging
	assign  serial_return 	= 	w_serial_out;
	assign  txbusy 			= 	0;//w_trans_busy;
	assign	state_out 		= 	state;
	assign  w_all_done 		= 	(w_red_done && w_blue_done && w_green_done);		//all servo modules are done processing
	assign  pwm[0] 			= 	w_pwm_red;		//
	assign  pwm[1] 			= 	w_pwm_blue;		//
	assign  pwm[2] 			= 	w_pwm_green;	//pin k20
	assign 	pwm[3]			=	w_pwm_servo_lid;	//
	assign	pwm[4]			=	w_pwm_motor;	//

	//list of states
	localparam  s_reset 	=	6'd0,
				s_init 		= 	6'd1,
				s_annow 	= 	6'd2,
				s_wt_ftran 	= 	6'd3,
				s_wt_verb 	= 	6'd4,
				s_wt_arg1 	= 	6'd5,
				s_wt_arg2 	= 	6'd6,
				s_wt_arg3 	= 	6'd7,
				s_decode 	= 	6'd8,
				s_ping 		= 	6'd9,
				s_disp 		= 	6'd10,
				s_disp_tran = 	6'd11,
				s_disp_txvb =	6'd12,
				s_wt_disp 	= 	6'd13,
				s_mtne 		= 	6'd14,
				s_mservo1 	= 	6'd15,
				s_mservo2 	= 	6'd16,
				s_mservo3 	= 	6'd17,
				s_mservo_lid 	= 	6'd18,
				s_mmotor 	= 	6'd19,
				s_mservo_tran = 6'd20,
				s_mservo_txvb = 6'd21,
				s_mled 		= 	6'd22,
				s_mled_tran = 	6'd23,
				s_mled_txvb = 	6'd24,
				s_anim 		= 	6'd25,
				s_anim_tran = 	6'd26,
				s_anim_txvb = 	6'd27,
				s_sound 	= 	6'd28,
				s_wt_fresp 	= 	6'd29,
				s_confirm 	= 	6'd30,
				s_mclear	=	6'd31,
				s_sound_tran =	6'd32,
				s_sound_txvb =	6'd33,
				s_sound_buffer =6'd34;

	//verb list
	localparam  v_ping 	= 	8'd2,
				v_go 	= 	8'd6,
				v_mtne 	= 	8'd3,
				v_sound = 	8'd4,
				v_anim 	= 	8'd5;

	//response list
	localparam  r_pong 	= 	8'd5,
				r_ack 	= 	8'd4,
				r_done 	= 	8'd3,
				r_error = 	8'd2,
				r_init 	= 	8'd1;

	//maintenance argument list
	localparam 	m_clear		=	8'd0,
				m_servo1 	= 	8'd1,
				m_servo2 	= 	8'd2,
				m_servo3 	= 	8'd3,		
				m_servo_lid 	= 	8'd4,
				m_motor 	= 	8'd5,
				m_leds 		= 	8'd6;		


	//instantiate the transmitter/reciver
	//async_receiver #(.ClkFrequency(50000000), .Baud(115200)) rec1 (.clk(clk50m), .RxD(serial_receive), .RxD_data_ready(w_data_ready), .RxD_data(w_serial_data));
	//async_transmitter #(.ClkFrequency(50000000), .Baud(115200)) tran1 (.clk(clk50m), .TxD_start(tran_trig_clk), .TxD_data(trans_word_clk), .TxD(w_serial_out), .TxD_busy(w_trans_busy));
	//instatiate the led_controller
	led_control		led	(.led_enable(led_en), .reset(reset), .clock(clk50m), .mtne_mode(mled), .led_output(w_led_out));
	//instatiate the 3 token dispensors
	disp_x_token  #(
		.wait_cyles(12'h040),
		.servo_out(8'h00),
		.servo_in(8'he8)
		)
	red_tokens
		(
		.num_token(arg1_clk) ,	// input [3:0] num_token_sig
		.start(start_disp_clk) ,	// input  start_sig
		.clock(clk50m) ,	// input  clock_sig
		.reset(reset) ,	// input  reset_sig
		.mtne_mode(mtne_servo1) ,	// input  mtne_mode_sig
		.mtne_pos(servo_pos1) ,	// input [7:0] mtne_pos_sig
		.pwm_out(w_pwm_red) ,	// output  pwm_out_sig
		.done(w_red_done)	// output  done_sig
		);

	disp_x_token  #(
		.wait_cyles(12'h040),
		.servo_out(8'h00),
		.servo_in(8'he8)
		)
	blue_tokens
		(
		.num_token(arg2_clk) ,	// input [3:0] num_token_sig
		.start(start_disp_clk) ,	// input  start_sig
		.clock(clk50m) ,	// input  clock_sig
		.reset(reset) ,	// input  reset_sig
		.mtne_mode(mtne_servo2) ,	// input  mtne_mode_sig
		.mtne_pos(servo_pos2) ,	// input [7:0] mtne_pos_sig
		.pwm_out(w_pwm_blue) ,	// output  pwm_out_sig
		.done(w_blue_done)	// output  done_sig
		);

	disp_x_token  #(
		.wait_cyles(12'h040),
		.servo_out(8'h00),
		.servo_in(8'he8)
		)
	green_tokens
		(
		.num_token(arg3_clk) ,	// input [3:0] num_token_sig
		.start(start_disp_clk) ,	// input  start_sig
		.clock(clk50m) ,	// input  clock_sig
		.reset(reset) ,	// input  reset_sig
		.mtne_mode(mtne_servo3) ,	// input  mtne_mode_sig
		.mtne_pos(servo_pos3) ,	// input [7:0] mtne_pos_sig
		.pwm_out(w_pwm_green) ,	// output  pwm_out_sig
		.done(w_green_done)	// output  done_sig
		);

	//instantiate lid servo control
	RCServo lid_servo
		(
		.clk(clk50m),
		.RxD_data(servo_pos_lid),
		.RCServo_pulse_out(w_pwm_servo_lid)
		);

	//instantiate motor control
	motor_control	#(
		.wait_time	(12'd900),
		.m_up		(8'hff),
		.m_down		(8'h0f),
		.m_halt		(8'h50)
		)
	motor1	(
		.reset		(reset),
		.pwm		(w_pwm_motor),
		.clk_50		(clk50m),
		.direct		(motor_pos[0])
		);

	//whenever there is valid data avalible from the reciver
	//update the register serial in. if no new data is ready hold
	//value

	always @(posedge clk50m or negedge reset) begin			 
		if (reset===1'b0)begin
			serial_in <=8'd0;
		end else if (w_data_ready===1'b1) begin
			serial_in <=w_serial_data;
		end else begin
			serial_in<=serial_in;
		end
	end

	always @(posedge clk50m or negedge reset) begin
		if (reset===1'b0) begin
			state<=s_reset;
		end else begin
			state<=nxt_state;
		end
	end

	always @ (*) begin							//state changes
		case(state) 
			s_reset: 	begin
							nxt_state <=s_init;	//once in reset state move to initalise
						end
			s_init:   	begin
							nxt_state <=s_annow;
						end
			s_annow:	begin
							nxt_state <=s_wt_ftran;
						end					
			s_wt_ftran: begin
							if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin
								nxt_state <=s_wt_ftran;
							end else begin
								nxt_state <=s_wt_verb;
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
						nxt_state <= s_wt_ftran;
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
								nxt_state <= s_sound_buffer;
							end
			s_sound_buffer:	begin
								nxt_state <= s_wt_verb;
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
										nxt_state <= s_mmotor;
										end
							m_leds: 	begin
										nxt_state <= s_mled;
										end
							default:	begin
										nxt_state <= s_reset;
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
			s_mmotor:	begin
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
							nxt_state <= s_wt_ftran;
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
			s_annow: begin
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
			s_wt_verb:begin
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
						tran_trig=1'b1;
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
						set_sound = 1'b1;
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
			s_sound_buffer: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=8'd0;
						start_disp=1'b0;
						start_led = 1'b0;
						set_sound = 1'b1;
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
			s_mmotor:	begin 
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
			sound_ID = 6'd0;
		end else if (set_sound===1'b1) begin
			sound_ID = 6'd0;
			sound_ID = arg1_clk[3:0];
		end else begin
			sound_ID = sound_ID;
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
				motor_pos = arg2_clk;			//only first bit does anything, 1 for up, 0 for down
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
		end
	end


	hexdisplay h1 (verb, HEX3[6:0] );
	hexdisplay h2 (arg1, HEX2[6:0] );
	hexdisplay h3 (arg2, HEX1[6:0] );
	hexdisplay h4 (arg3, HEX0[6:0] );

	endmodule 