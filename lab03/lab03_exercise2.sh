#!/bin/bash
# Lab 03 - Exercise 2
# Usage: ./lab03_exercise2.sh <maximum_processes>
# Example: ./lab03_exercise2.sh 100
# Original template-reused code removed to improve readability.

# As in many other programming languages, it is good practice to use uppercase for constants, but with a twist!: To avoid the risk of overwriting system environment variables (e.g., $PATH or $HOME), they should start with a unique prefix (commonly the character "_").
_LOGFILE="process_log.txt"

# Validate the supplied process threshold (first, if the number of expected parameters is right, then check if $1 is a number).
# Common error: Missing/non-numeric input is not validated.
if [[ $# -ne 1 || ! $1 =~ ^[0-9]+$ ]]; then
    # Always a good practice in Bash to send the errors to stderr (i.e., ">&2" instead of stdout).
    echo "Usage: $0 <maximum_processes>" >&2
    # Likewise, one should stop execution if critical errors found (like missing mandatory parameters!).
    exit 1
fi

# Count processes and obtain the current date/time.
ct=$(ps -ef | wc -l)
#ct=$(( $(ps -ef | wc -l) - 1 ))    #Alternative command, if you want to remove the ps header from the count and be more accurate.
#Requirements were ambiguous w.r.t. day/time precision, but normally a good practice to go all the way up to seconds (to help differentiate log lines).
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Determine the result using the correct comparison.
if [ "$ct" -gt "$1" ]; then
    message="Maximum number of processes exceeded"
else
    message="The maximum number of processes NOT exceeded"
fi

# Append a timestamped result, preserving previous entries.
# Common error: Using > instead of >> overwrites the log.
echo "$timestamp - $message" >> "$_LOGFILE"
