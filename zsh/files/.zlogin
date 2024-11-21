#
# Sourced in login shells. It should contain commands that should be executed
# only in login shells. `.zlogout' is sourced when login shells exit.
# `.zprofile` is similar to `.zlogin`, except that it is sourced before
# `.zshrc`. `.zprofile` is meant as an alternative to `.zlogin` for ksh fans;
# the two are not intended to be used together, although this could certainly be
# done if desired. `.zlogin` is not the place for alias definitions, options,
# environment variable settings, etc.; as a general rule, it should not change
# the shell environment at all. Rather, it should be used to set the terminal
# type and run a series of external commands (fortune, msgs, etc).
#
# Here is how Zsh loads its configuration files:
#
# 1. `.zshenv`
# 2. `.zprofile` if login
# 3. `.zshrc` if interactive
# 4. `.zlogin` if login
# 5. `.zlogout`
#
# References:
#
# 1. https://linux.die.net/man/1/zshoptions
# 2. https://zsh.sourceforge.io/Intro/intro_3.html
#
# ------------------------------------------------------------------------------
#

{
  sleep 3

  nice -n 19 "$DOT_ZSH_SCRIPTS_DIR/zcompile-zcompdump.zsh" > /dev/null 2>&1

  sleep 1

  nice -n 19 "$DOT_ZSH_SCRIPTS_DIR/zcompile-stuff.zsh" > /dev/null 2>&1
} &!

#
# ------------------------------------------------------------------------------
#

source "$DOT_ZSH_ZLOGIN_FILE"
