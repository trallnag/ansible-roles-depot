#!/bin/sh

set -e

export PATH="{{ ssh_agent_relay_win_ssh_exe }}:$PATH"

ssh.exe -o ServerAliveInterval=60 root@localhost -A sh -s <<- 'EOF'
  set -e
  echo "Connection to localhost opened."
  echo "Creating symlink..."
  ln -sf "$SSH_AUTH_SOCK" {{ ssh_agent_relay_socket }}
  echo "Created symlink. target=$SSH_AUTH_SOCK link={{ ssh_agent_relay_socket }}"
  echo "Time to sleep forever..."
  sleep infinity
EOF
