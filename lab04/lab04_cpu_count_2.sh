#!/bin/bash
# Usage: ./lab04_cpu_count_2.sh MIN_NUM_CORES
# Example: ./lab04_cpu_count_2.sh 4

# Common error: Usage instructions must be encapsulated in a function.
#              (also, a function must be defined BEFORE using it).
usage() {
    echo "Usage: $0 MIN_NUM_CORES"
}

# Display usage instructions and exit when the argument is missing.
if [ -z "$1" ]; then
    usage
    # Common error: Terminate script if unrecoverable error found (like missing required input parameter).
    exit 1
fi

# Common error: Reject non-numeric and non-positive input.
#(multiple alternative solutions for this validation, like first making sure the value is numeric, then comparing it greater than zero).
if [[ ! "$1" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: MIN_NUM_CORES must be a positive integer."
    exit 1
fi

num_cpu=$(nproc)

if [ "$num_cpu" -lt "$1" ]; then
    echo "Error: Only $num_cpu CPUs available; $1 required."
    exit 1
fi

echo "OK: $num_cpu CPUs available; $1 required."
