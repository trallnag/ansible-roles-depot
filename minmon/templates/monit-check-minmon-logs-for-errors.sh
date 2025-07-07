#!/usr/bin/sh

set -eu

handle_trap() {
  code=$?
  if [ "$code" -ne 0 ] && [ "$code" -ne 100 ]; then
    echo "[ERROR] Something went wrong." >&2
  fi
}

trap handle_trap EXIT

if ! journalctl -u "{{ minmon__systemd_unit_name }}" \
  --since "5min 30s ago" -p err 2>&1 | grep -q "No entries";
then
  exit 100
fi
