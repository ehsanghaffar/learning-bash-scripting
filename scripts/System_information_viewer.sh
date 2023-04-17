#!/bin/bash

# Get the system informations
hostname=$(hostname)
os=$(cat /etc/os-release | grep PRETTY_NAME | cut -d'"' -f2)
kernel=$(uname -r)
cpu=$(grep 'model name' /proc/cpuinfo | head -1 | cut -d':' -f2 | tr -s ' ')
memory=$(free -h | awk '/^Mem/ {print $2}')
disk=$(df -h / | awk 'NR==2 {print $2}')

# If there are GPU informations available print them out
if command -v nvidia-smi &> /dev/null; then
    gpu=$(nvidia-smi --query-gpu=gpu_name --format=csv,noheader | head -1)
    echo "System Information for $hostname (with GPU):"
    echo "  Operating System: $os"
    echo "  Kernel Version: $kernel"
    echo "  CPU: $cpu"
    echo "  Memory: $memory"
    echo "  Disk Space: $disk"
    echo "  GPU: $gpu"
else
    echo "System Information for $hostname (without GPU):"
    echo "  Operating System: $os"
    echo "  Kernel Version: $kernel"
    echo "  CPU: $cpu"
    echo "  Memory: $memory"
    echo "  Disk Space: $disk"
fi
