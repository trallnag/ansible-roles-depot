#!/bin/sh

set -e

if [ -f "{{ gnupg_agent_trigger_lock }}" ]; then
  echo "Found agent sentinel lock file."
  rm -f "{{ gnupg_agent_trigger_lock }}"
  echo "Deleted agent sentinel lock file."
fi

while true; do
  "{{ gnupg_agent_trigger_win_exe }}" /bye
  sleep 60
done
