#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "sudo apt-get update | sudo apt-get install -y cron" \
				"Install Cron"

execute "(crontab -l; echo '*/20 * * * * cd `pwd`/scripts && ./notify-drink-water.sh') | crontab -" \
				"Add CronJob Notify Drink Water"

execute "(crontab -l; echo '*/10 * * * * cd `pwd`/scripts && ./notify-sit-up-straight.sh') | crontab -" \
				"Add CronJob Notify Sit up Staight"

execute "sudo systemctl start cron" \
				"Enable Cron"
