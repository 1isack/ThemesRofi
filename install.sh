#!/usr/bin/env bash

set -e

DEST_DIR="$HOME/.config/rofi"
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "--- Select a theme number (1-13) ---"

for i in {1..13}; do
    printf "%2d) Theme %d\n" $i $i
done

read -p "Your choice: " choice

if [[ ! "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt 13 ]; then
    echo "Error: Please choose a number between 1 and 13."
    exit 1
fi

FILE_NAME="($choice)config.rasi"

if [ ! -d "$DEST_DIR" ]; then
    mkdir -p "$DEST_DIR"
fi

if [ -f "$DEST_DIR/config.rasi" ]; then
    rm "$DEST_DIR/config.rasi"
fi

if [ -f "$SOURCE_DIR/$FILE_NAME" ]; then
    cp "$SOURCE_DIR/$FILE_NAME" "$DEST_DIR/config.rasi"
    echo "Success! Theme $choice has been applied as config.rasi"
else
    echo "Error: File $FILE_NAME not found in the repository."
    exit 1
fi
