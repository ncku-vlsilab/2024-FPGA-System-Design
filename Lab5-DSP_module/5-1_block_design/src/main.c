#include <stdio.h>
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_io.h"

int main(){

	UINTPTR addr_gpio_i = 0x41200000;
	UINTPTR addr_gpio_o = 0x41210000;

	int32_t A, B;
	uint32_t C;
	int32_t P;

	printf("Program starts.\r\n");

	while(getchar() != EOF)
	{
		printf("Input A (16-bit) :");
		scanf("%d", &A);
		printf("%d\r\n", A);
		printf("Input B (16-bit) :");
		scanf("%d", &B);
		printf("%d\r\n", B);

		C = (B << 16) + (A & 0x0000ffff);

		//printf("C = %x\r\n", C);

		Xil_Out32(addr_gpio_i, C);
		P = Xil_In32(addr_gpio_o);

		printf("A * B = %d\r\n", P);


	}

	return 0;

}
