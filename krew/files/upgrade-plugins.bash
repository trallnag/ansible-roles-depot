#!/usr/bin/env bash

set -euo pipefail

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
PATH="$PATH:$HOME/.krew/bin"

if kubectl krew upgrade | grep -q upgraded; then
  echo status=changed
fi
