#!/usr/bin/sh

set -eu

echo "Connecting to target with OpenSSH..." >&2

exec "{{ windows_ssh_agent_relay_ssh_exe_path }}" \
  -o ServerAliveInterval=60 \
  "{{ ansible_user }}@localhost" \
  -A \
  sh -s \
  <<- 'EOF'
    set -eu

    echo "Connected to target with OpenSSH." >&2

    echo "Creating symlink..." >&2

    target="$SSH_AUTH_SOCK"
    link="{{ windows_ssh_agent_relay_socket_path }}"
    ln -sf "$target" "$link"

    echo "Created symlink. target='$target' link='$link'" >&2

    echo "Sleeping forever..." >&2
    sleep infinity
EOF
