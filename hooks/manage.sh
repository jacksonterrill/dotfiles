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
    dir=$(cd -- "$(dirname -- "$0")" || exit 1; echo "$PWD")
    ln -s -f "$dir"/pre-commit "$dir"/../.git/hooks/pre-commit
  ;;
  -r | --remove)
    dir=$(cd -- "$(dirname -- "$0")" || exit 1; echo "$PWD")
    rm -f "$dir"/../.git/hooks/pre-commit
  ;;
  -h | --help | *)
    usage
  ;;
esac
