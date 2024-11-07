#!/usr/bin/bash

set -euo pipefail

if [[ -f "{{ windows_gnupg_agent_trigger_lock }}" ]]; then
  echo "Found agent sentinel lock file."
  rm -f "{{ windows_gnupg_agent_trigger_lock }}"
  echo "Deleted agent sentinel lock file."
fi

while true; do
  "{{ windows_gnupg_agent_trigger_exe }}" /bye
  echo "Triggered GnuPG agent. Time for sleeping..."
  sleep 60
done
