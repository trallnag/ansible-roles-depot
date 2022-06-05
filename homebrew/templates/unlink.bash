#!/usr/bin/env bash

_log() { printf '%b[%s] %s%b\n' "$3" "$2" "$1" '\033[0m' >&2; }
loginfo() { _log "$1" "INFO" '\033[34m'; }

formulae="$(cat {{ homebrew_unliked }} | sed '/^$/d')"

doctor="$(brew doctor 2>&1 | sed --quiet '/brew link/,$p')"

for formula in $formulae; do
  if echo "$doctor" | grep -q $formula; then
    loginfo "Already unlinked: $formula"
  else
    loginfo "Unlinking $formula..."
    brew unlink $formula
  fi
done
