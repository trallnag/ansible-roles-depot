#!/usr/bin/env bash

usage() {
  cat << EOF
Trigger the OpenSSH agent if default keyfile is not already cached.

Assumes that the default key is "~/.ssh/id_ed25519".
EOF
}

case $1 in help | -h | -help | --help) usage && exit ;; esac

# ------------------------------------------------------------------------------

ASKPASS="$HOME/.config/ssh/scripts/ssh-pass-passphrase.bash"
KEYFILE="$HOME/.ssh/id_ed25519"

if ! ssh-add -l | grep -q "$(ssh-keygen -l -f "$KEYFILE")"; then
  rc=-1
  while [ $rc != 0 ]; do
    printf '\033[1;34mOpenSSH:\033[0;34m Enter passphrase to unlock default \033[1;35mSSH\033[0;34m private key\033[35;5m...\033[0m\n'

    if read -s passphrase; then
      if ((${#passphrase} < 1)); then
        passphrase=x
      fi

      SSH_ASKPASS_REQUIRE=force SSH_ASKPASS="$ASKPASS" ssh-add "$KEYFILE" <<< "$passphrase"
      rc=$?

      if [ $rc = 0 ]; then
        printf "Unlocked default SSH private key and added it to ssh-agent.\n"
      fi
    fi
  done
fi
