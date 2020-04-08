transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/src {E:/Courses/ECE559/Code-Block-Segmentation/src/crc24.v}
vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/IP {E:/Courses/ECE559/Code-Block-Segmentation/IP/shiftreg.v}

vlog -vlog01compat -work work +incdir+E:/Courses/ECE559/Code-Block-Segmentation/tb {E:/Courses/ECE559/Code-Block-Segmentation/tb/tb_crc.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_crc

add wave *
view structure
view signals
run 5 us
