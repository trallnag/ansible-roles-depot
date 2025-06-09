#!/usr/bin/sh

set -eu

# Name of the systemd unit that has failed.
unit_name="$1"

# Hash of the systemd boot ID.
boot_id="$(cat /proc/sys/kernel/random/boot_id)"

# Lock file for rate limiting notifications.
lock_file="/tmp/handle-systemd-failure/$unit_name-$boot_id.lock"

# Ensure directory exists.
mkdir -p "$(dirname "$lock_file")"

# If the lock file is older than specified, touch it and send a notification.
if ! find "$lock_file" -mmin -10 -print -quit 2>/dev/null | grep -q .; then
  touch "$lock_file"

  echo "Sending notification... unit='$unit_name'" >&2

  "{{ windows_burnt_toast_send_script_path }}" \
    --id "$unit_name.$(date +%s)" \
    --subject "Systemd: $unit_name" \
    --message "Unit \"$unit_name\" has failed."

  echo "Finished sending notification. unit='$unit_name'" >&2
else
  echo "Skipped sending notification due to rate limit. unit='$unit_name'" >&2
fi
