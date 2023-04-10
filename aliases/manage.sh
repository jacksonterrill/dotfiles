#!/bin/sh

usage() {
  cat <<USAGE
Usage: $0 OPTION
Options:
  -s, --sync:     Sync system config with dotfiles repository
  -r, --remove:   Remove links to dotfiles
  -h, --help:     Display usage and available options
USAGE
}

if [ "$#" -ne 1 ]; then
  usage
  exit 0
fi

case "$1" in
  -s | --sync)
    ln -s -f "$PWD"/aliasrc "$HOME"/.aliasrc
    dir=$(cd "$(dirname "$0")" || exit 1; echo "$PWD")
    echo "alias dotfiles='$dir/../manage.sh'" > "$HOME"/.dotfiles-alias
  ;;
  -r | --remove)
    rm -f "$HOME"/.aliasrc
    rm -f "$HOME"/.dotfiles-alias
  ;;
  -h | --help | *)
    usage
  ;;
esac
