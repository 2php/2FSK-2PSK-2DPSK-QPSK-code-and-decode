transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/Communication/Quartus/Work/DPSK {E:/Communication/Quartus/Work/DPSK/rom_sine0.v}
vlog -vlog01compat -work work +incdir+E:/Communication/Quartus/Work/DPSK {E:/Communication/Quartus/Work/DPSK/test.v}
vlog -vlog01compat -work work +incdir+E:/Communication/Quartus/Work/DPSK {E:/Communication/Quartus/Work/DPSK/qpsk_tz.v}
vlog -vlog01compat -work work +incdir+E:/Communication/Quartus/Work/DPSK {E:/Communication/Quartus/Work/DPSK/dds.v}
vlog -vlog01compat -work work +incdir+E:/Communication/Quartus/Work/DPSK {E:/Communication/Quartus/Work/DPSK/adder#.v}
vlog -vlog01compat -work work +incdir+E:/Communication/Quartus/Work/DPSK {E:/Communication/Quartus/Work/DPSK/qpsk_jt.v}
vlog -vlog01compat -work work +incdir+E:/Communication/Quartus/Work/DPSK {E:/Communication/Quartus/Work/DPSK/qseq.v}
vlog -vlog01compat -work work +incdir+E:/Communication/Quartus/Work/DPSK {E:/Communication/Quartus/Work/DPSK/add.v}
vlog -vlog01compat -work work +incdir+E:/Communication/Quartus/Work/DPSK {E:/Communication/Quartus/Work/DPSK/pll.v}
vlog -vlog01compat -work work +incdir+E:/Communication/Quartus/Work/DPSK {E:/Communication/Quartus/Work/DPSK/mac.v}
vlog -vlog01compat -work work +incdir+E:/Communication/Quartus/Work/DPSK {E:/Communication/Quartus/Work/DPSK/qpsk1.v}
vlog -vlog01compat -work work +incdir+E:/Communication/Quartus/Work/DPSK/db {E:/Communication/Quartus/Work/DPSK/db/pll_altpll.v}

vlog -vlog01compat -work work +incdir+E:/Communication/Quartus/Work/DPSK/simulation/modelsim {E:/Communication/Quartus/Work/DPSK/simulation/modelsim/QPSK1.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  QPSK1_vlg_tst

add wave *
view structure
view signals
run -all
