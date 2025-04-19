#!/usr/bin/env bash

[ ! -f "/proc/acpi/button/lid/LID0/state" ] && return 1

current_state=$(cat /proc/acpi/button/lid/LID0/state | awk '{ print $2 }')

if [ "$current_state" == "open" ]; then
  swaymsg "output * dpms on"
  swaymsg reload
else
  swaymsg "output * dpms off"
  playerctl pause
  swaylock -f -e -i $1
  systemctl hibernate
fi
