#!/usr/bin/sh

set -eu

handle_trap() {
  code=$?
  if [ "$code" -ne 0 ]; then
    echo "[ERROR] Something went wrong." >&2
  fi
}

trap handle_trap EXIT

UNIT_NAME="$1"

"{{ windows_burnt_toast__send_burnt_toast_exe_path }}" \
  --id "monit.$(echo "$UNIT_NAME" | tr . -).$(date +%s)" \
  --message "Monit: Systemd unit \"$UNIT_NAME\" is failing."
