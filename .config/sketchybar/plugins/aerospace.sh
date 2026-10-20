#!/usr/bin/env bash

focused=$(aerospace list-workspaces --focused)
occupied=$(aerospace list-workspaces --monitor all --empty no)

args=""
for sid in $(aerospace list-workspaces --all); do
  if echo "$focused" | grep -qx "$sid"; then
    args="$args --set space.$sid drawing=on background.color=0xffd35400"
  elif echo "$occupied" | grep -qx "$sid"; then
    args="$args --set space.$sid drawing=on background.color=0x33ffffff"
  else
    args="$args --set space.$sid drawing=off"
  fi
done

sketchybar $args   # one batched call instead of N
#
# if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
#     sketchybar --set $NAME background.drawing=on
# else
#     sketchybar --set $NAME background.drawing=off
# fi
