#!/usr/bin/env bash

path="/home/king/.Notebook"
if [[ ! -d $path ]]; then
    notify-send "directory made"
    mkdir -p $path
fi
ops=$(echo -e "ADD\nEDIT\nREAD\nDELETE" | rofi -dmenu -i -p "Notebook")
case "$ops" in
    "ADD") addnote=$(rofi -dmenu -p "Enter file name") && nvim "$path/$addnote.txt"
        ;;
    "EDIT") editnote=$(ls $path | rofi -dmenu -i -p "select") && nvim "$path/$editnote"
        ;;
    "READ") readnote=$(ls $path | rofi -dmenu -i -p "select") && nvim "$path/$readnote"
        ;;
    "DELETE") delnote=$(ls $path | rofi -dmenu -i -p "select") && rm "$path/$delnote"
        ;;
esac
