#!/usr/bin/env bash

help() {
  cat << EOF
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
    return 1
  else
    echo -e "$question"
    read -r answer

    if [[ $answer == [yY] || $answer == [yY][eE][sS] ]]; then
      return 0
    else
      return 1
    fi
  fi
}

rm_block() {
  bstart="# BEGIN :: ANSIBLE MANAGED BLOCK :: $1"
  bend="# END :: ANSIBLE MANAGED BLOCK :: $1"
  sed -i "/^$bstart$/,/^$bend$/d" "$2"
}

# ------------------------------------------------------------------------------
# Delete files and directories.

targets=(
  "$HOME/.cache/terraform-plugin-cache"
  "$HOME/.terraformrc"
)

request="Delete the following files and directories?\n"
for target in "${targets[@]}"; do request+="\n$target"; done
request+="\n"

if confirmed "$request"; then
  for target in "${targets[@]}"; do rm -rf "$target"; done
fi

# ------------------------------------------------------------------------------
# Remove shell integrations.

targets=(
  "$DOT_BASH_BASHRC"
  "$DOT_BASH_COMPLETION"
  "$DOT_ZSH_ZSHRC"
  "$DOT_ZSH_ZSHRC_COMPINIT_POST"
)

request="Remove integrations from the following files?\n"
for target in "${targets[@]}"; do request+="\n$target"; done
request+="\n"

if confirmed "$request"; then
  for target in "${targets[@]}"; do
    rm_block terraform "$target"
  done
fi

# ------------------------------------------------------------------------------
# Uninstall Homebrew packages.

targets=(
  terraform
  terragrunt
  tflint
  tfsec
)

request="Uninstall following Homebrew packages?\n"
for target in "${targets[@]}"; do request+="\n$target"; done
request+="\n"

if confirmed "$request"; then
  for target in "${targets[@]}"; do
    brew uninstall "$target"
  done
fi
