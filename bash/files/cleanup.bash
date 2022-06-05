#!/usr/bin/env bash

help() {
    cat <<EOF
Cleanup stuff related to Ansible role "bash".

Options:
  -y, --yes, yes      Don't ask for confirmation.
  -h, --help, help    Print this help message.
EOF
}

case $1 in
  -h | --help | help) help && return ;;
  -y | --yes | yes) autoconfirm=true ;;
esac

confirmed() {
  local question="$1"

  if [[ $autoconfirm == true ]]; then
    confirm=true
  else
    printf "$question\n"
    read answer

    if [[ $answer == [yY] || $answer == [yY][eE][sS] ]]; then
      return 0
    else
      return 1
    fi
  fi
}

# ------------------------------------------------------------------------------
# Delete files and directories.

targets=(
  $HOME/.bash_logout
  $HOME/.bashrc
  $HOME/.config/bash
  $HOME/.profile
)

request="Delete the following files and directories?\n"
for target in "${targets[@]}"; do request+="\n$target"; done
request+="\n"

if confirmed "$request"; then
  for target in "${targets[@]}"; do rm -rf "$target"; done
fi

# ------------------------------------------------------------------------------
# Restore rc files from /etc/skel.

targets=(
  .bash_logout
  .bashrc
  .profile
)

request="Restore defaults from /etc/skel?\n"
for target in "${targets[@]}"; do request+="\n$target"; done
request+="\n"

if confirmed "$request"; then
  for target in "${targets[@]}"; do
    cp -f /etc/skel/$target $HOME/$target
    chmod 644 $HOME/$target
  done
fi
