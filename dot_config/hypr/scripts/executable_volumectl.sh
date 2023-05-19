#!/bin/sh
error() {
  echo "Error:" "$@" 1>&2
}

usage() {
  program_name=$(basename "$0")
  cat <<USAGE
Usage:
  $program_name -h | --help    Show usage and available commands
  $program_name get            Get the current volume
  $program_name set <level>    Set the volume to the specified level in range [0, 100]
  $program_name raise | up     Raise the volume by 5 (Upper bound = 100)
  $program_name lower | down   Lower the volume by 5 (Lower bound = 0)
  $program_name toggle-mute    Toggle mute
USAGE
}

get_volume() {
  pactl get-sink-volume @DEFAULT_SINK@ | grep Volume | awk '{print $5}' | tr % " "
}

set_volume() {
  if [ "$#" -ne 1 ]; then
    error "Invalid volume specification"
    exit 1
  elif [ "$1" -gt 100 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ 100%
  else
    pactl set-sink-volume @DEFAULT_SINK@ "$1%"
  fi
}

raise_volume() {
  if [ "$(get_volume)" -gt 95 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ 100%
  else
    pactl set-sink-volume @DEFAULT_SINK@ +5%
  fi
}

lower_volume() {
  pactl set-sink-volume @DEFAULT_SINK@ -5%
}

toggle_mute() {
  pactl set-sink-mute @DEFAULT_SINK@ toggle
}


if [ "$#" -lt 1 ]; then
  usage
  exit 1
fi

case "$1" in
  -h | --help)
    usage
    exit 0
  ;;
  get)
    get_volume
  ;;
  set)
    shift
    set_volume "$@"
  ;;
  raise | up)
    raise_volume
  ;;
  lower | down)
    lower_volume
  ;;
  toggle-mute)
    toggle_mute
  ;;
  *)
    error "Invalid command"
    exit 1
  ;;
esac
