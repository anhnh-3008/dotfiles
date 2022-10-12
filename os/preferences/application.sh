#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Application\n\n"

# Set font
execute "gsettings set org.gnome.desktop.interface monospace-font-name 'Noto Mono Bold 10'" \
    "Change font size"

# Set theme
execute "./set_application_theme.sh" \
			  "Set theme for application"
