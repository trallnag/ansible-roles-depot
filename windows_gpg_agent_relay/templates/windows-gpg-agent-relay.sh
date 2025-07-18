#!/usr/bin/sh

set -eu

socket="/run/user/{{ ansible_facts.user_uid }}/gnupg/S.gpg-agent"

# Create socket directory if it does not exist yet.
if [ ! -d "$(dirname "$socket")" ]; then
  echo "Creating socket directory..." >&2
  mkdir -p "$(dirname "$socket")"
  echo "Created socket directory." >&2
fi

# Remove socket if it already exists.
if [ -f "$socket" ]; then
  echo "Removing socket..." >&2
  rm "$socket"
  echo "Removed socket." >&2
fi

bridge="{{ windows_gpg_bridge__extra_host }}:{{ windows_gpg_bridge__extra_port }}"

echo "Connecting to target with OpenSSH..." >&2

exec "{{ windows_gpg_agent_relay__ssh_exe_path }}" \
  -o ServerAliveInterval=60 \
  -R "$socket:$bridge" \
  "{{ ansible_user }}@localhost" \
  sh -s \
  <<- 'EOF'
    set -eu

    echo "Connected to target with OpenSSH." >&2

    echo "Forever checking if agent is doing fine..." >&2

    while :; do
      set +e
      cmd_result="$(gpg-connect-agent "keyinfo --list" /bye 2>&1)"
      set -e

      if ! echo "$cmd_result" | grep -F -q "restricted mode"; then
        echo "Unexpected response from agent." >&2
        printf '%s\n' "$cmd_result" >&2
        exit 1
      fi

      sleep 60
    done
EOF
