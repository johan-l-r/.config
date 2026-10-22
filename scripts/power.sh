#!/usr/bin/env bash

# these icons are not the same size
OPTIONS=" lock\n🔄 reboot\n poweroff"

CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -i -p "power menu")

case "$CHOICE" in 
	" lock") 
		hyprlock
		;;
	"🔄 reboot") 
		reboot
		;;
	"poweroff") 
		poweroff
		;;
	*)
		exit 0
		;;
esac
