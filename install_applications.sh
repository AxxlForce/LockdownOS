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

# install all non packaged stuff
wget https://packagecloud.io/headmelted/codebuilds/gpgkey
apt-key add gpgkey
wget https://code.headmelted.com/installers/apt.sh
sh apt.sh

# refine Visual Studio Code launcher
sed -i 's/\(Name=\)\(.*\)/\1Visual Studio Code/' /usr/share/applications/code-oss.desktop
sed -i 's/\(Icon=\)\(.*\)/\1\/usr\/share\/icons\/Paper\/512x512\/apps\/visual-studio-code.png/' /usr/share/applications/code-oss.desktop

# install Reaper DAW
wget https://www.reaper.fm/files/6.x/reaper612c_linux_armv7l.tar.xz -P ~/Downloads/ && cd ~/Downloads
tar -xvf reaper612c_linux_armv7l.tar.xz
sudo mv reaper_linux_armv7l/REAPER/ /opt/reaper && rm -rf reaper_linux_armv7l
