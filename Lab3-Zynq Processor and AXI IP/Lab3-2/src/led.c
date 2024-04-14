/*
 * led.c
 *
 * Created on: 2018/8/23
 * Author: VLSILAB
 */


#include "xparameters.h"
#include "xgpio.h"
#include "xil_printf.h"

#define SW_DEVICE_ID   XPAR_AXI_GPIO_0_BASEADDR
#define LED_DEVICE_ID  XPAR_AXI_GPIO_1_BASEADDR

#define LED_DELAY     10000000

XGpio LED_Gpio, SW_Gpio;

int main() {
	int LED_Status, SW_Status;
	u32 led_data = 0x00, sw_data;

	/* Initialize the GPIO driver */
	LED_Status = XGpio_Initialize(&LED_Gpio, LED_DEVICE_ID);
	SW_Status = XGpio_Initialize(&SW_Gpio, SW_DEVICE_ID);
	if (LED_Status != XST_SUCCESS || SW_Status) {
		xil_printf("Gpio Initialization Failed\r\n");
		return XST_FAILURE;
	}
	/* Set the direction for all signals as inputs except the LED output */
	XGpio_SetDataDirection(&LED_Gpio, 1, 0x00);
	XGpio_SetDataDirection(&SW_Gpio, 1, 0x03);

	while (1) {
			sw_data = XGpio_DiscreteRead(&SW_Gpio, 1);
			xil_printf("switches data = %d\r\n", sw_data);
			/* Set the LED to High */
			XGpio_DiscreteWrite(&LED_Gpio, 1, led_data);

			/* Wait a small amount of time so the LED is visible */
			for (int Delay = 0; Delay < LED_DELAY; Delay++);

			led_data ++;
			/* Clear the LED bit */
			//XGpio_DiscreteClear(&Gpio, LED_CHANNEL, led_data);

			/* Wait a small amount of time so the LED is visible */
			for (int Delay = 0; Delay < LED_DELAY; Delay++);
		}

		xil_printf("Successfully ran Gpio Example\r\n");
		return XST_SUCCESS;
}