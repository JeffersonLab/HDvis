#!/bin/tcsh -f

xterm -e 'ssh -L 5000:localhost:5000 gluon117 "cd /gluonfs1/home/hdops/HDvis/build/; hdvis ET:/tmp/ET_RAMDISK/et_sys_monitoring:MON_OCCUPANCY:gluon102:11122"' &

chromium-browser http://localhost:5000/event.html &
