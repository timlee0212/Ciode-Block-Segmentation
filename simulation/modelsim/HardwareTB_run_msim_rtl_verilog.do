transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/src {E:/Courses/ECE559/Code-Block-Segmentation/src/top_module.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/src {E:/Courses/ECE559/Code-Block-Segmentation/src/data_path_control.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/src {E:/Courses/ECE559/Code-Block-Segmentation/src/crc24.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/IP {E:/Courses/ECE559/Code-Block-Segmentation/IP/shiftreg.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/IP {E:/Courses/ECE559/Code-Block-Segmentation/IP/register_2bits.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/IP {E:/Courses/ECE559/Code-Block-Segmentation/IP/register_1bit.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/IP {E:/Courses/ECE559/Code-Block-Segmentation/IP/mux_ip.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/IP {E:/Courses/ECE559/Code-Block-Segmentation/IP/fifo20.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/IP {E:/Courses/ECE559/Code-Block-Segmentation/IP/fifo16.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/IP {E:/Courses/ECE559/Code-Block-Segmentation/IP/fifo_tb.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/IP {E:/Courses/ECE559/Code-Block-Segmentation/IP/counter_16bits.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/src {E:/Courses/ECE559/Code-Block-Segmentation/src/htb_cbseg.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/IP {E:/Courses/ECE559/Code-Block-Segmentation/IP/test_input.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/IP {E:/Courses/ECE559/Code-Block-Segmentation/IP/ref_large.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/IP {E:/Courses/ECE559/Code-Block-Segmentation/IP/ref_small.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/IP {E:/Courses/ECE559/Code-Block-Segmentation/IP/register_8bits.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/IP {E:/Courses/ECE559/Code-Block-Segmentation/IP/crc_shift_mux.v}
vlog -sv -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/src {E:/Courses/ECE559/Code-Block-Segmentation/src/CRC_size.sv}

vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/tb {E:/Courses/ECE559/Code-Block-Segmentation/tb/tb_cb_seg.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_cb_seg

add wave *
view structure
view signals
run 10 us
