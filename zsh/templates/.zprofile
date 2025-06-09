#
# This file '.zprofile' is similar to '.zlogin', except that it is sourced
# before '.zshrc'. '.zprofile' is meant as an alternative to '.zlogin' for
# ksh fans; the two are not intended to be used together, although this
# could certainly be done if desired.
#
# Previous paragraph from: https://zsh.sourceforge.io/Intro/intro_3.html
#
# Here is how Zsh loads its configuration files:
#   1) .zshenv
#   2) .zprofile if login
#   3) .zshrc if interactive
#   4) .zlogin if login
#   5) .zlogout
#
# Online man page regarding Zsh options: https://linux.die.net/man/1/zshoptions
#

#region source_dyn_shell
source "{{ shell_zsh_login_script_path }}"
#endregion

#region misc

# Ensure arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#endregion

#region source_dyn_default
source "$DOT_ZSH_ZPROFILE_SCRIPT_PATH"
#endregion
