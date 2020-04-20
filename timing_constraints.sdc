create_clock -name clock -period 20.000 [get_ports {clk}]
create_generated_clock -source [get_ports {clk}] -multiply_by 4 -duty_cycle 50 [get_nets {pll_200MHz|pll_inst|altera_pll_i|outclk_wire[0]}]
derive_pll_clocks -create_base_clocks
derive_clock_uncertainty
