#!/usr/bin/env bash

# Checking and installing dependencies
dependencies=("slurp" "grim" "convert" "swappy")
for dep in "${dependencies[@]}"; do
    command -v "$dep" &> /dev/null || { echo "$dep not found, please install it."; exit 1; }
done

# Capture screenshot
screenshot="$(slurp)"

# Process the screenshot and copy to clipboard
grim -g "$screenshot" - | convert - -shave 2x2 PNG:- | wl-copy

# Notify screenshot has copied to clipboard
notify-send -t 3000 -u low -a screenshot "Screenshot copied to clipboard"

# Paste to clipboard and use swappy for further processing
wl-paste | swappy -f -
