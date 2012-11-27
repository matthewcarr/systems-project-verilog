module wrapper (
	//input 	[3:0]   sound_id,
	//input 			sound_start,
	inout	[15:0]	DRAM_DQ,				//	SDRAM Data bus 16 Bits
	output	[11:0]	DRAM_ADDR,				//	SDRAM Address bus 12 Bits
	output			DRAM_LDQM,				//	SDRAM Low-byte Data Mask 
	output			DRAM_UDQM,				//	SDRAM High-byte Data Mask
	output			DRAM_WE_N,				//	SDRAM Write Enable
	output			DRAM_CAS_N,				//	SDRAM Column Address Strobe
	output			DRAM_RAS_N,				//	SDRAM Row Address Strobe
	output			DRAM_CS_N,			//	SDRAM Chip Select
	output			DRAM_BA_0,				//	SDRAM Bank Address 0
	output			DRAM_BA_1,				//	SDRAM Bank Address 0
	output			DRAM_CLK,				//	SDRAM Clock
	output			DRAM_CKE,				//	SDRAM Clock Enable
	input	[3:0]		KEY,
	output [7:0]LEDG,
	input			CLOCK_50,
	input	[1:0]		CLOCK_27,
	inout		[15:0]	SRAM_DQ,
	output		[17:0]	SRAM_ADDR,
	input				AUD_ADCDAT,
	output				SRAM_CE_N,
	output				SRAM_WE_N,
	output				SRAM_OE_N,
	output				SRAM_UB_N,
	output				SRAM_LB_N,
	output				AUD_XCK,
	output				AUD_DACDAT,
	output SD_CLK,
	inout SD_CMD,
	inout SD_DATA,
	inout SD_DAT3,
	inout				AUD_BCLK,
	inout				AUD_ADCLRCK,
	inout				AUD_DACLRCK,
	inout				I2C_SDAT,
	output				I2C_SCLK,
	input reset,				//pin b14, hard reset
	input serial_receive,		//pin b13, incoming serial data from mbed
	output serial_return,		//pin a13, outgoing serial data to mbed
	//input  [7:0] data,
	//input  data_trig,	
	output [6:0] HEX0,			//seven segment display outputs
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [4:0] pwm,			//pwm signals for servos and motor
	output [5:0] led_out,
	output [5:0] mtne_flags
);


	wire [3:0]sound_id;
	wire sound_start;

  AUDIO_SOPC sopc_inst
    (
      .AUD_ADCDAT_to_the_audio                           (AUD_ADCDAT),
      .AUD_ADCLRCK_to_and_from_the_audio                 (AUD_ADCLRCK),
      .AUD_BCLK_to_and_from_the_audio                    (AUD_BCLK),
      .AUD_DACDAT_from_the_audio                         (AUD_DACDAT),
      .AUD_DACLRCK_to_and_from_the_audio                 (AUD_DACLRCK),
      .clk_27                                          (CLOCK_27[0]),
      .clk_50                                          (CLOCK_50),
      .I2C_SCLK_from_the_audio_and_video_config_0        (I2C_SCLK),
      .I2C_SDAT_to_and_from_the_audio_and_video_config_0 (I2C_SDAT),
      .SRAM_ADDR_from_the_sram_0                         (SRAM_ADDR),
      .SRAM_CE_N_from_the_sram_0                         (SRAM_CE_N),
      .SRAM_DQ_to_and_from_the_sram_0                    (SRAM_DQ),
      .SRAM_LB_N_from_the_sram_0                         (SRAM_LB_N),
      .SRAM_OE_N_from_the_sram_0                         (SRAM_OE_N),
      .SRAM_UB_N_from_the_sram_0                         (SRAM_UB_N),
      .SRAM_WE_N_from_the_sram_0                         (SRAM_WE_N),
      .b_SD_cmd_to_and_from_the_SDCARD                   (SD_CMD),
      .in_port_to_the_sounds_ids                         (sound_id),
      .in_port_to_the_start_sound                        (sound_start),
      .b_SD_dat3_to_and_from_the_SDCARD                  (SD_DAT3),
      .b_SD_dat_to_and_from_the_SDCARD                   (SD_DATA),
      .clocks_0_AUD_CLK_out                              (AUD_XCK),
      .clocks_0_sys_clk_out                              (),
      .clocks_0_SDRAM_CLK_out                            (DRAM_CLK),
      .o_SD_clock_from_the_SDCARD                        (SD_CLK),
      .reset_n                                           (KEY[0]),
      .zs_addr_from_the_sdram_0                            (DRAM_ADDR),
      .zs_ba_from_the_sdram_0                              ({DRAM_BA_1,DRAM_BA_0}),
      .zs_cas_n_from_the_sdram_0                           (DRAM_CAS_N),
      .zs_cke_from_the_sdram_0                             (DRAM_CKE),
      .zs_cs_n_from_the_sdram_0                            (DRAM_CS_N),
      .zs_dq_to_and_from_the_sdram_0                       (DRAM_DQ),
      .zs_dqm_from_the_sdram_0                             ({DRAM_UDQM,DRAM_LDQM}),
      .zs_ras_n_from_the_sdram_0                           (DRAM_RAS_N),
      .zs_we_n_from_the_sdram_0                            (DRAM_WE_N)
    );
    
   top_level_fsm fsm( 			
	.clk50m(CLOCK_50),				//pin l1, main clock
	.reset(reset),				//pin b14, hard reset
	.serial_receive(serial_receive),		//pin b13, incoming serial data from mbed
	.serial_return(serial_return),		//pin a13, outgoing serial data to mbed
	.state_out(LEDG),		//output the current state, used for debugging
	.HEX0(HEX0),			//seven segment display outputs
	.HEX1(HEX1),
	.HEX2(HEX2),
	.HEX3(HEX3),
	//.data_trig(data_trig),
	//.data(data),
	.pwm(pwm),			//pwm signals for servos and motor
	.led_out(led_out),	//LED outputs
	.sound_ID_out(sound_id),
	.start_sound_out(sound_start),
	.mtne_flags(mtne_flags)
	);
    

endmodule
 
