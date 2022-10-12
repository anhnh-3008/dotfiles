#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")" \
	 && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
print_in_yellow "\n   Start Setup CronJob\n\n"

execute "chmod a+x `pwd`/*.sh | chmod a+x `pwd`/scripts/*.sh" \
				"Allow permission for all scripts"

./install_cron.sh
