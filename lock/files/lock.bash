#!/usr/bin/env bash

help() {
  cat << EOF
Open and close the lock.
EOF
}

case $1 in
  -h | --help | help) help && exit 0 ;;
  -o | --open | open) cmd=open ;;
  -c | --close | close) cmd=close ;;
  *) help && exit 1 ;;
esac

if [[ $cmd == open ]]; then
  ~/.config/gnupg/scripts/gpg-agent-trigger.bash
  ~/.config/ssh/scripts/ssh-agent-trigger.bash
fi

if [[ $cmd == close ]]; then
  killall gpg-agent &> /dev/null || true
  ssh-add -D &> /dev/null || true
fi
