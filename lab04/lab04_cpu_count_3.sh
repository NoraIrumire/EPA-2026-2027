#!/bin/bash
# Usage: ./lab04_cpu_count_3.sh MIN_NUM_CORES
# Example: ./lab04_cpu_count_3.sh 4

usage() {
    echo "Usage: $0 MIN_NUM_CORES"
}

# This version preserves Exercise 2's behaviour and builds the chosen commands on top of it.
if [ -z "$1" ]; then
    usage
    exit 1
fi

if [[ ! "$1" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: MIN_NUM_CORES must be a positive integer."
    exit 1
fi

num_cpu=$(nproc)

# New command 1: hostname identifies the machine being assessed,
# making CPU-check results traceable to a particular server.
server_name=$(hostname)

# New command 2: date records when the assessment was performed,
# making the diagnostic output more useful for auditing.
check_time=$(date "+%Y-%m-%d %H:%M:%S")

echo "Server: $server_name"
echo "Check time: $check_time"

if [ "$num_cpu" -lt "$1" ]; then
    echo "Error: Only $num_cpu CPUs available; $1 required."
    exit 1
fi

echo "OK: $num_cpu CPUs available; $1 required."

# Explanation of the chosen commands and how they improve the business logic.
echo ""
echo "About the commands used in this script:"
echo "1. hostname prints the name of the machine. It improves the script because the result is tied to a specific server, so you know which VM passed the check before installing software."
echo "2. date prints the current date and time. It improves the script because each result is timestamped, so you can tell when the check was done and keep an audit trail."
