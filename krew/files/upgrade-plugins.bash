#!/usr/bin/env bash

set -euo pipefail

source ~/.asdf/asdf.sh
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

kubectl krew update

if kubectl krew upgrade | grep -q upgraded; then
  echo status=changed
fi
