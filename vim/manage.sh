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
    if command -v pacman > /dev/null && ! pacman -Qi vim > /dev/null 2>&1; then
      sudo pacman -S --noconfirm --needed vim
    fi
    rm -r -f "$HOME"/.vim
    dir=$(cd -- "$(dirname -- "$0")" || exit 1; echo "$PWD")
    ln -s -f "$dir"/vimrc "$HOME"/.vimrc
    ln -s -f "$dir"/vim "$HOME"/.vim
  ;;
  -r | --remove)
    rm -f "$HOME"/.vimrc
    rm -r -f "$HOME"/.vim
  ;;
  -h | --help)
    usage
  ;;
  *)
    usage
    exit 1
  ;;
esac
