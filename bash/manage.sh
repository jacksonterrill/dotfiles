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
    (ln -s -f "$PWD"/bashrc ~/.bashrc)
    (ln -s -f "$PWD"/bash_profile ~/.bash_profile)
  ;;
  -r | --remove)
    (rm -f ~/.bashrc)
    (rm -f ~/.bash_profile)
  ;;
  -h | --help | *)
    usage
  ;;
esac
