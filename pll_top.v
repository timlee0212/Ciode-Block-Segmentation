module top_with_pll(
	input wire reset,
	input wire clk,
	input wire test_start,
	
	output wire test_good,
	output wire test_end,
	
	//Debug Port for logic analyzer
	output wire[7:0] data,
	output wire size,
	output wire start,
	output wire crc,
	output wire filling
);

wire rst_lck, inner_clk, locked;

PLL pll_200MHz(
		.refclk(clk),   //  refclk.clk
		.rst(reset),      //   reset.reset
		.outclk_0(inner_clk), // outclk0.clk
		.locked(locked)    //  locked.export
	);
	
assign rst_lck = reset & (~locked);		//Keep Reset when PLL is not locked

mem_tb_cb_seg core(
	.reset(rst_lck),	//Combine 
	.clk(inner_clk),
	.test_start(test_start),
	
	.test_good(test_good),
	.test_end(test_end),
	
	//Debug Port for logic analyzer
	.data(data),
	.size(size),
	.start(start),
	.crc(crc),
	.filling(filling)
);

endmodule
