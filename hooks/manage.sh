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
    (ln -s -f "$PWD"/pre-commit "$PWD"/../.git/hooks/pre-commit)
  ;;
  -r | --remove)
    (rm -f "$PWD"/../.git/hooks/pre-commit)
  ;;
  -h | --help | *)
    usage
  ;;
esac
