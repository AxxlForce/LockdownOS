#!/bin/bash

# write rpi configuration TODO !! check model before we do that !!
cat > sudo /boot/firmware/usercfg.txt <<EOL
# Place "config.txt" changes (dtparam, dtoverlay, disable_overscan, etc.) in
# this file. Please refer to the README file for a description of the various
# configuration files on the boot partition.

# hw accelerated graphics on rpi4
dtoverlay=vc4-fkms-v3d

# mild overclocking
over_voltage=6
arm_freq=2000
EOL

# set audio: 1 is 3.5mm, 2 is HDMI
#amixer cset numid=3 1