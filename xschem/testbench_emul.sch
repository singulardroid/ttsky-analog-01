v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -290 -110 -290 -30 {lab=#net1}
N -220 -110 -150 -110 {lab=#net1}
N -150 -110 -150 -20 {lab=#net1}
N -290 -110 -220 -110 {lab=#net1}
N -220 -110 -220 -90 {lab=#net1}
N -220 -30 -220 10 {lab=#net2}
N -220 70 -180 70 {lab=#net3}
N -180 0 -180 70 {lab=#net3}
N -180 0 -150 0 {lab=#net3}
N -290 30 -290 140 {lab=0}
N 150 140 170 140 {lab=0}
N -150 20 -150 140 {lab=0}
N -290 140 -150 140 {lab=0}
N 150 -20 150 30 {lab=#net4}
N 150 90 150 140 {lab=0}
N -150 140 150 140 {lab=0}
C {photo_emul.sym} 0 0 0 0 {name=x1}
C {ammeter.sym} -220 40 0 0 {name=Vamm savecurrent=true spice_ignore=0}
C {vsource.sym} -290 0 0 0 {name=V1 value=1.8 savecurrent=false}
C {isource.sym} -220 -60 0 0 {name=Iin value=1u}
C {vsource.sym} 150 60 0 0 {name=Vout value=0.9 savecurrent=false}
C {gnd.sym} -70 140 0 0 {name=l1 lab=0}
C {sky130_fd_pr/corner.sym} 180 -180 0 0 {name=CORNER only_toplevel=false corner=tt}
C {code_shown.sym} 210 -10 0 0 {name=CONTROL only_toplevel=false value="
.control
save all
* sweep 1: input current 100 nA .. 100 uA, linear steps, plotted on log axes
dc Iin 100n 100u 100n
plot abs(i(vout)) xlog ylog title 'Iout vs Iin (expect Iin/100)'
let ratio = abs(i(vout))/abs(i(vamm))
plot ratio xlog title 'mirror ratio Iout/Iin (expect 0.01)'
* sweep 2: low end, 10 nA .. 1 uA, where the mirror starts to drift
dc Iin 10n 1u 10n
let ratio_lo = abs(i(vout))/abs(i(vamm))
plot ratio_lo xlog title 'mirror ratio at low currents'
* sweep 3: same as 1 at Vout = 0.3, 0.9, 1.5 V (output resistance of M4)
dc Iin 100n 100u 100n Vout 0.3 1.5 0.6
plot abs(i(vout)) xlog ylog title 'Iout at Vout = 0.3 / 0.9 / 1.5 V'
.endc
"}
C {lab_wire.sym} -250 -110 0 0 {name=l2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -180 40 0 0 {name=l3 sig_type=std_logic lab=iin}
C {lab_wire.sym} 150 0 0 0 {name=l4 sig_type=std_logic lab=iout}
