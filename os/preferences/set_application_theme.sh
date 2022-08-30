#!/bin/bash

set -e

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set desktop background
wget "https://www.dualmonitorbackgrounds.com/albums/popular-culture/rickandmortybyed3512.png" -O wallBackground.png
gsettings set org.gnome.desktop.background picture-uri "file:`pwd`/wallBackground.png"
gsettings set org.gnome.desktop.background picture-options "spanned"

gsettings set org.gnome.desktop.screensaver picture-uri "file:`pwd`/wallBackground.png"
gsettings set org.gnome.desktop.screensaver picture-options "spanned"
