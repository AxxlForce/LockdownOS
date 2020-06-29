# Philosophy

The Raspberry Pi (rpi) was created for educational purpose in order to give everyone the opportunity to get access to a computer for a very small entry price. It is developed by the charitable organization "Raspberry Pi Foundation" based in the UK.

Wheres the original version was mainly intended for use without desktop environment ARM SoC based systems have grown such powerful that it is now quite possible to utilize the rpi as a full blown desktop PC.

LockdownOS aims to provide pupils, students (and everybody else really) to build their own PC for a very small price for their work for school, university, etc. During lockdown a lot of families realized that often times there are not enough computers available in the household so this enables them to have their own PC with browser, word processing programs, programming tools, IDEs. graphics editor, DAW, calculations etc

LockdownOS is based on Ubuntu Mate with some minor tweaks to get it running on the rpi. Why Ubuntu? Ubuntu is very user friendly and tweaked for end user desktop systems and has nice package sources. We might have to change that in the future if redistributing it is not allowed (TODO check)

As the rpi has no Intel based CPU a lot of native programs won't run if they are not explicitly build for the armhf architecture. That has become less and less of a problem as most programs are or will be available as web apps or are written in Java or .Net Core which are platform independent to start with.

# Recommend Configuration

This projects uses an Raspberry Pi 4 Model B as hardware platform. It will run on an a rpi3 Model B but as we're aiming for a "joy of use" situation this is the recommend HW configuration:

Raspberry Pi 4 Model B 4GB RAM (performance of the 2GB versio has not been tested yet) ca 55€

64GB microSDXC UHS-I U3 (e.g. Samsung Evo Plus) ca 12€

3A power supply ca 8€

Aluminum (e.g. Armor Case) casing ca 10€

For a total of round about of 85€ you can build a desktop PC

# Preinstalled Image

Preconfigured Image for rpi4 4GB:

# Script

The entire setup process can be run as a script similar to RetroPie

Get Raspberry Pi Imager from https://www.raspberrypi.org/downloads/

Populate your SD card with Ubuntu 20.04 LTS 32Bit (don't use 64bit, 4GB RAM systems don't benefit from it anyway)

Insert the SD card in your rpi and boot it up

Install LockdownOS via script

```shell
# install git
sudo apt-get install git

# clone this repository
git clone https://github.com/AxxlForce/LockdownOS.git

# install via scrip and get a coffee... or two
cd LockdownOS
sh /script/install.sh

# add rpi specific PPA and install packages
sudo add-apt-repository ppa:ubuntu-raspi2/ppa
sudo apt-get update
sudo apt-get install libraspberrypi-bin libraspberrypi-dev libraspberrypi-bin-nonfree

# add other PPAs
sudo add-apt-repository -u ppa:snwh/ppa
sudo add-apt-repository -u ppa:agornostal/ulauncher

# install MATE desktop environment
sudo apt-get install ubuntu-mate-desktop 

# remove "leftover" package(s)
sudo apt-get remove gnome-control-center

# install packaged apps
sudo apt-get install vlc chromium-browser thunderbird gimp pinta ulauncher adapta-gtk-theme paper-icon-theme

# install all non packaged stuff
# https://packagecloud.io/headmelted/codebuilds/gpgkey
. <( wget -O - https://code.headmelted.com/installers/apt.sh )

# other
# remove plank item in dock
gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ show-dock-item false

# enable natural scrolling
# Option "NaturalScrolling" "on"

# UI configuration
gsettings set org.mate.interface gtk-theme 'Adapta-Nokto-Eta'
gsettings set org.mate.interface icon-theme 'Paper'
gsettings set org.mate.interface enable-animations false
gsettings set org.mate.interface gtk-decoration-layout 'close,minimize,maximize:'

# write rpi configuration
cat >>/boot/firmware/usercfg.txt <<EOL

# hw accelerated graphics on rpi4
dtoverlay=vc4-fkms-v3d

# mild overclocking
over_voltage=2
arm_freq=1800
EOL



```

 

"Hack PPAs" in /etc/apt/sources.list.d -> focal zu bionic ändern







