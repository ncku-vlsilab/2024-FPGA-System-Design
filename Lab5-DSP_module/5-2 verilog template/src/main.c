#include <stdio.h>
#include "xil_printf.h"
#include "xil_io.h"
#include "xparameters.h"

int main(){
	u32 a, a_read, addr_cmd;

	a = 0x00000010;
	/*
	bram_addr = inst[9:0];
	bram_en = inst[10];
	dsp_inmode = inst[15:11];
	dsp_alumode = inst[19:16];
	dsp_opmode = inst[26:20];
	*/
	addr_cmd = 0b00000000010100001000110000000000;

	printf("\r\nLab 5-2 Program Start.\r\n");

	//Write Data in BRAM
	Xil_Out32(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR, a);

	//Write Data in DSP Port B
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, 0x0000003A);

	//Write CMD
	Xil_Out32(XPAR_AXI_GPIO_1_BASEADDR, addr_cmd);



	//Read Data from BRAM
	a_read = Xil_In32(XPAR_AXI_GPIO_2_BASEADDR + 0);


	printf("Data = %x\r\n", a_read);

}
