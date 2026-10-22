#!/usr/bin/env bash

asn=$(lsappinfo find bundleID="$1")
if [ -z "$asn" ]; then
	sketchybar --set "$NAME" drawing=off
	exit 0;
fi

name=$(lsappinfo info -only Name "$asn" | awk -F'"' '{print $4}')
notif=$(lsappinfo info -only StatusLabel "$asn" | awk -F'"' '{print $6}')

if [ -z "$notif" ]; then
	sketchybar --set "$NAME" drawing=off
	exit 0;
fi

sketchybar --set "$NAME" drawing=on label="[ $name $notif ]"

