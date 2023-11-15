#!/bin/bash

# Initialize variables with default values
PARAM1=""
PARAM2=""

# Usage function
usage() {
    echo "Usage: custom_command.sh -p <param1> -q <param2>"
    exit 1
}

# Parse options using getopts
while getopts ":p:q:" opt; do
    case $opt in
        p) PARAM1="$OPTARG";;
        q) PARAM2="$OPTARG";;
        \?) echo "Invalid option -$OPTARG" >&2; usage;;
    esac
done

# Check if required parameters are provided
# if [ -z "$PARAM1" ] || [ -z "$PARAM2" ]; then
#     echo "Both parameters are required."
#     usage
# fi

# Display the received parameters
echo "Parameter 1: $PARAM1"
echo "Parameter 2: $PARAM2"