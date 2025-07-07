#!/usr/bin/bash

set -euo pipefail

MINMON_CHECK_NAME="$1"
MINMON_ALARM_NAME="$2"

title="MinMon: Systemd recovered from a degraded state. \
There are no failed units."

toast_msg="$title check=$MINMON_CHECK_NAME alarm=$MINMON_ALARM_NAME"

# shellcheck disable=SC2288
"{{ windows_burnt_toast__send_burnt_toast_exe_path }}" \
  --id "$(date +%s)" --message "$toast_msg"

mail_body="This notification comes from \
the MinMon check \"$MINMON_CHECK_NAME\" and alarm \"$MINMON_ALARM_NAME\".

Created at $(date --iso-8601=seconds)."

printf '%s' "$mail_body" | mail -s "$title" default
