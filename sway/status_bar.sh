INTERNET_DEVICE="wlo1"

battery_emoji () {
  case $battery_status in
    "Charging")
      echo âĄ;;
    "Not charging")
      echo đ ;;
    "Discharging")
      echo đģ ;;
    *)
      echo don\'t know ;;
  esac
}

bluetooth_emoji () {
  if [ "$bluetooth_active" = "yes" ]
  then 
    echo đ 
  fi
}

delete_tmp_file () {
  if [ -f ~/.config/sway/bat_tmp ]; then
    rm ~/.config/sway/bat_tmp
  fi
}

battery_percentage_emoji () {
  bat_val=$(echo $battery_percentage | sed 's/%//' )
  if [ "$bat_val" -gt 35 ]; then
    delete_tmp_file        
    echo đ
  elif [ "$bat_val" -gt 15 ]; then
    delete_tmp_file        
    echo đĒĢ
  else
    if [ ! -f ~/.config/sway/bat_tmp ]; then
      notify-send "Your Battery is low (15%) please plug in your device now!"
      mpv ~/.config/sounds/low_battery.mp3
      touch ~/.config/sway/bat_tmp
    fi
    echo â 
  fi
}

# speaker_volume_emoji () {
#   if [ "$volume_integer" -gt 5 ] && [ "$volume_integer" -lt 50 ]
#   then
#     echo đ
#   elif [ "$volume_integer" -ge 50 ]
#   then
#     echo đ
#   elif [ "$volume_integer" -le 5 ]
#   then
#     echo đ
#   else
#     echo đ
#   fi
# }
#
# default_sink=$(pactl get-default-sink)
# volume_unformatted=$(pactl get-sink-volume $default_sink)
# volume_percentage=$(echo $volume_unformatted | awk '{print $5}' )
# volume_integer=$(echo $volume_percentage | sed 's/%//' )
# vol_emoji=$(speaker_volume_emoji)
### to display volume emoji and percentage ###
# $vol_emoji $volume_percentage 

# ram_usage=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
### to display ram emoji and value ###
# đ $ram_usage

# cpu_usage=$(cat /proc/loadavg | awk -F ' ' '{print $2}')
### to display cpu load avg ###
# đ§ $cpu_usage 


date_formatted=$(date "+%a %d %b %Y")
time=$(date "+%H:%M")
battery_status=$(cat /sys/class/power_supply/BAT0/status)
battery_percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{ print $2 }' )
battery_status_emoji=$(battery_emoji)
bat_perc_emoji=$(battery_percentage_emoji)

bluetoothctl_show=$(bluetoothctl show)
bluetooth_active=$(echo $bluetoothctl_show | awk '/Powered/ { print $11 }' )
bluetooth_img=$(bluetooth_emoji)

wifi_info=$(nmcli dev status | grep "^$INTERNET_DEVICE")
wifi_ssid=$(echo $wifi_info | awk '{ print $4 }' )
wifi_status=$(echo $wifi_info | awk '{ print $3 }' )

echo đ $wifi_status $bluetooth_img $battery_status_emoji $battery_percentage $bat_perc_emoji $date_formatted đī¸   $time đ 

