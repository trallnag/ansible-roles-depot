#!/usr/bin/bash

set -euo pipefail

"{{ windows_ssh_agent_relay_ssh_exe }}" \
  -o ServerAliveInterval=60 \
  {{ ansible_user }}@localhost \
  -A \
  sh -s \
  <<- 'EOF'
    set -e

    echo "Connection opened."

    echo "Creating symlink..."
    
    target="$SSH_AUTH_SOCK"
    link="{{ windows_ssh_agent_relay_socket }}"
    ln -sf "$target" "$link"

    echo "Created symlink. target='$target' link='$link'"

    echo "Sleeping forever..."
    sleep infinity
EOF
