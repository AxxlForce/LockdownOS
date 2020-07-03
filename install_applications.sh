#!/bin/bash

apt-get update

# install rpi specific packages
apt-get install -y libraspberrypi-bin libraspberrypi-dev libraspberrypi-bin-nonfree

# install MATE desktop environment quietly
apt install -y expect
cat <<EOF | expect
set timeout -1
spawn apt install -y ubuntu-mate-desktop
expect "Default display manager: "
send "lightdm\n"
expect eof
EOF

apt-get update
apt-get upgrade -y; apt-get dist-upgrade -y

# remove "leftover" packages
apt-get autoremove -y ubuntu-session fwupd gnome-control-center

# install packaged apps
apt-get install -y vlc chromium-browser thunderbird gimp pinta ulauncher gnome-games adapta-gtk-theme paper-icon-theme

# install Visual Studio and refine launcher
wget https://packagecloud.io/headmelted/codebuilds/gpgkey
apt-key add gpgkey
wget https://code.headmelted.com/installers/apt.sh
sh apt.sh
sed -i 's/\(Name=\)\(.*\)/\1Visual Studio Code/' /usr/share/applications/code-oss.desktop
sed -i 's/\(Icon=\)\(.*\)/\1\/usr\/share\/icons\/Paper\/512x512\/apps\/visual-studio-code.png/' /usr/share/applications/code-oss.desktop

# install Reaper DAW and create launcher
wget https://www.reaper.fm/files/6.x/reaper612c_linux_armv7l.tar.xz -P $HOME/Downloads
tar -xvf $HOME/Downloads/reaper612c_linux_armv7l.tar.xz -C $HOME/Downloads
sudo mv $HOME/Downloads/reaper_linux_armv7l/REAPER/ /opt/reaper && rm -rf $HOME/Downloads/reaper_linux_armv7l
sudo cp ./resources/reaper.desktop /usr/share/applications/

# configure plank launcher
rm $HOME/.config/plank/dock1/launchers/*
cp ./resources/*.dockitem $HOME/.config/plank/dock1/launchers
