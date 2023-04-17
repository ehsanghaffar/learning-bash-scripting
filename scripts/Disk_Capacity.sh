#!/bin/bash

# Set threshold
threshold=90

# Get the disk usage statistics for the root file system
usage_stats=$(df -h / | awk 'NR==2 {print $5, $2}')

# Extract the usage percentage and total capacity
usage_pct=$(echo "$usage_stats" | cut -d' ' -f1 | cut -d'%' -f1)
total_capacity=$(echo "$usage_stats" | cut -d' ' -f2)

# Check if the usage exceeds the threshold
if [ "$usage_pct" -gt "$threshold" ]; then
    echo "Disk usage is above $threshold% of $total_capacity: $usage_stats"
else
    echo "Disk usage is below $threshold% of $total_capacity: $usage_stats"
fi
