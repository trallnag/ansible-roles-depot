#!/usr/bin/zsh

# Wrapper for compiling files.
compile() {
  for file in $@; do
    if [[ -s $file && ( ! -s $file.zwc || $file -nt $file.zwc) ]]; then
      zcompile $file
    fi
  done
}

files=(
  $ZDOTDIR/.zshenv
  $ZDOTDIR/.zprofile
  $ZDOTDIR/.zshrc
  $ZDOTDIR/.zlogin
  $ZDOTDIR/.zlogout
)

compile $files

compile $HOME/.config/zsh/*.zsh
