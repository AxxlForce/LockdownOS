#!/bin/bash

# write rpi configuration TODO !! check model before we do that !!
sudo cp ./resources/configfiles/usercfg.txt /boot/firmware

# set audio: 1 is 3.5mm, 2 is HDMI
#amixer cset numid=3 1
