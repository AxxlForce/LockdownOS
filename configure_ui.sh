#!/bin/bash

# set basic MATE layout
DISPLAY=:0 mate-tweak --layout pantheon

# remove plank item in dock
gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ show-dock-item false

# copy our wallpaper
sudo cp ./resources/los_wallpaper_v3.jpg /usr/share/backgrounds/

# other UI configuration
gsettings set org.mate.interface gtk-theme 'Adapta-Nokto-Eta'
gsettings set org.mate.interface icon-theme 'Paper'
gsettings set org.mate.interface enable-animations false
gsettings set org.mate.interface gtk-decoration-layout 'close,minimize,maximize:'
gsettings set org.mate.Marco.general button-layout 'close,minimize,maximize:'
gsettings set org.mate.background picture-filename /usr/share/backgrounds/los_wallpaper_v3.jpg

# configure lightdm greeter
cat > sudo /etc/lightdm/slick-greeter.conf <<EOL
[Greeter]
draw-grid=true
theme-name=Adapta-Nokto-Eta
icon-theme-name=Paper
background=/usr/share/backgrounds/los_wallpaper_v3.jpg
EOL

# enable natural scrolling
# Option "NaturalScrolling" "on"