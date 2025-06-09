#!/usr/bin/sh

set -eu

if [ -f "{{ windows_gpg_agent_trigger_lock_path }}" ]; then
  rm -f "{{ windows_gpg_agent_trigger_lock_path }}"
  echo "Deleted agent sentinel lock file." >&2
fi

while true; do
  echo "Triggering GnuPG agent..." >&2
  timeout 5s "{{ windows_gpg_agent_trigger_exe_path }}" --verbose /bye
  echo "Triggered GnuPG agent." >&2
  sleep 60
done
