#!/usr/bin/env bash

help() {
    cat <<EOF
Cleanup stuff related to Ansible role "zsh".

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
# Delete crontab entries.

targets=(
  zsh-18aea1da-85af-46e0-8b00-869fdfc45442
  zsh-e9bacf1d-72f2-4de2-967c-4c2f14cb3a35
)

request="Delete the following crontab entries?\n"
for target in "${targets[@]}"; do
  request+="\n$target"
done
request+="\n"

if confirmed "$request"; then
  for target in "${targets[@]}"; do
    crontab -l | awk "/$target/ { getline;  next } 1" | crontab -
  done
fi

# ------------------------------------------------------------------------------
# Delete cache related to p10k.

targets=(
  $HOME/.cache/gitstatus/
  $HOME/.cache/p10k*
  $HOME/.cache/p10k-trallnag/
)

request="Delete cache related to powerlevel10k?\n"
for target in "${targets[@]}"; do request+="\n$target"; done
request+="\n"

if confirmed "$request"; then
  for target in "${targets[@]}"; do rm -rf "$target"; done
fi

# ------------------------------------------------------------------------------
# Delete misc files and directories.

targets=(
  $HOME/.cache/zsh/.zshrc
  $HOME/.config/zsh/
  $HOME/.zcompdump
  $HOME/.zsh_history
  $HOME/.zshenv
  $HOME/.zshrc
)

request="Delete the following files and directories?"
request+="\n"
for target in "${targets[@]}"; do
  request+="\n$target"
done
request+="\n"

if confirmed "$request"; then
  for target in "${targets[@]}"; do
    rm -rf "$target"
  done
fi
