#!/bin/bash

set -e

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

# Setup Colloid-icon
declare tmpDir="$(mktemp --directory)"
git clone https://github.com/vinceliuice/Colloid-icon-theme.git "$tmpDir" 
cd "$tmpDir"
./install.sh -d $HOME/.icons -s dracula -t purple

# Clean up.
rm -rf "$tmpDir"

# Set icon
gsettings set org.gnome.desktop.interface icon-theme "Colloid-purple-dracula"
