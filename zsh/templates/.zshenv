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


# Ignore global Zsh run configuration.
# unsetopt global_rcs

skip_global_compinit=1


# ------------------------------------------------------------------------------


export ZSH_DYNRC="{{ zsh_dynrc }}"
export ZSH_MODULES="{{ zsh_modules }}"
export ZSH_COMPLETIONS="{{ zsh_completions }}"
export ZSH_FUNCTIONS="{{ zsh_functions }}"
export ZSH_SCRIPTS="{{ zsh_scripts }}"

export ZSH_ZSHENV_BOTTOM="{{ zsh_zshenv_bottom }}"

export ZSH_ZPROFILE_TOP="{{ zsh_zprofile_top }}"
export ZSH_ZPROFILE_MIDDLE="{{ zsh_zprofile_middle }}"
export ZSH_ZPROFILE_BOTTOM="{{ zsh_zprofile_bottom }}"

export ZSH_ZSHRC_TOP_INTERACTIVE="{{ zsh_zshrc_top_interactive }}"
export ZSH_ZSHRC_TOP_NON_INTERACTIVE="{{ zsh_zshrc_top_non_interactive }}"
export ZSH_ZSHRC_MIDDLE="{{ zsh_zshrc_middle }}"
export ZSH_ZSHRC_BOTTOM_BEFORE_COMP_INIT="{{ zsh_zshrc_bottom_before_comp_init }}"
export ZSH_ZSHRC_BOTTOM_AFTER_COMP_INIT="{{ zsh_zshrc_bottom_after_comp_init }}"

export ZSH_ZLOGIN_BOTTOM="{{ zsh_zlogin_bottom }}"

export ZSH_ZLOGOUT_BOTTOM="{{ zsh_zlogout_bottom }}"


# ------------------------------------------------------------------------------


source "$ZSH_ZSHENV_BOTTOM"


# ------------------------------------------------------------------------------
