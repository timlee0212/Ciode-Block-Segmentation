onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_cb_seg/clk
add wave -noupdate /tb_cb_seg/reset
add wave -noupdate /tb_cb_seg/tb_in
add wave -noupdate /tb_cb_seg/wreq_tb
add wave -noupdate /tb_cb_seg/wreq_size
add wave -noupdate /tb_cb_seg/tb_size_in
add wave -noupdate /tb_cb_seg/filling
add wave -noupdate /tb_cb_seg/crc
add wave -noupdate /tb_cb_seg/start
add wave -noupdate /tb_cb_seg/stop
add wave -noupdate /tb_cb_seg/cb_size
add wave -noupdate /tb_cb_seg/cb_data
add wave -noupdate /tb_cb_seg/length
add wave -noupdate /tb_cb_seg/iterations
add wave -noupdate /tb_cb_seg/i
add wave -noupdate /tb_cb_seg/k
add wave -noupdate /tb_cb_seg/record_start
add wave -noupdate /tb_cb_seg/check_out
add wave -noupdate /tb_cb_seg/switch
add wave -noupdate /tb_cb_seg/input_vector
add wave -noupdate /tb_cb_seg/cb1_data
add wave -noupdate /tb_cb_seg/cb1_crc
add wave -noupdate /tb_cb_seg/output_vector1
add wave -noupdate /tb_cb_seg/cb2_data
add wave -noupdate /tb_cb_seg/cb2_crc
add wave -noupdate /tb_cb_seg/output_vector2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {71896265 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {71803418 ps} {72079684 ps}
