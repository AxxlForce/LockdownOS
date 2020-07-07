#!/bin/bash

# startup x server
startx -- :2 vt1 &
sleep 20

# set basic MATE layout
DISPLAY=:2 mate-tweak --layout pantheon
sleep 10

# remove plank item in dock
gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ show-dock-item false

# copy our wallpaper
sudo cp ./resources/wallpapers/los_wallpaper_v3.jpg /usr/share/backgrounds/

# other UI configuration
gsettings set org.mate.interface gtk-theme 'Adapta-Nokto-Eta'
gsettings set org.mate.interface icon-theme 'Paper'
gsettings set org.mate.interface enable-animations false
gsettings set org.mate.interface gtk-decoration-layout 'close,minimize,maximize:'
gsettings set org.mate.Marco.general button-layout 'close,minimize,maximize:'
gsettings set org.mate.background picture-filename /usr/share/backgrounds/los_wallpaper_v3.jpg

# configure lightdm greeter 
sudo apt-get install -y lightdm
sudo cp ./resources/configfiles/slick-greeter.conf /etc/lightdm

# enable natural scrolling
# Option "NaturalScrolling" "on"
