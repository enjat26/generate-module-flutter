#!/bin/bash

# Initialize variables with default values
DIR=""
NAME=""

# Usage function
usage() {
    echo "Usage: custom_command.sh -dir <DIR> -name <NAME>"
    exit 1
}

# Parse options using getopts
while getopts ":dir:name:" opt; do
    case $opt in
        dir) DIR="$OPTARG";;
        name) NAME="$OPTARG";;
        \?) echo "Invalid option -$OPTARG" >&2; usage;;
    esac
done

# Check if required parameters are provided
# if [ -z "$DIR" ] || [ -z "$NAME" ]; then
#     echo "Both parameters are required."
#     usage
# fi

git clone https://github.com/enjat26/generate-module-flutter.git
mv generate-module-flutter/name_controller.dart generate-module-flutter/"$NAME"_controller.dart 
# Display the received parameters
echo "Parameter 1: $DIR"
echo "Parameter 2: $NAME"