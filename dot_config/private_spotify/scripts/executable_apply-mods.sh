#!/bin/sh
error() {
  printf "Error: %s\n" "$1" 1>&2
  exit 1
}

if [ "$#" -ne 0 ]; then
  error "Invalid arguments"
fi

if ! command -v spotify > /dev/null; then
  error "Spotify not installed"
fi

if ! curl -fsSL https://raw.githubusercontent.com/SpotX-CLI/SpotX-Linux/main/install.sh | sh; then
  error "Could not install SpotX adblocker"
fi

if ! curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh; then
  error "Could not install Spicetify"
fi

spicetify backup apply

if ! curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh; then
  error "Could not install Spicetify Marketplace"
fi

spicetify config custom_apps lyrics-plus
spicetify apply

printf "Successfully applied Spotify mods\n"
exit 0
