hello:
	echo "Makefile: Makefile ready to help you. make <command>, commmand support: 1.Clean Rundir: clean 2.Build UVM TB: build 3.Simulation: sim-c 4.Open Waves: waves"

clean:
	rm -rf rundir transcript* vish_stacktrace*
	echo "Makefile: Cleaned up the area before starting............................"
build: 
	echo "Makefile: Running Questa Sim Build Commands:  Starting Build with Vlog............................"
	mkdir rundir;cd rundir;vlog -sv ../uvm_tb/TB_TOP/apb_top.svh
	echo "Makefile: Questa Sim Build Complete :  End Of Build............................"
sim-c:
	echo "Makefile: Running Questa Sim Simulation Commands:  Starting Simulation with VSim............................"
	cd rundir;vsim -vopt work.APB_TB_TOP -voptargs=+acc=npr -l build_APB_TB.log -coverage -assertdebug -c -do "add wave log -r /*; coverage save -onexit -directive -cvg -codeAll cov.ucdb; run -all;quit;" -wlf waveform.wlf
	echo "Makefile: Questa Sim Simulation Complete : End Of Simulation............................"
	echo "Makefile: Questa Sim: Please Find the waveforms unders rundir/............................"
#waves:
#	vsim -view rundir/waveform.wlf &
# Clone @ 
# https://gitlab.com/rishabh.s.vasisht/uvm_tb_apb_2slave_1master.git
