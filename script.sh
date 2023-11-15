#!/bin/bash

# Initialize variables with default values
DIR=""
DIR_GIT="generate-module-flutter"
NAME=""

# Usage function
usage() {
    echo "Usage: custom_command.sh -d <DIR> -n <NAME>"
    exit 1
}

# Parse options using getopts
while getopts ":d:n:" opt; do
    case $opt in
        d) DIR="$OPTARG";;
        n) NAME="$OPTARG";;
        \?) echo "Invalid option -$OPTARG" >&2; usage;;
    esac
done

# Check if required parameters are provided
if [ -z "$DIR" ] || [ -z "$NAME" ]; then
    echo "Both parameters are required."
    usage
fi

rm -rf $DIR_GIT
git clone https://github.com/enjat26/"$DIR_GIT".git
mv "$DIR_GIT"/controllers/name_controller.dart "$DIR_GIT"/controllers/"$NAME"_controller.dart
mkdir -p $DIR

# Display the received parameters
echo "Parameter 1: $DIR"
echo "Parameter 2: $NAME"