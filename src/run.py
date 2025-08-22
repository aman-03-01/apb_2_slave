import os
import shutil
import subprocess
import sys

def hello():
    print(
        "Python: Script ready to help you. Usage: python run.py <command>\n"
        "Supported commands:\n"
        "  1. Clean Rundir: clean\n"
        "  2. Build UVM TB: build\n"
        "  3. Simulation: sim-c\n"
        "  4. Open Waves: waves"
    )

def clean():
    # Equivalent to: rm -rf rundir transcript* vish_stacktrace*
    print("Python: Cleaning up simulation area...")
    shutil.rmtree("rundir", ignore_errors=True)  # delete 'rundir' if exists
    for f in os.listdir("."):
        if f.startswith("transcript") or f.startswith("vish_stacktrace"):
            try:
                os.remove(f)
            except Exception:
                pass
    print("Python: Cleaned up the area before starting...")

def build():
    # Equivalent to:
    # mkdir rundir; cd rundir; vlog -sv ../uvm_tb/TB_TOP/apb_top.svh
    print("Python: Running Questa Sim Build Commands: Starting Build with Vlog...")
    os.makedirs("rundir", exist_ok=True)
    subprocess.run(
        "vlog -sv ../uvm_tb/TB_TOP/apb_top.svh",
        shell=True,
        cwd="rundir"  # run inside rundir
    )
    print("Python: Questa Sim Build Complete: End Of Build.")

def sim_c():
    # Equivalent to the long vsim line in Makefile
    print("Python: Running Questa Sim Simulation Commands: Starting Simulation with VSim...")
    cmd = (
        'vsim -vopt work.APB_TB_TOP -voptargs=+acc=npr '
        '-l build_APB_TB.log -coverage -assertdebug -c '
        '-do "add wave log -r /*; '
        'coverage save -onexit -directive -cvg -codeAll cov.ucdb; '
        'run -all; quit;" '
        '-wlf waveform.wlf'
    )
    subprocess.run(cmd, shell=True, cwd="rundir")
    print("Python: Questa Sim Simulation Complete: End Of Simulation.")
    print("Python: Questa Sim: Please find the waveforms under rundir/")

def waves():
    # Equivalent to: vsim -view rundir/waveform.wlf &
    print("Python: Opening waveform viewer...")
    subprocess.Popen("vsim -view waveform.wlf", shell=True, cwd="rundir")

# Entry point
if __name__ == "__main__":
    if len(sys.argv) < 2:
        hello()
    else:
        command = sys.argv[1]
        if command == "hello":
            hello()
        elif command == "clean":
            clean()
        elif command == "build":
            build()
        elif command == "sim-c":
            sim_c()
        elif command == "waves":
            waves()
        else:
            print(f"Unknown command: {command}")
            hello()

