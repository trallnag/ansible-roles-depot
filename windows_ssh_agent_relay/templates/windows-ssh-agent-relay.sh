#!/usr/bin/sh

set -eu

# Create socket directory if it does not exist yet.
if ! [ -d "{{ windows_ssh_agent_relay_socket_path | dirname }}" ]; then
  echo "Creating socket directory..." >&2
  mkdir "{{ windows_ssh_agent_relay_socket_path | dirname }}"
  echo "Created socket directory." >&2
fi

# Remove socket if it already exists.
if [ -z "{{ windows_ssh_agent_relay_socket_path }}" ]; then
  echo "Removing socket..." >&2
  rm "{{ windows_ssh_agent_relay_socket_path }}"
  echo "Removed socket." >&2
fi

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

    export SSH_AUTH_SOCK="$link"

    echo "Forever checking if agent is doing fine..." >&2

    while :; do
      set +e
      ssh_add_output=$(ssh-add -l 2>&1)
      set -e

      if ! echo "$ssh_add_output" | grep -q "{{ ansible_user }}"; then
        echo "Unexpected response from agent." >&2
        printf '%s\n' "$ssh_add_output" >&2
        exit 1
      fi

      sleep 60
    done
EOF
