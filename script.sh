#!/bin/bash

# Initialize variables with default values
DIR_GIT="generate-module-flutter"
DIR=""
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

# Clone form git
rm -rf $DIR_GIT
git clone https://github.com/enjat26/"$DIR_GIT".git

# Rename file form git
mv "$DIR_GIT"/controllers/name_controller.dart $NEW_TARGET_CONTROLLER
mv "$DIR_GIT"/bindings/name_binding.dart $NEW_TARGET_BINDING
mv "$DIR_GIT"/views/name_screen.dart $NEW_TARGET_VIEW

# Change name to UcFirst
NEXT=1
UCNAME=""
for ((i=0; i<${#NAME}; i++)); do
    CHAR="${NAME:$i:1}"
    if [ "$CHAR" = "_" ]; then
        NEXT=1
        UCNAME+=""
    elif [ $NEXT -eq 1 ]; then
        UCNAME+=$(echo "$CHAR" | awk '{print toupper($0)}')
        NEXT=0
    else
        UCNAME+="$CHAR"
    fi
done


# Replace character
sed -i '' "s/name_/"$NAME"_/gI" $NEW_TARGET_CONTROLLER
sed -i '' "s/name_/"$NAME"_/gI" $NEW_TARGET_BINDING
sed -i '' "s/name_/"$NAME"_/gI" $NEW_TARGET_VIEW

sed -i '' "s/Name/"$UCNAME"/gI" $NEW_TARGET_CONTROLLER
sed -i '' "s/Name/"$UCNAME"/gI" $NEW_TARGET_BINDING
sed -i '' "s/Name/"$UCNAME"/gI" $NEW_TARGET_VIEW

# cp $DIR_GIT/*
rm "$DIR_GIT"/script.sh 
mkdir -p "$DIR" && cp -R $DIR_GIT/* $_

add_route=" \n GetPage(name: ' \/home ',page: () => "$UCNAME"Screen(),bindings: [ThemeBinding(), "$UCNAME"Binding()],),"

sed -i -e "s/add_route/&$add_route/ " 'lib/routers/route_pages.dart'

rm -rf $DIR_GIT
echo 'success generate module!'