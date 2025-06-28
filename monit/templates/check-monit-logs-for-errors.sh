#!/usr/bin/sh

set -eu

handle_trap() {
  code=$?
  if [ "$code" -ne 0 ] && [ "$code" -ne 100 ]; then
    echo "[ERROR] Something went wrong." >&2
  fi
}

trap handle_trap EXIT

if journalctl -u "{{ monit__systemd_unit_name }}" \
  --since "5min 30s ago" --case-sensitive --grep ERROR 2>&1 > /dev/null;
then
  exit 100
fi
