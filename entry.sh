#!/usr/bin/env sh
if [ -f "/pre-script.sh" ]; then
  source /pre-script.sh
fi
trap "echo stop && killall crond && exit 0" SIGTERM SIGINT
crond -f -d 8
