#!/bin/bash

LAST_PLAYER_FILE="$HOME/.last-player"

selected_player() {
  EXCLUDE_REGEX="JBL|bluez|a2dp|headset"

  for player in $(playerctl --list-all); do
    if [[ "$player" =~ $EXCLUDE_REGEX ]]; then
      continue
    fi
    status=$(playerctl --player="$player" status 2>/dev/null)
    if [[ "$status" == "Playing" ]]; then
      echo "$player"
      return
    fi
  done

  for player in $(playerctl --list-all); do
    if [[ "$player" =~ $EXCLUDE_REGEX ]]; then
      continue
    fi
    status=$(playerctl --player="$player" status 2>/dev/null)
    if [[ "$status" == "Paused" ]]; then
      echo "$player"
      return
    fi
  done

  return 1
}


PLAYER_NAME=$(selected_player)

if [ -z "$PLAYER_NAME" ]; then
  echo "No active player. Checking for last-used player..."
  if [ -f "$LAST_PLAYER_FILE" ]; then
    PLAYER_NAME=$(cat "$LAST_PLAYER_FILE")
  fi
else
  echo "Found active player: $PLAYER_NAME (saving)"
  echo "$PLAYER_NAME" > "$LAST_PLAYER_FILE"
fi

if [ -z "$PLAYER_NAME" ]; then
  echo "Error: No player found (neither active nor cached)."
  exit 1
fi

case "$1" in
  play)
    echo "Toggling play/pause for: $PLAYER_NAME"
    playerctl --player="$PLAYER_NAME" play-pause
    ;;
  next)
    echo "Skipping to next track for: $PLAYER_NAME"
    playerctl --player="$PLAYER_NAME" next
    ;;
  prev)
    echo "Skipping to previous track for: $PLAYER_NAME"
    playerctl --player="$PLAYER_NAME" previous
    ;;
  *)
    echo "Usage: $0 [play|next|prev]"
    exit 1
    ;;
esac
