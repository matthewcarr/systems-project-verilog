  //Example instantiation for system 'Auido_core_Controller'
  Auido_core_Controller Auido_core_Controller_inst
    (
      .I2C_SCLK_from_the_audio_and_video_config_0                     (I2C_SCLK_from_the_audio_and_video_config_0),
      .I2C_SDAT_to_and_from_the_audio_and_video_config_0              (I2C_SDAT_to_and_from_the_audio_and_video_config_0),
      .b_SD_cmd_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0  (b_SD_cmd_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0),
      .b_SD_dat3_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0 (b_SD_dat3_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0),
      .b_SD_dat_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0  (b_SD_dat_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0),
      .clk_0                                                          (clk_0),
      .clocks_0_AUD_CLK_out                                           (clocks_0_AUD_CLK_out),
      .clocks_0_SDRAM_CLK_out                                         (clocks_0_SDRAM_CLK_out),
      .clocks_0_sys_clk_out                                           (clocks_0_sys_clk_out),
      .o_SD_clock_from_the_Altera_UP_SD_Card_Avalon_Interface_0       (o_SD_clock_from_the_Altera_UP_SD_Card_Avalon_Interface_0),
      .reset_n                                                        (reset_n)
    );

