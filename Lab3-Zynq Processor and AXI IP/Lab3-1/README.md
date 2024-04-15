# FPGA Design Lab 3-1 - Zynq Processor
## Purpose
Zynq開發分為兩大部分，分別為PS(Processing System)端跟PL(Programmable Logic)端。
本次使用 PYNQ-Z2 上現有的 Zynq Processor 實作一個簡單的 C/C++ Project。
## Step 1. Download PuTTY
Here's [PuTTY](https://www.putty.org/)
## Step 2. Create a new project
由於本次是使用 FPGA 上固有的 Processor，所以不需加入任何 HDL code 及 Constraints。
## Step 3. Create block design
加入 ZYNQ7 Processing System IP

![](images/ZYNQ_IP_24.jpg)

按下 Run Block Automation

![](images/ZYNQ_run_24.jpg)

執行完畢 ZYNQ processor 會連出兩個 ports。

點開 ZYNQ processor 更改設定。本次實驗只需用到 ZYNQ processor 本身，所以要把沒用到的 I/O 取消。

![](images/ZYNQ_set_24.jpg)

PS-PL Configurations > General > Enable Clock Resets > FCLK_RESET0_N 取消勾選。
PS-PL Configurations > AXI Non Secure Enablement > GP Master AXI Interface > M AXI GP0 Interface 取消勾選。

![](images/PS-PL_conf_24.jpg)

Peripheral I/O Pins 僅留下 UART0 其餘取消勾選。

![](images/IO_pins_24.jpg)

Clock Configuration > PL Fabric Clocks > FCLK_CLK0 取消勾選。

![](images/CLK_conf_24.jpg)

OK 後 Diagram 的 ZYNQ7 processor 會變成如下圖所示。

![](images/ZYNQ_done_24.jpg)

將完成的 block design 包成 HDL wrapper (Lab2-2 Step5 最後一步)。
## Step 4. Run Implementation
按下 PROJECT MANAGER > Run Implementation。
>NOTE: 由於本次實驗僅使用 ZYNQ 現有的 ARM processor，無需產生 bitstream 所以只需執行到 Run Implementation 即可。
## Step 5. Launch Vitis IDE
File > Export > Export Hardware。

![](images/export_hw_24.jpg)

Tools > Launch Vitis IDE

![](images/launch_Vitis_IDE_24.jpg)

<!-- 路徑選擇專案路徑，Launch -->

<!-- ![](https://i.imgur.com/QQh5zdJ.png) -->

進入 Vitis 頁面

![](images/Vitis_GUI_24.jpg)

選擇open workspace，並新增資料夾作為 workspace

![](images/open_workspace_24.jpg)

建立新的 platform

![](images/create_platform_24.jpg)

選擇剛剛 export hardware 位置的 XSA 檔案

![](images/select_xsa_24.jpg)

Operating System: standlone(預設); Processor: ps7_cortexa9_0

![](images/select_os_24.jpg)

platform 完成後，圖如下

![](images/platform_done_24.jpg)

## Step 6. Write a hello world program
左側欄 Examples >> Embedded Software Examples >> Hello World

![](images/add_hello_world_24.jpg)

按下 Next 後，選擇剛剛完成的 platform

![](images/select_platform_24.jpg)

按下 finish 後，頁面如下

![](images/hello_world_done_24.jpg)

先 build platform 後再 build application，才不會發生 header file not found 的問題

![](images/build_platform_24.jpg)

![](images/build_application_24.jpg)

開啟 PuTTY，選擇 Serial，輸入連接 FPGA 的 COM，設定 Baud rate 為 115200。
>NOTE: 接上板子並開啟電源後 -> 在 開始 右鍵 -> 裝置管理員 -> 連接埠(COM和LPT) 即可看 FPGA 是連接至哪一個 COM

![](images/serial_port_24.jpg)
![](images/putty_set_24.jpg)

回到 Vitis，選擇 application，並執行下方的 Run，即可在 PuTTY 看到 "Hello World!" 的結果

![](images/application_run_24.jpg)
