

/***************************** Include Files *******************************/
#include "adder.h"

/************************** Function Definitions ***************************/


u32 add(UINTPTR baseAddr, u32 A, u32 B) {
	u32 Sum;
	u32 data = A + (B << 3);
	ADDER_mWriteReg(baseAddr, 0, data);
	Sum = ADDER_mReadReg (baseAddr, 4);
	return Sum;
}
