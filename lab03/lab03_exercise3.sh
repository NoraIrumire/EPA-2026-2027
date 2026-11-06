#!/bin/bash
# Lab 03 - Exercise 3
# Usage: ./lab03_exercise3.sh <maximum_processes> <screen|file>
# Example: ./lab03_exercise3.sh 100 screen
# Example: ./lab03_exercise3.sh 100 file
# Original template-reused code removed to improve readability (same with most of the comments embedded in the previous sample solutions).

_LOGFILE="process_log.txt"

# Validate both the threshold and output mode.
# Common errors: Invalid inputs/modes are not handled.
if [[ $# -ne 2 || ! $1 =~ ^[0-9]+$ ]]; then
    echo "Usage: $0 <maximum_processes> <screen|file>" >&2
    exit 1
fi

if [[ "$2" != "screen" && "$2" != "file" ]]; then
    echo "Error: Output mode must be 'screen' or 'file'." >&2
    exit 1
fi

# Count running processes.
ct=$(ps -ef | wc -l)
#ct=$(( $(ps -ef | wc -l) - 1 ))    #(or alternative command)

# Determine the result before selecting the output destination.
# Common error: Using an uninitialised message variable.
if [ "$ct" -gt "$1" ]; then
    message="Maximum number of processes exceeded"
else
    message="The maximum number of processes NOT exceeded"
fi

# Send the result to the requested destination only.
# Common error: Ignoring the selected output mode.
if [ "$2" = "screen" ]; then
    echo "$message"
else
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "$timestamp - $message" >> "$_LOGFILE"
fi
