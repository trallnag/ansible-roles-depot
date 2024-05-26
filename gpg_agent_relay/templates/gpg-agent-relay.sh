#!/bin/sh

set -e

export PATH="{{ gpg_agent_relay_win_ssh_exe }}:$PATH"

ssh.exe -o ServerAliveInterval=60 -R /run/user/0/gnupg/S.gpg-agent:127.0.0.1:54321 root@localhost sh -s <<- 'EOF'
  set -e
  echo "Connection to localhost opened."
  gpg-connect-agent 'keyinfo --list' /bye
  echo "Time to sleep forever..."
  sleep infinity
EOF
