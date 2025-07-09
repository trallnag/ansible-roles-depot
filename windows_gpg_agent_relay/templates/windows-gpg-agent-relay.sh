#!/usr/bin/sh

set -eu

r_remote="/run/user/{{ ansible_facts.user_uid }}/gnupg/S.gpg-agent"
r_local="{{ windows_gpg_bridge__extra_host }}:{{ windows_gpg_bridge__extra_port }}"

echo "Connecting to target with OpenSSH..." >&2

exec "{{ windows_gpg_agent_relay_ssh_exe_path }}" \
  -o ServerAliveInterval=60 \
  -R "$r_remote:$r_local" \
  "{{ ansible_user }}@localhost" \
  sh -s \
  <<- 'EOF'
    set -e

    echo "Connected to target with OpenSSH." >&2

    echo "Pinging GnuPG agent..." >&2

    gpg-connect-agent "keyinfo --list" /bye

    echo "Pinged GnuPG agent." >&2

    echo "Sleeping forever..." >&2
    sleep infinity
EOF
