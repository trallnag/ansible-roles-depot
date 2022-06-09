# ------------------------------------------------------------------------------


[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

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
