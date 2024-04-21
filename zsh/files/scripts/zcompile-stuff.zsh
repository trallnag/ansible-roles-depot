#!/bin/zsh

# Logging utilities.
_log() { printf '%b[%s] %s%b\n' "$3" "$2" "$1" '\033[0m' >&2; }
logerror() { _log "$1" "ERROR" '\033[31m'; }
logwarning() { _log "$1" "WARNING" '\033[33m'; }
logsuccess() { _log "$1" "SUCCESS" '\033[32m'; }
loginfo() { _log "$1" "INFO" '\033[34m'; }
logdebug() { _log "$1" "DEBUG" '\033[36m'; }

# Wrapper for compiling files.
compile() {
  for file in $@; do
    if [[ -s $file && ( ! -s $file.zwc || $file -nt $file.zwc) ]]; then
      zcompile $file
      logsuccess "Compiled: $file"
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
