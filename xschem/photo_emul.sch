v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 40 -20 80 -20 {lab=IIN}
N 40 -80 40 -20 {lab=IIN}
N -40 -80 40 -80 {lab=IIN}
N -40 -80 -40 -50 {lab=IIN}
N 120 60 180 60 {lab=VSS}
N -40 30 -40 60 {lab=VSS}
N -110 -20 -40 -20 {lab=VSS}
N -110 -20 -110 30 {lab=VSS}
N -110 30 -40 30 {lab=VSS}
N 120 -20 180 -20 {lab=VSS}
N 180 -20 180 30 {lab=VSS}
N 120 30 180 30 {lab=VSS}
N 120 30 120 60 {lab=VSS}
N 270 -180 300 -180 {lab=#net1}
N 200 -150 200 -90 {lab=i10}
N 120 -90 200 -90 {lab=i10}
N 120 -90 120 -50 {lab=i10}
N 200 -150 270 -150 {lab=#net1}
N 270 -180 270 -150 {lab=#net1}
N 340 -150 340 -80 {lab=IOUT}
N 340 -80 420 -80 {lab=IOUT}
N -230 -80 -40 -80 {lab=IIN}
N -0 -20 40 -20 {lab=IIN}
N -230 60 -40 60 {lab=VSS}
N -40 10 -40 30 {lab=VSS}
N 120 10 120 30 {lab=VSS}
N -40 60 120 60 {lab=VSS}
N 240 -180 270 -180 {lab=#net1}
N 340 -290 460 -290 {lab=VDD}
N 200 -290 340 -290 {lab=VDD}
N -230 -290 200 -290 {lab=VDD}
N 200 -290 200 -210 {lab=VDD}
N 340 -290 340 -210 {lab=VDD}
C {sky130_fd_pr/nfet_01v8.sym} -20 -20 0 1 {name=M1
W=1
L=1
nf=1 
mult=10
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 100 -20 0 0 {name=M2
W=1
L=1
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 220 -180 0 1 {name=M3
W=2
L=1
body=VDD
nf=1
mult=10
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 320 -180 0 0 {name=M4
W=2
L=1
body=VDD
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {opin.sym} 420 -80 0 0 {name=p3 lab=IOUT}
C {ipin.sym} -230 60 0 0 {name=p1 lab=VSS}
C {ipin.sym} -230 -80 0 0 {name=p2 lab=IIN}
C {ipin.sym} -230 -290 0 0 {name=p4 lab=VDD}
