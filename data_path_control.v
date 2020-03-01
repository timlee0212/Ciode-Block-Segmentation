module data_fsm(
    input wire clk,
    input wire reset,

	input wire empty_data_fifo,
	input wire empty_size_fifo,

	input wire[23:0] size,

	output wire mux_fill,
	output wire mux_crc,

	output wire init_crc,
	output wire ena_crc,
	output wire nshift_crc,

	output wire read_data_fifo,
	output wire read_size_fifo,

	output wire block_size,

	output wire start,
	output wire filling,
	output wire stop,
	output wire crc
);

reg[1:0] cm, cp, km, kp;
reg[15:0] fl;

parameter STATES = 

endmodule