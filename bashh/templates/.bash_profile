source $HOME/.profile


# ------------------------------------------------------------------------------


export BASH_BASHRC_TOP="{{ bash_bashrc_top }}"
export BASH_BASHRC_MIDDLE="{{ bash_bashrc_middle }}"
export BASH_BASHRC_BOTTOM="{{ bash_bashrc_bottom }}"

export BASH_PROFILE_TOP="{{ bash_profile_top }}"
export BASH_PROFILE_MIDDLE="{{ bash_profile_middle }}"
export BASH_PROFILE_BOTTOM="{{ bash_profile_bottom }}"

export BASH_COMPLETIONS="{{ bash_completions }}"
export BASH_FUNCTIONS="{{ bash_functions }}"


# ------------------------------------------------------------------------------


source $BASH_PROFILE_TOP
source $BASH_PROFILE_MIDDLE
source $BASH_PROFILE_BOTTOM


# ------------------------------------------------------------------------------


source $HOME/.bashrc
