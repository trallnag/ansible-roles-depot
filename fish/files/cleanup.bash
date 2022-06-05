#!/usr/bin/env bash

help() {
    cat <<EOF
Cleanup stuff related to Ansible role "fish".

Options:
  -y, --yes, yes      Don't ask for confirmation.
  -h, --help, help    Print this help message.
EOF
}

case $1 in
  -h | --help | help) help && return ;;
  -y | --yes | yes) autoconfirm=true ;;
esac

# ------------------------------------------------------------------------------
# Delete files and directories.

confirm=false

targets=(
  $HOME/.config/fish/
  $HOME/.local/share/fish/
)

if [[ $autoconfirm == true ]]; then
  confirm=true
else
  echo "Delete the following files and / or directories?"

  for target in "${targets[@]}"; do
    echo "$target"
  done

  read answer

  if [[ $answer == [yY] || $answer == [yY][eE][sS] ]]; then
    confirm=true
  fi
fi

if [[ $confirm == true ]]; then
  for target in "${targets[@]}"; do
    echo "Remove target: $target"
    rm -rf $target
  done
fi

# ------------------------------------------------------------------------------
# Kill instances of Fish.

confirm=false

if [[ $autoconfirm == true ]]; then
  confirm=true
else
  read -p "Kill all instances of Fish? " answer

  if [[ $answer == [yY] || $answer == [yY][eE][sS] ]]; then
    confirm=true
  fi
fi

if [[ $confirm == true ]]; then
  killall fish || true
fi
