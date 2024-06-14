#!/bin/sh

# Path to BusyBox executable - adjust if necessary
BB="/bin/busybox"

# Find and delete the specified log files using BusyBox's find
$BB find /app/logs/prod -type f \( -name 'indexer.log*' -o -name 'error.log*' \) -delete

# Schedule this script to run again 10 minutes from now
# Using BusyBox's sleep and executing this script in the background
( $BB sleep 600 && /app/logs/prod/flush.sh ) &
