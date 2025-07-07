#!/usr/bin/bash

set -euo pipefail

# Name of the systemd unit that has failed.
unit_name="$1"

# Ensure directory exists.
mkdir -p /tmp/systemd-onfailure-alert

# Hash of the systemd boot ID.
boot_id="$(cat /proc/sys/kernel/random/boot_id)"

# Toast lock file for rate limiting.
lock_file_toast="/tmp/systemd-onfailure-alert/toast-$unit_name-$boot_id.lock"

# If the toast lock file is older than specified, touch it and send toast.
if ! find "$lock_file_toast" -mmin -10 -print -quit 2>/dev/null | grep -q .; then
  touch "$lock_file_toast"

  echo "Sending notification... unit=\"$unit_name\"" >&2

  "{{ windows_burnt_toast__send_burnt_toast_exe_path }}" \
    --id "$(date +%s)" \
    --message "Systemd unit \"$unit_name\" is failing."

  echo "Finished sending notification. unit=\"$unit_name\"" >&2
else
  echo "Skipped sending notification due to rate limit. unit=\"$unit_name\"" >&2
fi

# Mail lock file for rate limiting.
lock_file_mail="/tmp/systemd-onfailure-alert/mail-$unit_name-$boot_id.lock"

# If the mail lock file is older than specified, touch it and send mail.
if ! find "$lock_file_mail" -mmin -30 -print -quit 2>/dev/null | grep -q .; then
  touch "$lock_file_mail"

  echo "Sending mail... unit=\"$unit_name\"" >&2

  mail_subject="Systemd unit \"$unit_name\" is failing."

  mail_body="Here are the 10 last lines in journald for the unit:

$(journalctl -u "$unit_name" -n 10)

This notification comes from the systemd unit template \"onfailure-alert@.service\"."

  printf '%s' "$mail_body" | mail -s "$mail_subject" default

  echo "Finished sending mail. unit=\"$unit_name\"" >&2
else
  echo "Skipped sending mail due to rate limit. unit=\"$unit_name\"" >&2
fi
