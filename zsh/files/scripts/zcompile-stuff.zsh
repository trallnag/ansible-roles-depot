#!/usr/bin/env zsh

# Logging utilities.
_log() { printf '%b[%s] %s%b\n' "$3" "$2" "$1" '\033[0m' >&2; }
logexit() { _log "$1" "ERROR" '\033[31m'; exit 1; }
logerror() { _log "$1" "ERROR" '\033[31m'; }
logwarning() { _log "$1" "WARNING" '\033[33m'; }
logsuccess() { _log "$1" "SUCCESS" '\033[32m'; }
loginfo() { _log "$1" "INFO" '\033[34m'; }
logdebug() { _log "$1" "DEBUG" '\033[36m'; }

# Function to compile if it's a file.
compile() {
  for file in $@; do
    if [ -f $file ]; then
      zcompile $file
      if [ "$QUIET" != 1 ]; then
        logsuccess "Compiled file: $file"
      fi
    else
      logwarning "No such file: $file"
    fi
  done
}

# ------------------------------------------------------------------------------

files=(
  $ZDOTDIR/.zshenv
  $ZDOTDIR/.zprofile
  $ZDOTDIR/.zshrc
  $ZDOTDIR/.zlogin
  $ZDOTDIR/.zlogout
)

compile $files

# ------------------------------------------------------------------------------

compile $ZDOTDIR/**/*.zsh
compile $HOME/.local/share/**/*.zsh
compile $HOME/.config/**/*.zsh
