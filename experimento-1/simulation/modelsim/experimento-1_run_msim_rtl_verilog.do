transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1 {C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1/fsm_module.sv}
vlog -sv -work work +incdir+C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1 {C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1/coin_counter_module.sv}
vlog -sv -work work +incdir+C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1 {C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1/substractor_module.sv}
vlog -sv -work work +incdir+C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1 {C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1/coin_comparator_module.sv}
vlog -sv -work work +incdir+C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1 {C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1/time_per_coffee_module.sv}
vlog -sv -work work +incdir+C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1 {C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1/time_comparator_module.sv}
vlog -sv -work work +incdir+C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1 {C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1/coffee_machine.sv}
vlog -sv -work work +incdir+C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1 {C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1/timer_module.sv}
vlog -sv -work work +incdir+C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1 {C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1/coin_display_module.sv}

vlog -sv -work work +incdir+C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1 {C:/Users/ranmsy/Desktop/laboratorio-1-codigos/CE3201-Laboratorio-4/experimento-1/general_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  general_tb

add wave *
view structure
view signals
run -all
