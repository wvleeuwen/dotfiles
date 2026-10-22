#!/usr/bin/env bash

# Monitor plugged in or removed: rebuild the items from scratch
if [ "$SENDER" = "display_change" ]; then
  sketchybar --reload
  exit 0
fi

focused=$(aerospace list-monitors --focused --format '%{monitor-id}')

set --
for mid in $(aerospace list-monitors --format '%{monitor-id}'); do
  ws=$(aerospace list-workspaces --monitor "$mid" --visible)
  if [ "$mid" = "$focused" ]; then
    label="[ $ws ]"
  else
    label="$ws"
  fi
  set -- "$@" --set "ws.$mid" label="$label"
done

sketchybar "$@"
