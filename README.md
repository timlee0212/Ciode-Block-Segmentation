# Code Block Segmentation

Course Project for ECE559

By: __Shiyu Li, Zhiyao Xie__

Update: _2020.03.27_

## _Function Overview_

TBD

## _Simplification and Assumption_

TBD

## Module Diagram

TBD

## Interface

If there&#39;s no extra indication, all control ports are active high.

## Input Ports

### Definitions

**reset** :   Power-on reset signal

**clk** :    Clock signal, current maximum clock frequency is **144MHz**

**tb\_in** :   Bit-serial data of the transportation layer (the input of the overall system)

**wreq\_data** :  Write Request of the input data FIFO. It should be asserted at the same cycle of valid data in tb\_in.

**tb\_size\_in** :  16 bits/2Bytes indicating the size of the input data.

**wreq\_size:**   Write Request of the input size FIFO. It should be asserted at the same cycle of valid size presented in tb\_size\_in.

**rreq\_itl\_fifo** : **       ** Read request port for the output FIFO buffer for interleaver module. It should be asserted one cycle ahead of the desired data readout.

**rreq\_enc\_fifo** : **       ** Read request port for the output FIFO buffer for the encoder module. It should be asserted one cycle ahead of the desired data readout.

### Timing

The size should be written to the FIFO before the valid data is presented. For both data and size FIFO, the write request signal should be asserted **at the same cycle** when the valid input is presented.

![image.png](https://i.loli.net/2020/04/01/XFaHoN5QM3Dsvj8.png)

In this example, at the cycle 2, the 16 bits size is written into the size FIFO, while the data presented on tb\_in is not written into the data FIFO since the wreq port is not asserted. At cycle 3 and the cycles after, the wreq is asserted and all data presented on tb\_in will be written into the data FIFO as the valid input.

Since the write request ports are related to the output buffer FIFOs, we&#39;ll talk about it in the output ports section.

## Output Ports

### Definitions

**data***: The bit-serial output code block data. The valid data bit is presented at the next cycle when the size signal is asserted.

**start\* **:  Indicating the start of the code block.

**size\* **:  1 bit signal following the start signal. It indicates the size of the current code block. High for large block (6144bits). Low for small block (1056bits).

**crc\* **:  Indicating the current data bit is the CRC.

**filling\* **:  Indicating the current data bit is the filling bit.

**q\_itl\_fifo** : 5 bits data output port of the output FIFO buffer for the interleaver module. The data format is {data, size, start, crc, filling}. MSB is at the leftmost position.

**empty\_itl\_fifo** : Indicating whether the FIFO buffer for interleaver is empty. For speed optimization, we disable the empty read check of the FIFO IP, so **always check empty before readout.**

**q\_enc\_fifo:**  3 bits data output port of the output FIFO buffer for the encoder module. The data format is {data, size, start}. MSB is at the leftmost position.

**empty\_enc\_fifo:  **  Indicating whether the FIFO buffer for the encoder is empty. For speed optimization, we disable the empty read check of the FIFO IP, so **always check empty before readout.**

_\*.This is not the actual output of this module. It is buffered in the FIFOs for use._

### Timing

First, we&#39;ll present the timing of the internal output signals which is stored in the buffer FIFO.

![image.png](https://i.loli.net/2020/04/01/vNnCIkyZ2X6rgfd.png)

Start signal will first be asserted, then the module gives the size. In the next cycle, the valid code block data is presented. The filling bits will always at the head of the code block and the CRC will be at the end of the block.

![image.png](https://i.loli.net/2020/04/01/Ju5bZMKWPAaT9eR.png)

The timing for the two FIFOs is the common readout behavior of the FIFO. The next cycle after the read request port is asserted, the data will present at the q port and popped out of the FIFO. These two FIFOs are independent. For speed consideration, we disable the underflow check of the FIFO module. The user should always check whether the FIFO is empty before assert the read request, or the FIFO will be corrupted.

