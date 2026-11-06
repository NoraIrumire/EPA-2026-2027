#!/bin/bash
# Lab 03 - Exercise 1
# Usage: ./lab03_exercise1.sh <maximum_processes>
# Example: ./lab03_exercise1.sh 15

# Validate input: exactly one argument, and it must be a number.
if [[ $# -ne 1 || ! $1 =~ ^[0-9]+$ ]]; then
    # Send errors to stderr and stop execution.
    echo "Usage: $0 <maximum_processes>" >&2
    exit 1
fi

# Count running processes.
ct=$(ps -ef | wc -l)

# Compare the actual count against the supplied maximum.
if [ "$ct" -gt "$1" ]; then
    echo "Maximum number of processes exceeded"
else
    echo "The maximum number of processes NOT exceeded"
fi
