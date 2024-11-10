#!/usr/bin/bash

set -euo pipefail

r_remote="/run/user/{{ ansible_facts.user_uid }}/gnupg/S.gpg-agent"
r_local="{{ windows_gpg_bridge_extra_host }}:{{ windows_gpg_bridge_extra_port }}"

echo "Connecting to target with SSH..."

exec "{{ windows_gpg_agent_relay_ssh_exe }}" \
  -o ServerAliveInterval=60 \
  -R "$r_remote:$r_local" \
  "{{ ansible_user }}@localhost" \
  sh -s \
  <<- 'EOF'
    set -e

    echo "Connected to target with SSH."

    echo "Pinging GPG agent..."

    gpg-connect-agent "keyinfo --list" /bye

    echo "Pinged GPG agent."

    echo "Sleeping forever..."
    sleep infinity
EOF
