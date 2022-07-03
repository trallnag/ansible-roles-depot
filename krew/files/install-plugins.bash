#!/usr/bin/env bash

set -euo pipefail

source ~/.asdf/asdf.sh
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

installed_plugins="$(kubectl krew list)"

plugins=(
  access-matrix
  cert-manager
  deprecations
  explore
  fields
  fuzzy
  images
  ktop
  lineage
  neat
  resource-capacity
  score
  who-can
)

for plugin in "${plugins[@]}"; do
  if ! echo "$installed_plugins" | grep -q "^$plugin"; then
    kubectl krew install $plugin
    echo status=changed
  fi
done
