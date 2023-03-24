#!/bin/sh

usage() {
  cat <<USAGE
Usage: $0 OPTION
Options:
  -s, --sync:     Sync system configs with dotfiles repository
  -r, --remove:   Remove links to dotfiles
  -h, --help:     Display usage and available options
USAGE
}

if [ $# -ne 1 ]; then
  usage
  exit 0
fi

case $1 in
  -s | --sync)
    for dir in */; do
      [ -e "$dir" ] || break
      (cd "$dir" || exit; ./manage.sh -s)
    done
  ;;
  -r | --remove)
    for dir in */; do
      [ -e "$dir" ] || break
      (cd "$dir" || exit; ./manage.sh -r)
    done
  ;;
  -h | --help)
    usage
  ;;
  *)
    usage
  ;;
esac
