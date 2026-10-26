#!/usr/bin/env bash

focustext=$(cat ~/focus.txt)

if [[ -n "$focustext" ]]; then
	sketchybar --set "$NAME" label="[ $focustext ]"
else
	sketchybar --set "$NAME" label=""
fi

