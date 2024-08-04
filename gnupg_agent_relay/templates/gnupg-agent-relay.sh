#!/bin/sh

set -e

"{{ gnupg_agent_relay_win_ssh_exe }}" \
  -o ServerAliveInterval=60 \
  -R /run/user/{{ ansible_facts.user_uid }}/gnupg/S.gpg-agent:127.0.0.1:54321 \
  {{ ansible_user }}@localhost sh -s <<- 'EOF'
  set -e
  echo "Connection to localhost opened."
  gpg-connect-agent 'keyinfo --list' /bye
  echo "Time to sleep forever..."
  sleep infinity
EOF
