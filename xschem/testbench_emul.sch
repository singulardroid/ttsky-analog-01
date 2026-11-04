v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 250 60 160 {lab=VDD}
N 130 160 200 160 {lab=VDD}
N 200 160 200 250 {lab=VDD}
N 60 160 130 160 {lab=VDD}
N 110 180 130 160 {lab=VDD}
N 110 240 110 260 {lab=#net1}
N 0 310 60 410 {lab=0}
N 500 410 520 410 {lab=0}
N 200 290 200 410 {lab=0}
N 60 410 200 410 {lab=0}
N 500 250 500 300 {lab=iout}
N 500 360 500 410 {lab=0}
N 200 410 500 410 {lab=0}
N 110 320 110 350 {lab=pad}
N 170 310 170 350 {lab=iin}
N 170 270 170 310 {lab=iin}
N 170 270 200 270 {lab=iin}
N 70 330 110 330 {lab=pad}
N 280 450 280 460 {lab=0}
N 280 410 280 450 {lab=0}
N 70 390 70 410 {lab=0}
C {photo_emul.sym} 350 270 0 0 {name=x1}
C {ammeter.sym} 110 290 0 0 {name=Vamm savecurrent=true spice_ignore=0}
C {vsource.sym} 0 280 0 0 {name=V1 value=1.8 savecurrent=false}
C {isource.sym} 110 210 0 0 {name=Iin value=1u}
C {vsource.sym} 500 330 0 0 {name=Vout value=0.9 savecurrent=false}
C {gnd.sym} 280 450 0 0 {name=l1 lab=0}
C {sky130_fd_pr/corner.sym} 530 90 0 0 {name=CORNER only_toplevel=false corner=tt}
C {code_shown.sym} 550 260 0 0 {name=CONTROL only_toplevel=false value="
.option savecurrents
.control
save all
* sweep 1: input current 100 nA .. 100 uA (linear steps, log axes in the plots)
dc Iin 100n 100u 100n
plot abs(i(vout)) xlog ylog title 'Iout vs Iin (expect Iin/100)'
plot abs(i(vout))/abs(i(vamm)) xlog title 'mirror ratio Iout/Iin (expect 0.01)'
write testbench_emul.raw
set appendwrite
* sweep 2: low end, 10 nA .. 1 uA
dc Iin 10n 1u 10n
plot abs(i(vout))/abs(i(vamm)) xlog title 'mirror ratio at low currents'
write testbench_emul.raw
* sweep 3: same as 1 at Vout = 0.3, 0.9, 1.5 V
dc Iin 100n 100u 100n Vout 0.3 1.5 0.6
plot abs(i(vout)) xlog ylog title 'Iout at Vout = 0.3 / 0.9 / 1.5 V'
write testbench_emul.raw
* transient: step 1 -> 10 uA through the 500 ohm / 5 pF pin model
alter Iin dc = 1u
alter @Iin[pulse] = [ 1u 10u 1u 1n 1n 5u 10u ]
tran 10n 12u
plot v(pad) abs(i(vout)) title 'step through the pin model'
write testbench_emul.raw
.endc
"}
C {lab_wire.sym} 100 160 0 0 {name=l2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 170 310 0 0 {name=l3 sig_type=std_logic lab=iin}
C {lab_wire.sym} 500 270 0 0 {name=l4 sig_type=std_logic lab=iout}
C {devices/launcher.sym} 810 130 0 0 {name=h17 
descr="Load waves" 
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw
"
}
C {res.sym} 140 350 1 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {capa.sym} 70 360 0 0 {name=C1
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 110 335 0 0 {name=l5 sig_type=std_logic lab=pad}
T {1. Iout and Iin vs Iin, sweep 1 (log-log: two parallel lines, Iout 100x below)} -1110 -520 0 0 0.35 0.35 {layer=4}
B 2 -1110 -500 -310 -100 {flags=graph,unlocked
y1=-9
y2=-4
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-7
x2=-4
divx=5
subdivx=8
node="\\"Iout;i(vout) abs()\\"
\\"Iin;i(vamm) abs()\\""
color="4 7"
dataset=0
unitx=1
logx=1
logy=1
sim_type=dc
sweep=""
rawfile=$netlist_dir/testbench_emul.raw
autoload=1}
T {2. Mirror ratio Iout/Iin, sweep 1 (expect 0.0098 .. 0.012)} -1950 -520 0 0 0.35 0.35 {layer=4}
B 2 -1950 -500 -1150 -100 {flags=graph,unlocked
y1=0.008
y2=0.014
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-7
x2=-4
divx=5
subdivx=8
node="\\"ratio;i(vout) abs() i(vamm) abs() /\\""
color="4"
dataset=0
unitx=1
logx=1
logy=0
sim_type=dc
sweep=""
rawfile=$netlist_dir/testbench_emul.raw
autoload=1}
T {3. Node voltages vs Iin, sweep 1 (iin = NMOS Vgs 0.45..0.9 V, pad just above it, x1.net1 = PMOS diode node, iout = 0.9)} -1110 -80 0 0 0.35 0.35 {layer=4}
B 2 -1110 -60 -310 340 {flags=graph,unlocked
y1=0
y2=1.8
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-7
x2=-4
divx=5
subdivx=8
node="iin
pad
x1.net1
iout"
color="4 7 12 5"
dataset=0
unitx=1
logx=1
logy=0
sim_type=dc
sweep=""
rawfile=$netlist_dir/testbench_emul.raw
autoload=1}
T {4. Drain currents of M1..M4 vs Iin, sweep 1 (M1 = Iin, M2 = M3 = Iin/10, M4 = Iin/100)} -1950 -80 0 0 0.35 0.35 {layer=4}
B 2 -1950 -60 -1150 340 {flags=graph,unlocked
y1=-9
y2=-4
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-7
x2=-4
divx=5
subdivx=8
node="\\"M1;i(@m.x1.xm1.msky130_fd_pr__nfet_01v8[id]) abs()\\"
\\"M2;i(@m.x1.xm2.msky130_fd_pr__nfet_01v8[id]) abs()\\"
\\"M3;i(@m.x1.xm3.msky130_fd_pr__pfet_01v8[id]) abs()\\"
\\"M4;i(@m.x1.xm4.msky130_fd_pr__pfet_01v8[id]) abs()\\""
color="4 7 12 5"
dataset=0
unitx=1
logx=1
logy=1
sim_type=dc
sweep=""
rawfile=$netlist_dir/testbench_emul.raw
autoload=1}
T {5. Mirror ratio at low currents, sweep 2 (10 nA..1 uA, drifts up to ~0.013)} -1110 360 0 0 0.35 0.35 {layer=4}
B 2 -1110 380 -310 780 {flags=graph,unlocked
y1=0.008
y2=0.016
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-8
x2=-6
divx=5
subdivx=8
node="\\"ratio_lo;i(vout) abs() i(vamm) abs() /\\""
color="4"
dataset=1
unitx=1
logx=1
logy=0
sim_type=dc
sweep=""
rawfile=$netlist_dir/testbench_emul.raw
autoload=1}
T {6. Iout vs Iin at Vout = 0.3 / 0.9 / 1.5 V, sweep 3 (three traces ~5 % apart; ignore the jump lines)} -1950 360 0 0 0.35 0.35 {layer=4}
B 2 -1950 380 -1150 780 {flags=graph,unlocked
y1=-9
y2=-5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-7
x2=-4
divx=5
subdivx=8
node="\\"Iout;i(vout) abs()\\""
color="4"
dataset=2
unitx=1
logx=1
logy=1
sim_type=dc
sweep=""
rawfile=$netlist_dir/testbench_emul.raw
autoload=1}
T {7. Transient stimulus and response: Iin 1 -> 10 -> 1 uA, Iout follows at 1/100} -1110 800 0 0 0.35 0.35 {layer=4}
B 2 -1110 820 -310 1220 {flags=graph,unlocked
y1=0
y2=1.2e-05
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.2e-05
divx=5
subdivx=8
node="\\"Iin;i(vamm) abs()\\"
\\"Iout x100;i(vout) abs() 100 *\\""
color="4 7"
dataset=0
unitx=1
logx=0
logy=0
sim_type=tran
sweep=""
rawfile=$netlist_dir/testbench_emul.raw
autoload=1}
T {8. pad, iin and PMOS diode node during the step (5 pF charges through the diode, ~0.3 us)} -1950 800 0 0 0.35 0.35 {layer=4}
B 2 -1950 820 -1150 1220 {flags=graph,unlocked
y1=0
y2=1.8
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.2e-05
divx=5
subdivx=8
node="pad
iin
x1.net1"
color="4 7 12"
dataset=0
unitx=1
logx=0
logy=0
sim_type=tran
sweep=""
rawfile=$netlist_dir/testbench_emul.raw
autoload=1}
T {9. Iout during the step, zoomed (11 nA -> 102 nA -> 11 nA, settles in ~0.3 us)} -1110 1240 0 0 0.35 0.35 {layer=4}
B 2 -1110 1260 -310 1660 {flags=graph,unlocked
y1=0
y2=1.2e-07
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.2e-05
divx=5
subdivx=8
node="\\"Iout;i(vout) abs()\\""
color="4"
dataset=0
unitx=1
logx=0
logy=0
sim_type=tran
sweep=""
rawfile=$netlist_dir/testbench_emul.raw
autoload=1}
T {10. Drain currents of M1..M4 during the step (each stage 10x below the previous)} -1950 1240 0 0 0.35 0.35 {layer=4}
B 2 -1950 1260 -1150 1660 {flags=graph,unlocked
y1=-9
y2=-4
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.2e-05
divx=5
subdivx=8
node="\\"M1;i(@m.x1.xm1.msky130_fd_pr__nfet_01v8[id]) abs()\\"
\\"M2;i(@m.x1.xm2.msky130_fd_pr__nfet_01v8[id]) abs()\\"
\\"M3;i(@m.x1.xm3.msky130_fd_pr__pfet_01v8[id]) abs()\\"
\\"M4;i(@m.x1.xm4.msky130_fd_pr__pfet_01v8[id]) abs()\\""
color="4 7 12 5"
dataset=0
unitx=1
logx=0
logy=1
sim_type=tran
sweep=""
rawfile=$netlist_dir/testbench_emul.raw
autoload=1}
