#!/bin/bash

# Get id of an active window
active_pid=$(hyprctl activewindow | grep -o 'pid: [0-9]*' | cut -d' ' -f2)

# Check if an active window is found
if [ -n "$active_pid" ]; then
    # Close active window
    kill $active_pid
else
    echo "No active window found."
fi