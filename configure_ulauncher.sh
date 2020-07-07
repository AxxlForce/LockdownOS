#!/bin/bash

# ulauncher auto start
mkdir -p $HOME/.config/autostart
cp ./resources/launcher/ulauncher.desktop $HOME/.config/autostart

# configure ULauncher to show on <Alt>space and set it's theme to dark when we're at it
sed -i 's/\(\"hotkey-show-app\": \)\(.*\)/\1\"<Alt>space\",/' $HOME/.config/ulauncher/settings.json
sed -i 's/\(\"theme-name\": \)\(.*\)/\1\"light\"/' $HOME/.config/ulauncher/settings.json
