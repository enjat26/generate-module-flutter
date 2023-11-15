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

NEW_TARGET_CONTROLLER="$DIR_GIT"/controllers/"$NAME"_controller.dart
NEW_TARGET_BINDING="$DIR_GIT"/bindings/"$NAME"_binding.dart
NEW_TARGET_VIEW="$DIR_GIT"/views/"$NAME"_view.dart

# Check if required parameters are provided
if [ -z "$DIR" ] || [ -z "$NAME" ]; then
    echo "Both parameters are required."
    usage
fi

rm -rf $DIR_GIT
git clone https://github.com/enjat26/"$DIR_GIT".git
mv "$DIR_GIT"/controllers/name_controller.dart $NEW_TARGET_CONTROLLER
mv "$DIR_GIT"/bindings/name_controller.dart $NEW_TARGET_BINDING
mv "$DIR_GIT"/views/name_controller.dart $NEW_TARGET_VIEW

UCNAME=$(echo "$NAME" | awk '{for(i=1;i<=NF;i++){$i=toupper(substr($i,1,1)) tolower(substr($i,2))}}1')

# echo $UCNAME
sed -i -e "s/Name/"$UCNAME"/gi" $NEW_TARGET_CONTROLLER
sed -i -e "s/Name/"$UCNAME"/gi" $NEW_TARGET_BINDING
sed -i -e "s/Name/"$UCNAME"/gi" $NEW_TARGET_VIEW

# mkdir -p $DIR

# Display the received parameters
echo "Parameter 1: $DIR"
echo "Parameter 2: $NAME"