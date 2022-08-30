#!/bin/bash

set -e

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Use external script to set the Dracula theme.
sudo apt-get install dconf-cli
rm -rf ~/.themes/gnome-teminal-dracular
git clone https://github.com/dracula/gnome-terminal.git ~/.themes/gnome-teminal-dracular

cd ~/.themes/gnome-teminal-dracular
dconf reset -f /org/gnome/terminal/legacy/profiles:/
