#!/bin/bash

export DBUS_SESSION_BUS_ADDRESS="${DBUS_SESSION_BUS_ADDRESS:-unix:path=/run/user/${UID}/bus}"
notify-send "Ngồi thẳng lưng lên!!!"
