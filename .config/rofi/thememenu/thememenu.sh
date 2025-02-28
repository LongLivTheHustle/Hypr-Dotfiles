#!/bin/bash

# Get workspaces from hyprctl
workspaces=$(hyprctl workspaces -j | jq -r '.[] | "\(.id) - \(.name)"')

# Use Rofi to display workspaces and capture the selection
selected=$(echo -e "$workspaces" | rofi -dmenu -p "Workspaces")

# Extract the workspace ID from the selection
workspace_id=$(echo "$selected" | awk '{print $1}')

# Switch to the selected workspace
if [[ -n "$workspace_id" ]]; then
    hyprctl dispatch workspace "$workspace_id"
fi
