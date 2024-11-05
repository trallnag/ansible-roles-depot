#
# Sourced on all invocations of the shell, unless the `-f` option is set. It
# should contain commands to set the command search path, plus other important
# environment variables. `.zshenv` should not contain commands that produce
# output or assume the shell is attached to a tty.
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

# Specific to the global configuration provided by the Zsh installation on
# Ubuntu. Check `/etc/z*` files for more information on this.
skip_global_compinit=1
