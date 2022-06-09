#!/usr/bin/env bash

reload_bash_rc() {
  files_to_source=(
    "$HOME/.bash_profile"
  )

  for file in "${files_to_source[@]}"; do
    echo "Sourcing \"$file\"..."
    source "$file"
  done
}

delete_bash_rc() {
  files_to_delete=(
    "$BASH_BASHRC_TOP"
    "$BASH_BASHRC_MIDDLE"
    "$BASH_BASHRC_BOTTOM"

    "$BASH_PROFILE_TOP"
    "$BASH_PROFILE_MIDDLE"
    "$BASH_PROFILE_BOTTOM"

    "$HOME/.bashrc"
    "$HOME/.bash_profile"
  )

  for file in "${files_to_delete[@]}"; do
    echo "Deleting \"$file\"..."
    rm "$file"
  done
}

delete_sh_rc() {
  files_to_delete=(
    "$SH_PROFILE_TOP"
    "$SH_PROFILE_MIDDLE"
    "$SH_PROFILE_BOTTOM"

    "$HOME/.profile"
  )

  for file in "${files_to_delete[@]}"; do
    echo "Deleting \"$file\"..."
    rm "$file"
  done
}
