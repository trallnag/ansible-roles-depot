#!/usr/bin/sh

set -eu

if [ -f "{{ windows_gpg_agent_trigger__lock_path }}" ]; then
  rm -f "{{ windows_gpg_agent_trigger__lock_path }}"
  echo "Deleted agent sentinel lock file." >&2
fi

echo "Forever triggering GnuPG agent..." >&2

while :; do
  timeout 5s "{{ windows_gpg_agent_trigger__exe_path }}" /bye
  sleep 60
done
