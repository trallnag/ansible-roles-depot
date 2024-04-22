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

GPG_AGENT=~/.config/gnupg/scripts/gpg-agent-trigger.bash
#SSH_AGENT=~/.config/ssh/scripts/ssh-agent-trigger.bash

if [[ $cmd == open ]]; then
  [[ -f $GPG_AGENT ]] && $GPG_AGENT
#  [[ -f $SSH_AGENT]] && $SSH_AGENT
fi

if [[ $cmd == close ]]; then
  [[ -f $GPG_AGENT ]] && killall gpg-agent &> /dev/null || true
#  [[ -f $SSH_AGENT]] && ssh-add -D &> /dev/null || true
fi
