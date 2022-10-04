#!/bin/bash

main () {
  command=$1
  change_volume
}

default_sink=$(pactl get-default-sink)

function change_volume() {
  case $command in 
    up)
      pactl set-sink-mute @DEFAULT_SINK@ 0
      pactl set-sink-volume @DEFAULT_SINK@ +5%
      volume_notification;;
    down)
      pactl set-sink-mute @DEFAULT_SINK@ 0
      pactl set-sink-volume @DEFAULT_SINK@ -5%
      volume_notification;;
    mute)
      pactl set-sink-mute @DEFAULT_SINK@ 1
      makoctl dismiss
      notify-send -u "critical" -t 2000 -h int:value:0 -a "Volume" "Volume";;
    *)
      notify-send "unknown volume.sh argument";;
  esac
}

function volume_notification() {
  volume_integer=$(pactl get-sink-volume $default_sink | awk '{print $5}' | sed 's/%//')
  makoctl dismiss
  notify-send -t 2000 -h "int:value:$volume_integer" -a "Vol" "Volume"
}

main "$@"
