# ------------------------------------------------------------------------------


# This file '.zlogin' is sourced in login shells. It should contain commands
# that should be executed only in login shells. '.zlogin' is not the place for
# alias definitions, options, environment variable settings, etc.; as a
# general rule, it should not change the shell environment at all. Rather,
# it should be used to set the terminal type and run a series of external
# commands (fortune, msgs, etc).
#
# Previous 1 paragraph(s) from: https://zsh.sourceforge.io/Intro/intro_3.html

# Here is how Zsh loads its configuration files:
#   1) .zshenv
#   2) .zprofile if login
#   3) .zshrc if interactive
#   4) .zlogin if login
#   5) .zlogout

# Online man page: https://linux.die.net/man/1/zshoptions


# ------------------------------------------------------------------------------


{
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  # Compile the completion dump to increase startup speed.
  
  zcd=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump
  if [[ -s $zcd && (! -s ${zcd}.zwc || $zcd -nt ${zcd}.zwc) ]]; then
    zcompile $zcd
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  # Run general compile script every three hours.

  file=/tmp/compile-zsh-files--last-compilation--5fbef39c-59cf-4dbf-a054-2098c793484f
  logfile=/tmp/compile-zsh-files--compilation-log--5fbef39c-59cf-4dbf-a054-2098c793484f
  
  if [ ! -f $file ]; then
    printf 0 > $file
  fi
  
  now=$(date +%s)
  then=$(cat $file)
  
  if (( ( $now - $then ) > 10800 )); then
    QUIET=1 $ZSH_SCRIPTS/zcompile-stuff.zsh
    printf "$(date --iso-8601=seconds)\n" >> $logfile
  fi
  
  printf $(date +%s) > $file

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
} &!


# ------------------------------------------------------------------------------


source "$ZSH_ZLOGIN_BOTTOM"


# ------------------------------------------------------------------------------
