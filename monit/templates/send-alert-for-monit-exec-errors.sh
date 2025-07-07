#!/usr/bin/sh

set -eu

handle_trap() {
  code=$?
  if [ "$code" -ne 0 ]; then
    echo "[ERROR] Something went wrong." >&2
  fi
}

trap handle_trap EXIT

# shellcheck disable=SC2288
"{{ windows_burnt_toast__send_burnt_toast_exe_path }}" \
  --id "monit.$(date +%s)" \
  --message "Monit is encountering errors."
