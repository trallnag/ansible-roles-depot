#!/usr/bin/bash

set -euo pipefail

if [[ -f "{{ windows_gpg_agent_trigger_lock }}" ]]; then
  rm -f "{{ windows_gpg_agent_trigger_lock }}"
  echo "Deleted agent sentinel lock file."
fi

while true; do
  "{{ windows_gpg_agent_trigger_exe }}" --verbose /bye
  sleep 60
done
