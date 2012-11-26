/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu_0' in SOPC Builder design 'AUDIO_SOPC'
 * SOPC Builder design path: ../../AUDIO_SOPC.sopcinfo
 *
 * Generated: Sun Nov 25 19:09:47 GMT 2012
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x1100820
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x0
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 25
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x1080020
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 25
#define NIOS2_RESET_ADDR 0x1080000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID
#define __ALTERA_NIOS2
#define __ALTERA_UP_AVALON_AUDIO
#define __ALTERA_UP_AVALON_AUDIO_AND_VIDEO_CONFIG
#define __ALTERA_UP_AVALON_CLOCKS
#define __ALTERA_UP_AVALON_SRAM
#define __ALTERA_UP_SD_CARD_AVALON_INTERFACE


/*
 * SDCARD configuration
 *
 */

#define ALT_MODULE_CLASS_SDCARD Altera_UP_SD_Card_Avalon_Interface
#define SDCARD_BASE 0x1101000
#define SDCARD_IRQ -1
#define SDCARD_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDCARD_NAME "/dev/SDCARD"
#define SDCARD_SPAN 1024
#define SDCARD_TYPE "Altera_UP_SD_Card_Avalon_Interface"


/*
 * System configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2"
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_NAME "cpu_0"
#define ALT_DEVICE_FAMILY "CYCLONEII"
#define ALT_IRQ_BASE NULL
#define ALT_LEGACY_INTERRUPT_API_PRESENT
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart_0"
#define ALT_STDERR_BASE 0x1101420
#define ALT_STDERR_DEV jtag_uart_0
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart_0"
#define ALT_STDIN_BASE 0x1101420
#define ALT_STDIN_DEV jtag_uart_0
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart_0"
#define ALT_STDOUT_BASE 0x1101420
#define ALT_STDOUT_DEV jtag_uart_0
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "AUDIO_SOPC"


/*
 * altera_extended_hal_bsp configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * audio configuration
 *
 */

#define ALT_MODULE_CLASS_audio altera_up_avalon_audio
#define AUDIO_BASE 0x1101400
#define AUDIO_IRQ 1
#define AUDIO_IRQ_INTERRUPT_CONTROLLER_ID 0
#define AUDIO_NAME "/dev/audio"
#define AUDIO_SPAN 16
#define AUDIO_TYPE "altera_up_avalon_audio"


/*
 * audio_and_video_config_0 configuration
 *
 */

#define ALT_MODULE_CLASS_audio_and_video_config_0 altera_up_avalon_audio_and_video_config
#define AUDIO_AND_VIDEO_CONFIG_0_BASE 0x1101410
#define AUDIO_AND_VIDEO_CONFIG_0_IRQ -1
#define AUDIO_AND_VIDEO_CONFIG_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AUDIO_AND_VIDEO_CONFIG_0_NAME "/dev/audio_and_video_config_0"
#define AUDIO_AND_VIDEO_CONFIG_0_SPAN 16
#define AUDIO_AND_VIDEO_CONFIG_0_TYPE "altera_up_avalon_audio_and_video_config"


/*
 * clocks_0 configuration
 *
 */

#define ALT_MODULE_CLASS_clocks_0 altera_up_avalon_clocks
#define CLOCKS_0_BASE 0x1101430
#define CLOCKS_0_IRQ -1
#define CLOCKS_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CLOCKS_0_NAME "/dev/clocks_0"
#define CLOCKS_0_SPAN 2
#define CLOCKS_0_TYPE "altera_up_avalon_clocks"


/*
 * jtag_uart_0 configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart_0 altera_avalon_jtag_uart
#define JTAG_UART_0_BASE 0x1101420
#define JTAG_UART_0_IRQ 0
#define JTAG_UART_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_0_NAME "/dev/jtag_uart_0"
#define JTAG_UART_0_READ_DEPTH 64
#define JTAG_UART_0_READ_THRESHOLD 8
#define JTAG_UART_0_SPAN 8
#define JTAG_UART_0_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_0_WRITE_DEPTH 64
#define JTAG_UART_0_WRITE_THRESHOLD 8


/*
 * sdram_0 configuration
 *
 */

#define ALT_MODULE_CLASS_sdram_0 altera_avalon_new_sdram_controller
#define SDRAM_0_BASE 0x800000
#define SDRAM_0_CAS_LATENCY 3
#define SDRAM_0_CONTENTS_INFO ""
#define SDRAM_0_INIT_NOP_DELAY 0.0
#define SDRAM_0_INIT_REFRESH_COMMANDS 2
#define SDRAM_0_IRQ -1
#define SDRAM_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_0_IS_INITIALIZED 1
#define SDRAM_0_NAME "/dev/sdram_0"
#define SDRAM_0_POWERUP_DELAY 100.0
#define SDRAM_0_REFRESH_PERIOD 15.625
#define SDRAM_0_REGISTER_DATA_IN 1
#define SDRAM_0_SDRAM_ADDR_WIDTH 22
#define SDRAM_0_SDRAM_BANK_WIDTH 2
#define SDRAM_0_SDRAM_COL_WIDTH 8
#define SDRAM_0_SDRAM_DATA_WIDTH 16
#define SDRAM_0_SDRAM_NUM_BANKS 4
#define SDRAM_0_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_0_SDRAM_ROW_WIDTH 12
#define SDRAM_0_SHARED_DATA 0
#define SDRAM_0_SIM_MODEL_BASE 1
#define SDRAM_0_SPAN 8388608
#define SDRAM_0_STARVATION_INDICATOR 0
#define SDRAM_0_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_0_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_0_T_AC 5.5
#define SDRAM_0_T_MRD 3
#define SDRAM_0_T_RCD 20.0
#define SDRAM_0_T_RFC 70.0
#define SDRAM_0_T_RP 20.0
#define SDRAM_0_T_WR 14.0


/*
 * sounds_ids configuration
 *
 */

#define ALT_MODULE_CLASS_sounds_ids altera_avalon_pio
#define SOUNDS_IDS_BASE 0x0
#define SOUNDS_IDS_BIT_CLEARING_EDGE_REGISTER 0
#define SOUNDS_IDS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SOUNDS_IDS_CAPTURE 0
#define SOUNDS_IDS_DATA_WIDTH 4
#define SOUNDS_IDS_DO_TEST_BENCH_WIRING 0
#define SOUNDS_IDS_DRIVEN_SIM_VALUE 0x0
#define SOUNDS_IDS_EDGE_TYPE "NONE"
#define SOUNDS_IDS_FREQ 50000000u
#define SOUNDS_IDS_HAS_IN 1
#define SOUNDS_IDS_HAS_OUT 0
#define SOUNDS_IDS_HAS_TRI 0
#define SOUNDS_IDS_IRQ -1
#define SOUNDS_IDS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SOUNDS_IDS_IRQ_TYPE "NONE"
#define SOUNDS_IDS_NAME "/dev/sounds_ids"
#define SOUNDS_IDS_RESET_VALUE 0x0
#define SOUNDS_IDS_SPAN 16
#define SOUNDS_IDS_TYPE "altera_avalon_pio"


/*
 * sram_0 configuration
 *
 */

#define ALT_MODULE_CLASS_sram_0 altera_up_avalon_sram
#define SRAM_0_BASE 0x1080000
#define SRAM_0_IRQ -1
#define SRAM_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SRAM_0_NAME "/dev/sram_0"
#define SRAM_0_SPAN 524288
#define SRAM_0_TYPE "altera_up_avalon_sram"


/*
 * start_sound configuration
 *
 */

#define ALT_MODULE_CLASS_start_sound altera_avalon_pio
#define START_SOUND_BASE 0x100
#define START_SOUND_BIT_CLEARING_EDGE_REGISTER 0
#define START_SOUND_BIT_MODIFYING_OUTPUT_REGISTER 0
#define START_SOUND_CAPTURE 0
#define START_SOUND_DATA_WIDTH 1
#define START_SOUND_DO_TEST_BENCH_WIRING 0
#define START_SOUND_DRIVEN_SIM_VALUE 0x0
#define START_SOUND_EDGE_TYPE "NONE"
#define START_SOUND_FREQ 50000000u
#define START_SOUND_HAS_IN 1
#define START_SOUND_HAS_OUT 0
#define START_SOUND_HAS_TRI 0
#define START_SOUND_IRQ -1
#define START_SOUND_IRQ_INTERRUPT_CONTROLLER_ID -1
#define START_SOUND_IRQ_TYPE "NONE"
#define START_SOUND_NAME "/dev/start_sound"
#define START_SOUND_RESET_VALUE 0x0
#define START_SOUND_SPAN 16
#define START_SOUND_TYPE "altera_avalon_pio"


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid
#define SYSID_BASE 0x1101428
#define SYSID_ID 199933333u
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1353869243u
#define SYSID_TYPE "altera_avalon_sysid"

#endif /* __SYSTEM_H_ */
