#include <stdio.h>
#include "xil_printf.h"
#include "xil_io.h"
#include "xparameters.h"

#define XPAR_BRAM_0_S00_AXI_BASEADDR 0x43C00000

void write_data(u32 address, u32 data);
u32 read_data(u32 address);

int main()
{
	u32	data;

    print("Hello World\n\r");

    write_data(0x00000001, 0x00000011);
    write_data(0x00000002, 0x00000024);
    write_data(0x00000003, 0x00000009);

    data = read_data(0x00000002);
    printf("ADDR : 2, Data = %d\n\r", data);

    data = read_data(0x00000003);
    printf("ADDR : 3, Data = %d\n\r", data);

    data = read_data(0x00000001);
    printf("ADDR : 1, Data = %d\n\r", data);

    return 0;
}

void write_data(u32 address, u32 data)
{
    u32 ans;

    Xil_Out32(XPAR_BRAM_0_S00_AXI_BASEADDR + 0x00000004, 0x00000002);   //cmd write
    Xil_Out32(XPAR_BRAM_0_S00_AXI_BASEADDR + 0x00000008, data);         //data_in
    Xil_Out32(XPAR_BRAM_0_S00_AXI_BASEADDR + 0x0000000C, address);      //address
    Xil_Out32(XPAR_BRAM_0_S00_AXI_BASEADDR, 0x00000001);                //cmd valid
    Xil_Out32(XPAR_BRAM_0_S00_AXI_BASEADDR, 0x00000000);                //cmd no valid
    ans = 0x00000000;
    while(ans != 0x00000001)
    {
        ans = Xil_In32(XPAR_BRAM_0_S00_AXI_BASEADDR);                   //waiting for cmd done
    }
}

u32 read_data(u32 address)
{
    u32 ans;
    u32 data;

    Xil_Out32(XPAR_BRAM_0_S00_AXI_BASEADDR + 0x00000004, 0x00000001);   //cmd read
    Xil_Out32(XPAR_BRAM_0_S00_AXI_BASEADDR + 0x0000000C, address);      //address
    Xil_Out32(XPAR_BRAM_0_S00_AXI_BASEADDR, 0x00000001);                //cmd valid
    Xil_Out32(XPAR_BRAM_0_S00_AXI_BASEADDR, 0x00000000);                //cmd no valid
    ans = 0x00000000;
    while(ans != 0x00000001)
    {
        ans = Xil_In32(XPAR_BRAM_0_S00_AXI_BASEADDR);                   //waiting for cmd done
    }
    data = Xil_In32(XPAR_BRAM_0_S00_AXI_BASEADDR + 0x00000004);         //data_out
    return data;
}
