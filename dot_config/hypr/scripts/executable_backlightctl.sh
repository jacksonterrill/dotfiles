#!/bin/sh
error() {
  printf "Error: %s\n" "$1" 1>&2
  exit 1
}

usage() {
  program_name=$(basename "$0")
  cat <<USAGE
Usage:
  $program_name -h | --help               Show usage and available commands
  $program_name get                       Get the current brightness
  $program_name set <level>               Set the brightness to the specified level in range [0, 100]
  $program_name (raise | up) <amount>     Raise the brightness by the specified amount (Upper bound = 100)
  $program_name (lower | down) <amount>   Lower the brightness by the specified amount (Lower bound = 0)
USAGE
}

brillo_exp_smooth() {
  brillo -q -u 200000 "$@"
}

scale_level_for_user() {
  printf "%d\n" "$(("$(printf "%.0f\n" "$1")" * 2 - 100))"
}

get_brightness() {
  scale_level_for_user "$(brillo_exp_smooth)"
}

scale_delta_for_brillo() {
  printf "%d\n" "$(("$(printf "%.0f\n" "$1")" / 2))"
}

scale_level_for_brillo() {
  printf "%d\n" "$(("$(scale_delta_for_brillo "$1")" + 50))"
}

set_brightness() {
  brillo_exp_smooth -S "$(scale_level_for_brillo "$1")"
}

raise_brightness() {
  brillo_exp_smooth -A "$(scale_delta_for_brillo "$1")"
}

lower_brightness() {
  brillo_exp_smooth -U "$(scale_delta_for_brillo "$1")"
}

if [ "$#" -lt 1 ]; then
  usage
  exit 1
fi

# Set minimum brightness level
brillo -qc -S 50 2>/dev/null

case "$1" in
  -h | --help)
    usage
    exit 0
  ;;
  get)
    shift
    if [ "$#" -ne 0 ]; then
      error "Invalid arguments"
    fi
    get_brightness
  ;;
  set)
    shift
    if [ "$#" -ne 1 ]; then
      error "Invalid arguments"
    fi
    set_brightness "$1"
  ;;
  raise | up)
    shift
    if [ "$#" -ne 1 ]; then
      error "Invalid arguments"
    fi
    raise_brightness "$1"
  ;;
  lower | down)
    shift
    if [ "$#" -ne 1 ]; then
      error "Invalid arguments"
    fi
    lower_brightness "$1"
  ;;
  *)
    error "Invalid command"
  ;;
esac
