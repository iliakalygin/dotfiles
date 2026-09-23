#!/bin/sh

set -eu

APPIMAGE="$HOME/.local/opt/cursor.AppImage"
TMP="$HOME/.local/opt/cursor.AppImage.tmp"

API="https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=stable"

echo "Checking for Cursor update..."

response=$(curl -fsSL "$API")

download_url=$(printf '%s\n' "$response" |
    sed -n 's/.*"downloadUrl":"\([^"]*\)".*/\1/p')

version=$(printf '%s\n' "$response" |
    sed -n 's/.*"version":"\([^"]*\)".*/\1/p')

if [ -z "$download_url" ]; then
    echo "Error: Could not extract Cursor download URL."
    exit 1
fi

echo "Latest Cursor version: $version"
echo "Downloading Cursor..."

rm -f "$TMP"

curl -fL --progress-bar "$download_url" -o "$TMP"

if [ ! -s "$TMP" ]; then
    echo "Error: Download failed."
    rm -f "$TMP"
    exit 1
fi

chmod +x "$TMP"

# Basic sanity check: AppImage should be an ELF executable.
if ! file "$TMP" | grep -q 'ELF'; then
    echo "Error: Downloaded file is not a valid AppImage."
    rm -f "$TMP"
    exit 1
fi

mv "$TMP" "$APPIMAGE"
chmod +x "$APPIMAGE"

echo "Cursor $version installed."
