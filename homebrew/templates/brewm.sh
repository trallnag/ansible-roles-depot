#!/bin/sh

set -eu

if [ "$USER" = "brewmaster" ]; then
  brew "$@"
else
  sudo -i -u brewmaster brew "$@"
fi
