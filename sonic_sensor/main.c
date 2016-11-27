#include "mfp_memory_mapped_registers.h"

int main ()
{
	MFP_CONTROL = 8;
    for (;;)
    {
        //MFP_RED_LEDS      = MFP_SONICR_SENSOR >> 4;
	        MFP_7_SEGMENT_HEX = MFP_SONIC_SENSOR;
	  if(MFP_SONIC_SENSOR<0x10)
		MFP_CONTROL = 1+8;
	  else if (MFP_SONIC_SENSOR<0x12)
		MFP_CONTROL = 3+8;
	  else if (MFP_SONIC_SENSOR<0x14)
		MFP_CONTROL = 5+8;
	  else if (MFP_SONIC_SENSOR<0x16)
		MFP_CONTROL = 7+8;
	  else
		MFP_CONTROL = 0+8;
    }

    return 0;
}

