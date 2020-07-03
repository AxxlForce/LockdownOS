#!/bin/bash

# add PPAs (some need to be modified in order to work with 20.04)
sudo add-apt-repository -y ppa:ubuntu-raspi2/ppa
sudo sed -i 's/focal/bionic/g' /etc/apt/sources.list.d/ubuntu-raspi2-ubuntu-focal.list*
sudo add-apt-repository -y ppa:snwh/ppa
sudo sed -i 's/focal/bionic/g' /etc/apt/sources.list.d/snwh-ubuntu-ppa-focal.list*
sudo add-apt-repository -y ppa:agornostal/ulauncher

sudo sh ./install_packages.sh

sh ./configure_pi.sh

sh ./configure_ui.sh

sh ./configure_ulauncher.sh

sh ./configure_keyboard_shortcuts.sh

# TODO hack chromium DRM: 
# https://blog.vpetkov.net/2019/07/12/netflix-and-spotify-on-a-raspberry-pi-4-with-latest-default-chromium/