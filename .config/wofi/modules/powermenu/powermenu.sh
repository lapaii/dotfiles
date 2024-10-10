#!/usr/bin/env bash

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"

# Options
shutdown='󰐥'
reboot=''
lock='󰌾'
suspend='󰒲'
logoff='󰍃'

# Wofi CMD
wofi_cmd() {
    wofi --dmenu \
        --prompt "Uptime: $uptime" \
        --location center \
        -s ~/.config/wofi/modules/powermenu/style.css \
        -c ~/.config/wofi/modules/powermenu/config
}

# Pass variables to wofi dmenu
run_wofi() {
	echo -e "$shutdown\n$reboot\n$lock\n$logoff\n$suspend" | wofi_cmd
}

# Execute Command
run_cmd() {
	if [[ $1 == '--shutdown' ]]; then
		systemctl poweroff
	elif [[ $1 == '--reboot' ]]; then
		systemctl reboot
	elif [[ $1 == '--lock' ]]; then
		swaylock
	elif [[ $1 == '--logout' ]]; then
		sway exit
	elif [[ $1 == '--suspend' ]]; then
		systemctl suspend
	fi
}

# Actions
chosen="$(run_wofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
		run_cmd --lock	
        ;;
    $logoff)
		run_cmd --logout
        ;;
    $suspend)
	    	run_cmd --suspend
	;;
esac
