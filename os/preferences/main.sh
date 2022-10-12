#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
	 && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
print_in_yellow "\n   Start Setup Preferences\n\n"

execute "sudo apt-get update | sudo apt-get install -y curl git" \
				"APT Update"

./terminal.sh
./application.sh
