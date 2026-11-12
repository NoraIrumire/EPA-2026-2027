#!/bin/bash
# Usage: ./lab04_cpu_count.sh MIN_NUM_CORES
# Example: ./lab04_cpu_count.sh 4

# Common error: Validate input before performing numeric comparisons.
if [[ ! "$1" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: Provide a positive integer for MIN_NUM_CORES."
    # Common error: Terminate script if unrecoverable error found (like missing required input parameter).
    exit 1
fi

# Count available CPUs and compare against the required minimum.
num_cpu=$(nproc)

if [ "$num_cpu" -lt "$1" ]; then
    echo "Error: Only $num_cpu CPUs available; $1 required."
    exit 1
fi

# This solution does not use/need the else because of the use of the "exit 1" command. An alternative solution might use else.
echo "OK: $num_cpu CPUs available; $1 required."
