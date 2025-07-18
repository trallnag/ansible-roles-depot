#!/usr/bin/bash

set -euo pipefail

# Print help message if requested.
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
  cat <<EOF
Usage: $0 [OPTIONS]

Options:
  --id ID            Unique identifier for the notification.
  --subject SUBJECT  Subject of the notification.
  --message MSG      Message body of the notification.
  -h, --help         Show this help message and exit.
EOF
  exit 0
fi

# Part of unique identifier.
id=""

# Subject and message of the notification.
subject=""
message=""

# Parse command line options.
opts=$(getopt --options "" --longoptions id:,subject:,message: --name "$0" -- "$@")

# Evaluate the parsed options.
eval set -- "$opts"

# Map options to variables.
while true; do
  case "$1" in
    --id) shift ; id="$1" ;;
    --subject) shift ; subject="$1" ;;
    --message) shift ; message="$1" ;;
    --) shift ; break ;;
    *) echo "Unexpected option: $1" >&2 ; exit 1 ;;
  esac
  shift
done

# Construct PowerShell command.
command=\
'New-BurntToastNotification '\
'-AppId Trallnag.Toast '\
'-AppLogo "{{ windows_burnt_toast__icon_win_path }}" '\
'-UniqueIdentifier Trallnag.Toast.$Env:ID '\
'-Text $Env:SUBJECT, $Env:MESSAGE'

echo "Creating BurntToast notification... id='$id'" >&2

# Pass env vars to Windows and execute PowerShell command.
WSLENV=SUBJECT/w:MESSAGE/w ID="$id" SUBJECT="$subject" MESSAGE="$message" \
  "{{ windows_powershell__exe_path }}" \
  -NoLogo -NoProfile -NonInteractive -Command "$command"

echo "Created BurntToast notification... id='$id'" >&2
