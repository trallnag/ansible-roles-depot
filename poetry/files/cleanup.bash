#!/usr/bin/env bash

help() {
    cat <<EOF
Cleanup stuff related to Ansible role "poetry".

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
# Run installer with the uninstaller flag.

request="Run the Poetry uninstaller? [Y/n] "

if confirmed "$request"; then
  curl -sSL https://install.python-poetry.org | python - --uninstall --yes
fi

# ------------------------------------------------------------------------------
# Remove completion scripts.

targets=(
  $DOT_BASH_COMPLETIONS_DIR/poetry.bash-completion
  $DOT_ZSH_COMPLETIONS_DIR/_poetry
)

request="Remove completion scripts? [Y/n]"
for target in "${targets[@]}"; do request+="\n$target"; done
request+="\n"

if confirmed "$request"; then
  for target in "${targets[@]}"; do
    rm $target
  done
fi
