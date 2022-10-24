#!/bin/sh

if ! command -v inotifywait > /dev/null; then
  echo "inotifywait not installed." && exit 1
fi

if ! command -v rsync > /dev/null; then
  echo "rsync not installed." && exit 1
fi

if ! [ -d $HOME/.aws ]; then
  echo "Directory not found: \$HOME/.aws" && exit 1
fi

if ! [ -d "{{ win_home }}/.aws" ]; then
  echo "Directory not found: {{ win_home }}/.aws" && exit 1
fi

while inotifywait -q -q -e modify,move,create,delete $HOME/.aws; do
  if [ -d $HOME/.aws ] && [ -d "{{ win_home }}/.aws" ]; then
    rsync --ignore-missing-args -qavu $HOME/.aws/ "{{ win_home }}/.aws"
  fi
done
