#!/bin/bash

# remove <Alt>space default key binidng
gsettings set org.mate.Marco.window-keybindings activate-window-menu disabled

# added <Alt><Super>space to show the home folder in the file explorer
gsettings set org.mate.SettingsDaemon.plugins.media-keys home '<Alt><Mod4>space'