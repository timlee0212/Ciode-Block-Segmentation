module cb_seg(
    input wire clk,
    input wire reset,
    input wire tb_in,
    input wire wreq_data,        //Write Request of the Input TB buffer
    input wire[15:0] tb_size_in,  
    input wire wreq_size,
    //TODO: A signal from Transfer Layer to initilize the computation?

    //Control Signals
    output wire filling,
    output wire crc,
    output wire start,
    output wire stop,

    output wire cb_size,  //1-bit 2 possible size
    output wire cb_data  //Serial Data Output
);

wire data_fifo_out;
wire data_fifo_rd, data_fifo_empty, size_fifo_rd, size_fifo_empty;

wire[15:0] size_fifo_data;

wire padding_mux_out, crc_out;
wire[23:0] crc_out;
wire padding_mux_sel, crc_mux_sel, crc_init, crc_ena_com, crc_nshift;

//Data Path
mux_ip	padding_mux (
	.data0 ( 1'b0 ),
	.data1 ( data_fifo_out ),
	.sel ( padding_mux_sel ),
	.result ( padding_mux_out )
	);

mux_ip	crc_mux (
	.data0 ( padding_mux_out ),
	.data1 ( crc_out[0] ),
	.sel ( crc_mux_sel ),
	.result ( cb_data )
	);

fifo_tb	data_fifo (
	.clock ( clk),
	.data ( tb_in ),
	.rdreq ( data_fifo_rd ),
	.wrreq ( wreq_data ),
	.empty ( data_fifo_empty ),
	.q ( data_fifo_out )
	);

crc24 crc_mod(
    .clk(clk),
    .reset(reset),
    .init(crc_init),
    .en_com(crc_ena_com),
    .d_in(padding_mux_out),
    .nen_shift(crc_nshift),

    .crc_out(crc_out)
);


data_fsm datapath_control_unit(
    .clk(clk),
    .reset(reset),

	.empty_data_fifo(data_fifo_empty),
	.empty_size_fifo(size_fifo_empty),

	.size(size_fifo_data),

	.mux_fill(padding_mux_sel),
	.mux_crc(crc_mux_sel),

    .init_crc(crc_init),
	.ena_crc(crc_ena_com),
    .nshift_crc(crc_nshift)

	.read_data_fifo(data_fifo_rd),
	.read_size_fifo(size_fifo_rd),

	.block_size(cb_size),

	.start(start),
	.filling(filling),
	.stop(stop),
	.crc(crc)
);

//Block Size Computation

CRC_size  cb_size_computation(
	.aclr(reset),
	.clk(clk),
	.w(wreq_size),
	.inputSize(tb_size_in),
	.r_out(size_fifo_rd),
	.empty_out(size_fifo_empty),
	.data_out(size_fifo_data)
);

endmodule