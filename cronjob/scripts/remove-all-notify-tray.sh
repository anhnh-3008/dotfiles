#!/bin/bash
gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval 'Main.panel.statusArea.dateMenu._messageList._notificationSection._list.remove_all_children()'
