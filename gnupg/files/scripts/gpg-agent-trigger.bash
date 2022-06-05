#!/usr/bin/env bash

usage() {
    cat <<EOF
Trigger the GnuPG agent if key / passphrase is not already cached.

Keygrip is hardcoded into the script.
EOF
}

case $1 in help | -h | -help | --help) usage && exit ;; esac

# ------------------------------------------------------------------------------

keygrip=AB71BEAEBFAEAC0B76F9C5D4E619CBF25F9A74F6

if ! gpg-connect-agent 'keyinfo --list' /bye | grep -q "$keygrip D - - 1 P"; then
  printf '\033[1;34mGnuPG:\033[0;34m Enter passphrase to unlock default \033[1;35mOpenPGP\033[0;34m secret key...\033[0m\n'

  if read -s pw; then
    if (( ${#pw} < 1 )); then
      pw=x
    fi

    # Passphrase is read from stdin. Phrase to sign is also read from stdin.
    # Pinentry mode loopback ensures that pinentry is not used in any case.
    if gpg --pinentry-mode=loopback --yes --sign --passphrase-fd 0 <<< "$pw" > /dev/null; then
      echo "Unlocked default OpenPGP secret key and added it to gpg-agent."
    fi
  fi
fi
