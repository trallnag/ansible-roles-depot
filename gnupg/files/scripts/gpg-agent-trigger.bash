#!/usr/bin/env bash

usage() {
  cat << EOF
Trigger the GnuPG agent if key / passphrase is not already cached.

Keygrip is hardcoded into the script.
EOF
}

case $1 in help | -h | -help | --help) usage && exit ;; esac

# ------------------------------------------------------------------------------

keygrip=AB71BEAEBFAEAC0B76F9C5D4E619CBF25F9A74F6

if ! gpg-connect-agent "keyinfo --list" /bye | grep -q "$keygrip D - - 1 P"; then
  rc=-1
  while [ $rc != 0 ]; do
    printf '\033[1;34mOpenPPG:\033[0;34m Enter passphrase to unlock default \033[1;35mPGP\033[0;34m secret key\033[35;5m...\033[0m\n'

    if read -s passphrase; then
      if ((${#passphrase} < 1)); then
        passphrase=x
      fi

      # Passphrase is read from stdin. Phrase to sign is also read from stdin.
      # Pinentry mode loopback ensures that pinentry is not used in any case.
      gpg --pinentry-mode=loopback --yes --sign --passphrase-fd 0 <<< "$passphrase" &> /dev/null
      rc=$?

      if [ $rc = 0 ]; then
        printf "Unlocked default PGP secret key and added it to gpg-agent.\n"
      fi
    fi
  done
fi
