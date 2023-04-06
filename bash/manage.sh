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
    if command -v pacman > /dev/null && ! pacman -Qi bash > /dev/null 2>&1; then
      sudo pacman -S --noconfirm --needed bash
    fi
    (ln -s -f "$PWD"/bashrc "$HOME"/.bashrc)
    (ln -s -f "$PWD"/bash_profile "$HOME"/.bash_profile)
  ;;
  -r | --remove)
    (rm -f "$HOME"/.bashrc)
    (rm -f "$HOME"/.bash_profile)
  ;;
  -h | --help | *)
    usage
  ;;
esac
