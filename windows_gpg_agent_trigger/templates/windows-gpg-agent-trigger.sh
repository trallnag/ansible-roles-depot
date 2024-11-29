#!/usr/bin/bash

set -euo pipefail

if [[ -f "{{ windows_gpg_agent_trigger_lock_path }}" ]]; then
  rm -f "{{ windows_gpg_agent_trigger_lock_path }}"
  echo "Deleted agent sentinel lock file."
fi

while true; do
  "{{ windows_gpg_agent_trigger_exe_path }}" --verbose /bye
  sleep 60
done
