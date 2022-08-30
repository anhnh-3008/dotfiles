#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Terminal\n\n"

execute "gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark" \
    "Change gtk-theme"

execute "gsettings set org.gnome.desktop.background show-desktop-icons false" \
				"Ignore gnome draw desktop"

execute "./set_icon.sh" \
				"Set Icon Colloid"

execute "gsettings set org.gnome.desktop.wm.preferences theme Dracula" \
		"Change theme"

execute "./set_terminal_theme.sh" \
			  "Set custom terminal theme"

execute "./setup_zsh.sh" \
			 "Setup zsh, oh-my-zsh, zsh-autosuggestions and zsh-highlighting"
