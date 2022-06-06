# ------------------------------------------------------------------------------
# Fileinfo


# This file '.zprofile' is similar to '.zlogin', except that it is sourced
# before '.zshrc'. '.zprofile' is meant as an alternative to '.zlogin' for
# ksh fans; the two are not intended to be used together, although this
# could certainly be done if desired.
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


source "{{ zsh_zprofile_top }}"


# ------------------------------------------------------------------------------
# Misc


# Fortune.
if [[ -o INTERACTIVE && -t 2 ]]; then
  fortune -a | cowsay | lolcat
fi >&2

# Editors.
export EDITOR=nano
export VISUAL=nano
export PAGER=less

# Language.
if [[ -z "$LANG" ]]; then
  export LANG=en_US.UTF-8
fi

# Point to system root certs.
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
export SSL_CERT_FILE=$REQUESTS_CA_BUNDLE


# ------------------------------------------------------------------------------
# Paths


# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

path=(
  /usr/local/{bin,sbin}
  ~/bin
  ~/.local/bin
  $path
)


# ------------------------------------------------------------------------------
# Less


# -F or --quit-if-one-screen
# -i or --ignore-case
# -M or --LONG-PROMPT
# -R or --RAW-CONTROL-CHARS
# -S or --chop-long-lines
# -W or --HILITE-UNREAD
# -z-4 or --window=-4
# -J or --status-column
# -x4 or --tabs=4
# -X or --no-init

export LESS="-F -i -M -R -S -W -z-4 -J -x4"

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi


# ------------------------------------------------------------------------------
# Termcap


export LESS_TERMCAP_mb=$'\e[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\e[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\e[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\e[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\e[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\e[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\e[01;32m'      # Begins underline.


# ------------------------------------------------------------------------------


source "{{ zsh_zprofile_middle }}"


# ------------------------------------------------------------------------------


source "{{ zsh_zprofile_bottom }}"


# ------------------------------------------------------------------------------
