4-1 Use BRAM Generator IP to Utilize Block RAM
===

## Purpose

使用圖形化介面，透過 Block Memory Generator IP 來呼叫 Block RAM。

## Block Design

和之前的 project flow 都一樣，建立專案後 Create Block Design，並加入 `Block Memory Generator`、`AXI BRAM Controller`兩個 IP。

![Add IP](images/add_ip_24.jpg)

在 `AXI BRAM Controller` 的圖示左鍵點擊兩下，進入調整 IP 的介面，並依照下圖調整。

![BRAM Controll](images/bram_ctrl_24.jpg)

完成後再加入 Zynq Processor 的IP，並執行 `Block Automation`、`Connection Automation`，完成後的 Block Design 應該會如下圖。

![Block Design](images/bd_24.jpg)

圖中 `Block Memory Generator` 的 Output Port 是 Block RAM 的 busy 訊號，我們再加上一個 Output Port 連接到 LED 來觀察 BRAM 的運作。

![Block Design 2](images/bd2_24.jpg)

接著加入 `xdc/pynq-z2_v1.0.xdc`；將 Block Design 轉換成 HDL Wrapper 後 Generate Bitstream。

完成後打開 Project Summary 的 Utilization Table 可以看到 BRAM 的 Utilization。

![Utilization](images/utilization_24.jpg)

接著參照 Lab3 建立 Vitis 的 C code Project，加入 `src/main.c` 到 Project 中並執行。

![PuTTy](images/putty_24.jpg)
