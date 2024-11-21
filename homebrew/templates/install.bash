#!/usr/bin/bash

set -euo pipefail

homebrew_exe_dir="{{ homebrew_exe_dir }}"
ansible_become_pass="{{ ansible_become_pass }}"

# Check if the Homebrew exe dir does not exist.
if ! test -d "$homebrew_exe_dir"; then
  # Check if sudo can be run without a password.
  if ! sudo -n true 2> /dev/null; then
    # Provide the sudo password if needed.
    printf %s "$ansible_become_pass" | sudo -S whoami &> /dev/null
  fi

  # Verify sudo access again.
  if sudo -n true 2> /dev/null; then
    # Disable interactive mode.
    unset INTERACTIVE
    export NONINTERACTIVE=1

    # Run installation script.
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Indicate that the status has changed.
    echo status=changed
  else
    # Print an error message if sudo is not working.
    echo "Sudo not working."
    exit 1
  fi
fi
