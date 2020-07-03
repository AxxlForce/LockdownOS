#!/bin/bash

# ulauncher auto start
mkdir -p $HOME/.config/autostart
cat > $HOME/.config/autostart/ulauncher.desktop <<EOL
[Desktop Entry]
Name=Ulauncher
Comment=Application launcher for Linux
Categories=GNOME;Utility;
Exec=env GDK_BACKEND=x11 /usr/bin/ulauncher --hide-window --hide-window            
Icon=ulauncher
Terminal=false
Type=Application
X-GNOME-Autostart-enabled=true
EOL

# configure ULauncher to show on <Alt>space and set it's theme to dark when we're at it
sed -i 's/\(\"hotkey-show-app\" : \)\(.*\)/\1\"<Alt>space\",/' $HOME/.config/ulauncher/settings.json
sed -i 's/\(\"theme-name\" : \)\(.*\)/\1\"light\"/' $HOME/.config/ulauncher/settings.json

# old sed commands
#sed -i '/hotkey-show-app/c\    \"hotkey-show-app\" : \"<Alt>space\",' ~/.config/ulauncher/settings.json
#sed -i '/theme-name/c\    \"theme-name\" : \"dark\",' ~/.config/ulauncher/settings.json