#ifndef MFP_MEMORY_MAPPED_REGISTERS_H
#define MFP_MEMORY_MAPPED_REGISTERS_H

#define MFP_RED_LEDS_ADDR       0xBF800000
#define MFP_GREEN_LEDS_ADDR     0xBF800004
#define MFP_SWITCHES_ADDR       0xBF800008
#define MFP_BUTTONS_ADDR        0xBF80000C
#define MFP_7_SEGMENT_HEX_ADDR  0xBF800010
#define MFP_LIGHT_SENSOR_ADDR   0xBF800014
#define MFP_SONAR_SENSOR_ADDR   0xBF800018

#define MFP_buzz_en_ADDR	     0xBF80001C
#define MFP_SONIC_SENSOR_ADDR   0xBF800020
#define MFP_CONTROL_ADDR        0xBF800024

#define MFP_RED_LEDS            (* (volatile unsigned *) MFP_RED_LEDS_ADDR      )
#define MFP_GREEN_LEDS          (* (volatile unsigned *) MFP_GREEN_LEDS_ADDR    )
#define MFP_SWITCHES            (* (volatile unsigned *) MFP_SWITCHES_ADDR      )
#define MFP_BUTTONS             (* (volatile unsigned *) MFP_BUTTONS_ADDR       )
#define MFP_7_SEGMENT_HEX       (* (volatile unsigned *) MFP_7_SEGMENT_HEX_ADDR )
#define MFP_LIGHT_SENSOR        (* (volatile unsigned *) MFP_LIGHT_SENSOR_ADDR  )
#define MFP_SONAR_SENSOR        (* (volatile unsigned *) MFP_SONAR_SENSOR_ADDR  )
#define MFP_SONIC_SENSOR        (* (volatile unsigned *) MFP_SONIC_SENSOR_ADDR  )
#define MFP_CONTROL		     (* (volatile unsigned *) MFP_CONTROL_ADDR  )
#define MFP_buzz_en		(* (volatile unsigned *) MFP_buzz_en_ADDR )
// This define is used in boot.S code

#define BOARD_16_LEDS_ADDR      MFP_RED_LEDS_ADDR

#endif
