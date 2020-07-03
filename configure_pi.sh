#!/bin/bash

# write rpi configuration TODO !! check model before we do that !!
cat >> sudo /boot/firmware/usercfg.txt <<EOL

# hw accelerated graphics on rpi4
dtoverlay=vc4-fkms-v3d

# mild overclocking
over_voltage=2
arm_freq=1800
EOL

# set audio: 1 is 3.5mm, 2 is HDMI
#amixer cset numid=3 1