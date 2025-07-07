#!/usr/bin/bash

set -euo pipefail

MINMON_CHECK_NAME="$1"
MINMON_ALARM_NAME="$2"

failed_units=$(
  systemctl list-units --state=failed --output=json | jq -r '.[].unit'
)

toast_msg="MinMon: Systemd is in a degraded state. There are failed units \
($(printf '%s' "$failed_units" | paste -sd, -)). \
check=$MINMON_CHECK_NAME alarm=$MINMON_ALARM_NAME"

# shellcheck disable=SC2288
"{{ windows_burnt_toast__send_burnt_toast_exe_path }}" \
  --id "$(date +%s)" --message "$toast_msg"

mail_subject="MinMon: Systemd is in a degraded state. There are failed units."

mail_body="Here is a list of the failed units:

$failed_units

This notification comes from \
the MinMon check \"$MINMON_CHECK_NAME\" and alarm \"$MINMON_ALARM_NAME\".

Created at $(date --iso-8601=seconds)."

printf '%s' "$mail_body" | mail -s "$mail_subject" default
