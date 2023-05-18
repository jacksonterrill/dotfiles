#!/bin/sh
error() {
  echo "Error:" "$@" 1>&2
}

spotify_running() {
  playerctl --list-all --no-messages | grep "spotify" > /dev/null
}

start_spotify() {
  # if spotify is not running, start it
  if ! spotify_running && command -v spotify > /dev/null; then
    spotify &
  fi
}

if [ "$#" -lt 1 ]; then
  usage
  exit 1
fi

# describes whether the specified command requires spotify to be running
must_be_running=false

# error for arguments that specify other players, start spotify if needed
for arg; do
  case "$arg" in
    -p | --player=* | -a | --all-players | -i | --ignore-player=* | -l | --list-all)
      error "spotifyctl is only designed to work with the Spotify media player"
      exit 1
    ;;
    play | play-pause | next | previous | position | volume | open | loop | shuffle)
      must_be_running=true
      start_spotify
    ;;
  esac
done

# wait for spotify to start
if $must_be_running; then
  while ! spotify_running; do
    sleep 1
  done
fi

# pass arguments to playerctl
playerctl --player=spotify "$@"
