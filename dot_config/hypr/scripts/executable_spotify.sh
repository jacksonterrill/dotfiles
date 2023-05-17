#!/bin/sh
# if spotify is not running, start it
if ! pidof spotify && command -v spotify > /dev/null; then
  spotify &
fi

# wait for spotify to start
while ! playerctl --list-all | grep "spotify" > /dev/null; do
  sleep 1
done

# pass arguments to playerctl
playerctl "$*"
