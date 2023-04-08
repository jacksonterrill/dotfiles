#!/bin/sh

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
  for dir in */; do
    [ -e "$dir" ] || continue
    echo "${dir%/}"
  done | column
}

if [ "$#" -lt 1 ]; then
  usage
  exit 0
fi

option="$1"
shift

if [ "$#" -eq 0 ]; then
  configs="*/"
else
  configs="$*"
fi

case "$option" in
  -s | --sync | -r | --remove)
    for dir in $configs; do
      [ -e "$dir" ] || continue
      (cd "$dir" || exit 1; ./manage.sh "$option")
    done
  ;;
  -h | --help | *)
    usage
  ;;
esac
