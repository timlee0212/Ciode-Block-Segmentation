transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/CBSeg {E:/Courses/ECE559/CBSeg/top_module.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/CBSeg {E:/Courses/ECE559/CBSeg/data_path_control.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/CBSeg {E:/Courses/ECE559/CBSeg/mux_ip.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/CBSeg {E:/Courses/ECE559/CBSeg/fifo_tb.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/CBSeg {E:/Courses/ECE559/CBSeg/shiftreg.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/CBSeg {E:/Courses/ECE559/CBSeg/crc24.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/CBSeg {E:/Courses/ECE559/CBSeg/counter_16bits.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/CBSeg {E:/Courses/ECE559/CBSeg/register_2bits.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/CBSeg {E:/Courses/ECE559/CBSeg/register_1bit.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/CBSeg {E:/Courses/ECE559/CBSeg/fifo16.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/CBSeg {E:/Courses/ECE559/CBSeg/fifo20.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/CBSeg {E:/Courses/ECE559/CBSeg/itl_fifo.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/CBSeg {E:/Courses/ECE559/CBSeg/enc_fifo.v}
vlog -sv -work work +incdir+E:/Courses/ECE559/CBSeg {E:/Courses/ECE559/CBSeg/CRC_size.sv}

vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/CBSeg {E:/Courses/ECE559/CBSeg/tb_cb_seg.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_cb_seg

add wave *
view structure
view signals
run 100 us
