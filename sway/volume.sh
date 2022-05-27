#!/bin/bash

main () {
  command=$1
  change_volume
}

function volume_notification() {
  makoctl dismiss
  notify-send -u "critical" -t 2000 -h "int:value:$volume_integer" -a "Vol" "volume"
}

# function volume_bar() {
#   value=$((($volume_integer) / 5))
#   string=""
#   for i in {1..20}
#   do
#     if [ $i -le $value ] ; then
#       string+="█"
#     else
#       string+="_"
#     fi
#   done
#   echo [$string] $speaker_volume_emoji
# }

default_sink=$(pactl get-default-sink)
volume_unformatted=$(pactl get-sink-volume $default_sink)
volume_percentage=$(echo $volume_unformatted | awk '{print $5}' )
volume_integer=$(echo $volume_percentage | sed 's/%//' )

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

main "$@"
