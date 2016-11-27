#include "mfp_memory_mapped_registers.h"

int main ()
{
    for (;;)
    {
        //MFP_RED_LEDS      = MFP_SONAR_SENSOR >> 4;
	        MFP_7_SEGMENT_HEX = MFP_SONAR_SENSOR;
	  if(MFP_SONAR_SENSOR<0x10)
		MFP_CONTROL = 1;
	  else if (MFP_SONAR_SENSOR<0x12)
		MFP_CONTROL = 3;
	  else if (MFP_SONAR_SENSOR<0x14)
		MFP_CONTROL = 5;
	  else if (MFP_SONAR_SENSOR<0x16)
		MFP_CONTROL = 7;
	  else
		MFP_CONTROL = 0;
    }

    return 0;
}

