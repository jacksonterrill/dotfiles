#!/bin/sh
error() {
  printf "ERROR: %s\n" "$1" 1>&2
  exit 1
}

usage() {
  program_name=$(basename "$0")
  cat <<USAGE
Usage:
  $program_name -h | --help
  $program_name (-d | --dir) <directory>   Execute swaylock with a random wallpaper from the specified directory
USAGE
}

if [ "$#" -lt 1 ]; then
  swaylock
  exit 0
fi

case "$1" in
  -h | --help)
    usage
    exit 0
  ;;
  -d | --dir)
    shift
    if [ "$#" -ne 1 ]; then
      error "Invalid arguments"
    fi
    wallpaper=$(find "$1" -type f \( -name "*.jpeg" -o -name "*.jpg" -o -name "*.png" -o -name "*.gif" \) | shuf -n 1)
    swaylock -f --image "$wallpaper"
  ;;
  *)
    error "Invalid command"
  ;;
esac
