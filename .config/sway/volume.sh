#!/bin/bash

main () {
  command=$1
  change_volume
}

active_sink=$(pactl list sinks | grep -A 1 "State: RUNNING" | grep "Name:" | awk '{print $2}' | head -n 1)

function change_volume() {
  case $command in 
    up)
      if [[ $(pactl get-sink-volume $active_sink | awk '{print $5}' | sed 's/%//') -lt 110 ]]; then 
        pactl set-sink-mute $active_sink 0
        pactl set-sink-volume $active_sink +5%
      else
        mpv ~/.config/sounds/max_vol.mp3
      fi
      volume_notification;;
    down)
      pactl set-sink-mute $active_sink 0
      pactl set-sink-volume $active_sink -5%
      volume_notification;;
    mute)
      pactl set-sink-mute $active_sink 1
      makoctl dismiss
      notify-send -u "critical" -t 2000 -h int:value:0 -a "Volume" "Volume";;
    *)
      notify-send "unknown volume.sh argument";;
  esac
}

function volume_notification() {
  volume_integer=$(pactl get-sink-volume $active_sink | awk '{print $5}' | sed 's/%//')
  makoctl dismiss
  notify-send -t 2000 -h "int:value:$volume_integer" -a "Vol" "Volume"
}

main "$@"
