#!/bin/bash

# File to store last press timestamp
VOLUME_FILE="/tmp/volume_last_press"
DEFAULT_STEP=1  # Start with 1%
MAX_STEP=10     # Maximum step (when pressing fast)
DECAY_TIME=300  # Decay time in milliseconds (500ms = 0.5s)

# Get the current time in milliseconds
CURRENT_TIME=$(date +%s%3N)

# Read the last recorded time
if [ -f "$VOLUME_FILE" ]; then
    LAST_TIME=$(cat "$VOLUME_FILE")
else
    LAST_TIME=0
fi

# Calculate the time difference
TIME_DIFF=$((CURRENT_TIME - LAST_TIME))

# Determine volume step (scales smoothly)
if [ "$TIME_DIFF" -lt "$DECAY_TIME" ]; then
    STEP=$((DEFAULT_STEP + (MAX_STEP - DEFAULT_STEP) * (DECAY_TIME - TIME_DIFF) / DECAY_TIME))
else
    STEP=$DEFAULT_STEP  # Reset to 1% for slow presses
fi

# Save the current timestamp for next press
echo "$CURRENT_TIME" > "$VOLUME_FILE"

# Apply volume change
pactl set-sink-volume @DEFAULT_SINK@ "$1$STEP%"
killall -SIGUSR1 i3status  # Refresh i3status

