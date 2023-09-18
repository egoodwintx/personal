#! /bin/sh
# pfconfswitch.sh
# author: Ed Goodwin
# date: 06.03.2023
# NOTE - this script is not working yet.

# description: 
# simple script that swaps in a pf.conf file for another
# and then switches it back after a short period of time.
# this is useful so that if you make a change to pf.conf
# that locks you out of the box, it will undo it automatically
#
# Usage: ./pf_config.sh new_config_file
#

init_string="pfctl -nvvf /etc/pf.conf" # command to execute
sleep_time=60

# pfctl -f /etc/pf.conf && sleep 60 && pfctl -d

#!/bin/sh

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root"
  exit 1
fi

# Check if the filename argument is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

# Store the original configuration file path
original_config="/etc/pf.conf"

# Store the new configuration file path
new_config="$1"

# Create a temporary filename for storing the original configuration
temp_config="${original_config}.bak"

# Stop the pf service
echo "Stopping pf service..."
pfctl -d

# Backup the original configuration file
echo "Backing up the original configuration file..."
cp "$original_config" "$temp_config"

# Replace the existing configuration file with the input file
echo "Replacing the configuration file..."
cp "$original_config" "$original_config.tmp"
cp "$new_config" "$original_config"

# Start the pf service
echo "Starting pf service..."
pfctl -e

# Sleep for 60 seconds
echo "Sleeping for $sleep_time seconds..."
sleep $sleep_time

# Stop the pf service again
echo "Stopping pf service..."
pfctl -d

# Rollback to the original configuration
echo "Rolling back to the original configuration..."
cp "$original_config" "$new_config"

# Start the pf service again
echo "Starting pf service..."
pfctl -e

# Completion method and exit
echo "Script completed successfully!"
exit 0

