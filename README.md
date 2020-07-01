# Philosophy

TLDR full desktop experience (Ubuntu Mate 20.04) on the Raspberry Pi 4 for e.g. home office/lockdown

<p align="center">
	<img src="blob/rpi.jpg" alt="rpi4_product_shot" style="width:512px;" />
</p>

The Raspberry Pi (rpi) was thought of at Cambridge University for educational purpose in order to give everyone the opportunity to get access to a computer for a very small entry price (and energy consumption). It is developed by the charitable organization "Raspberry Pi Foundation" based in Cambridge, UK.

Wheres the first version was mainly intended for use without desktop environment ARM SoC based systems have grown such powerful that it is now quite possible to utilize the rpi as a full blown desktop PC.

LockdownOS aims to provide pupils, students (and everybody else really) with all necessary tools for their work for school, university, etc. During lockdown a lot of families realized that often times there are not enough computers available in the household so this enables them to have their very own PC with browser, word processing apps, programming tools, IDEs, graphics editor, DAW, calculations etc

LockdownOS is open source and based on the Linux distribution Ubuntu Mate with some minor tweaks to get it running smoothly on the rpi. Why Ubuntu? Ubuntu is very user friendly and tweaked for end user desktop systems and has nice package sources. Also "Mate" is key ingedrient to a favoured beverage within the hacker culture ("Hackerbrause") which is just fitting for such a project. We might have to change that in the future if redistributing it is not allowed (TODO check)

As the rpi is not built on an Intel CPU a lot of native programs won't run if they are not explicitly built for the armhf architecture. That has become less and less of a problem as most programs are or will be available as web apps or are written in Java or .NET which are platform independent to start with.

# Recommended Configuration

This projects uses an Raspberry Pi 4 Model B as hardware platform. It will run on an a rpi3 Model B but as we're aiming for a "joy of use" situation this is the recommend HW configuration:

**Raspberry Pi 4 Model B 4GB RAM** ca 55€

**64GB microSDXC UHS-I U3** (e.g. Samsung Evo Plus) ca 12€

**3A power supply** ca 8€

optional: **Aluminum (e.g. Armor Case) casing** ca 10€

For a total of round about of 85€ you can build a desktop PC

Please notice: RAM is critical, because desktop systems require a fair amount of RAM especially when running web apps and in combination with the SD card the system becomes very slow when it starts to swap RAM to the "hard drive".

# Preinstalled Image

<<Preconfigured Image for rpi4 4GB>>

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

# install via script and get a coffee... or two
cd LockdownOS
sh /script/install.sh

# add rpi specific PPA and install packages
sudo add-apt-repository ppa:ubuntu-raspi2/ppa # TODO hack: focal -> bionic
sudo apt-get update
sudo apt-get install libraspberrypi-bin libraspberrypi-dev libraspberrypi-bin-nonfree

# add other PPAs
sudo add-apt-repository -u ppa:snwh/ppa # TODO hack: focal -> bionic
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
gsettings set org.mate.background picture-filename Downloads/LockdownOS_wallpaper_2.jpg

# write rpi configuration TODO !! check model before we do that !!
cat >>/boot/firmware/usercfg.txt <<EOL

# hw accelerated graphics on rpi4
dtoverlay=vc4-fkms-v3d

# mild overclocking
over_voltage=2
arm_freq=1800
EOL
```





