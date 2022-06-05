# ------------------------------------------------------------------------------
# Fileinfo

# This file '.zshenv' is sourced on all invocations of the shell, unless the
# -f option is set. It should contain commands to set the command search path,
# plus other important environment variables. '.zshenv' should not contain
# commands that produce output or assume the shell is attached to a tty.
#
# Previous 1 paragraph(s) from: https://zsh.sourceforge.io/Intro/intro_3.html

# Here is how Zsh loads its configuration files:
#   1) .zshenv
#   2) .zprofile if login
#   3) .zshrc if interactive
#   4) .zlogin if login
#   5) .zlogout

# Online man page regarding Zsh options: https://linux.die.net/man/1/zshoptions

# ------------------------------------------------------------------------------


# Specific to the global configuration provided by the Zsh installation on
# Ubuntu. Check /etc/z* files for more information on this.
skip_global_compinit=1


# ------------------------------------------------------------------------------
