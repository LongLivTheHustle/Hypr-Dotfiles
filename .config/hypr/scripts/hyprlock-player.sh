#!/bin/sh

player_status=$(playerctl status 2> /dev/null)
icon="<span >󰎇</span>"
if [ "$player_status" = "Playing" ]; then
    echo "  $(playerctl status) - $(playerctl metadata title)"
elif [ "$player_status" = "Paused" ]; then
    echo "  $(playerctl status) - $(playerctl metadata title)"
else
    echo "${icon}  Nothing Playing yet."
fi