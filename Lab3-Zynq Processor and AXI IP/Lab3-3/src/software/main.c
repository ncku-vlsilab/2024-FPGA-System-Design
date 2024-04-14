/*
 * main.c
 *
 *  Created on: 2021/4/11
 *      Author: VLSILAB
 */

#include <stdio.h>
#include "xil_printf.h"
#include "xil_io.h"
#include "xparameters.h"
#include "adder.h"


int main()
{
	u32	A, B, Sum;
	printf("Program Start.\n\r");
	while(getchar() != EOF) {

		printf("Input A:");
		scanf("%d", &A);
		printf(" %d\r\n", A);
		printf("Input B:");
		scanf("%d", &B);
		printf(" %d\r\n", B);


		Sum = add(XPAR_ADDER_0_BASEADDR, A, B);

		printf("A + B = %d\n\r", Sum);

	}
	printf("Program End.\n\r");
    return 0;
}
