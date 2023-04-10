#!/bin/sh

dir=$(cd -- "$(dirname -- "$0")" && pwd -P)

usage() {
  cat <<USAGE
Usage: $0 OPTION [CONFIGS...]
  If no configs are specified, the selected option will be applied to all configs
Options:
  -s, --sync:     Sync system configs with dotfiles repository
  -r, --remove:   Remove links to dotfiles
  -h, --help:     Display usage and available options
Configs:
USAGE
  for config in "$dir"/*/; do
    [ -e "$config" ] || continue
    basename "$config"
  done | column
}

if [ "$#" -lt 1 ]; then
  usage
  exit 0
fi

option="$1"
shift

if [ "$#" -eq 0 ]; then
  configs="$dir/*/"
else
  configs="$*"
fi

case "$option" in
  -s | --sync | -r | --remove)
    for config in $configs; do
      [ -e "$config" ] || continue
      (cd "$config" || exit 1; ./manage.sh "$option")
    done
  ;;
  -h | --help | *)
    usage
  ;;
esac
