#!/usr/bin/env bash

set -euo pipefail

if [ ! -d ~/.krew ]; then
  source ~/.asdf/asdf.sh

  rm -rf /tmp/krew
  mkdir -p /tmp/krew
  cd /tmp/krew

  set +x

  OS="$(uname | tr '[:upper:]' '[:lower:]')"
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')"
  KREW="krew-${OS}_${ARCH}"
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz"
  tar zxvf "${KREW}.tar.gz"
  ./"${KREW}" install krew

  rm -rf /tmp/krew

  echo status=changed
fi
