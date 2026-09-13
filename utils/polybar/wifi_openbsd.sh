#!/bin/sh

# Set your wireless interface name (e.g., iwn0, iwxf0, iwm0)
INTERFACE="iwx0"

# Check if the interface is associated and extract the SSID
SSID=$(ifconfig "$INTERFACE" 2>/dev/null | awk '/join/ {print $3}')

if [ -n "$SSID" ]; then
    echo "%{F#b4befe}󰤨%{F-} $SSID"
else
    echo "%{F#b4befe}󰤭%{F-} Disconnected"
fi
