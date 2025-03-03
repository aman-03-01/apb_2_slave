hello:
	echo "Makefile ready to help you. make <command>, commmand support: 1.Clean Rundir: clean 2.Build UVM TB: build 3.Simulation: sim-c 4.Open Waves: waves"
build: 
	mkdir rundir;cd rundir;vlog -sv ../uvm_tb/TB_TOP/apb_top.svh
sim-c:
	cd rundir;vsim -vopt work.APB_TB_TOP -voptargs=+acc=npr -l build_APB_TB.log -coverage -assertdebug -c -do "add wave log -r /*; coverage save -onexit -directive -cvg -codeAll cov.ucdb; run -all;quit;" -wlf waveform.wlf
waves:
#	vsim -view rundir/waveform.wlf &
clean:
	rm -rf rundir transcript* vish_stacktrace*

# Clone @ 
# https://gitlab.com/rishabh.s.vasisht/uvm_tb_apb_2slave_1master.git
