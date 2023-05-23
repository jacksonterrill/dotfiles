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
  $program_name (-d | --dir) <directory>  Start swww and randomly cycle wallpapers from the specified directory
USAGE
}

start_swww() {
  if command -v swww > /dev/null && ! swww query >/dev/null 2>/dev/null; then
    swww init
  fi
}

if [ "$#" -lt 1 ]; then
  start_swww
  exit 0
fi

case "$1" in
  -h | --help)
    usage
    exit 0
  ;;
  -d | --dir)
    shift
    if [ "$#" -ne 1 ] || ! [ -d "$1" ]; then
      error "Invalid arguments"
    fi
    start_swww
    wallpaper=""
    while true; do
      wallpaper=$(find "$1" -type f \( -name "*.jpeg" -o -name "*.jpg" -o -name "*.png" -o -name "*.gif" \) ! -wholename "$wallpaper" | shuf -n 1)
      swww img "$wallpaper" 
      sleep 500
    done
  ;;
  *)
    error "Invalid command"
  ;;
esac
