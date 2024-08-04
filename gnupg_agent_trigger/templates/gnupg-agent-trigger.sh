#!/bin/sh

set -e

while true; do
  "{{ gnupg_agent_trigger_win_exe }}" /bye
  sleep 60
done
