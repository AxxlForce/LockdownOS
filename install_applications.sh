#!/bin/bash

sudo apt-get update

# install rpi specific packages
sudo apt-get install -y libraspberrypi-bin libraspberrypi-dev libraspberrypi-bin-nonfree

# update & install packaged apps
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install -y ubuntu-mate-desktop vlc chromium-browser thunderbird gimp pinta ulauncher gnome-games adapta-gtk-theme paper-icon-theme

# remove "leftover" packages
sudo apt-get autoremove -y ubuntu-session gdm3 gnome-control-center fwupd

# install Visual Studio and refine launcher
wget https://packagecloud.io/headmelted/codebuilds/gpgkey
sudo apt-key add gpgkey
wget https://code.headmelted.com/installers/apt.sh
sudo sh apt.sh
sudo sed -i 's/\(Name=\)\(.*\)/\1Visual Studio Code/' /usr/share/applications/code-oss.desktop
sudo sed -i 's/\(Icon=\)\(.*\)/\1\/usr\/share\/icons\/Paper\/512x512\/apps\/visual-studio-code.png/' /usr/share/applications/code-oss.desktop
rm apt.sh && rm gpgkey

# install Reaper DAW and create launcher
wget https://www.reaper.fm/files/6.x/reaper612c_linux_armv7l.tar.xz -P $HOME/Downloads
tar -xvf $HOME/Downloads/reaper612c_linux_armv7l.tar.xz -C $HOME/Downloads
sudo mv $HOME/Downloads/reaper_linux_armv7l/REAPER/ /opt/reaper && rm -rf $HOME/Downloads/reaper_linux_armv7l
sudo cp ./resources/reaper.desktop /usr/share/applications/

# configure plank launcher
rm $HOME/.config/plank/dock1/launchers/*
mkdir -p $HOME/.config/plank/dock1/launchers
cp ./resources/dockitems/*.dockitem $HOME/.config/plank/dock1/launchers
