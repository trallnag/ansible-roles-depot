# PATH.
x=/usr/local/sbin && [[ -d $x && :$PATH: != *:$x:* ]] && PATH="$x:$PATH"
x=/usr/local/bin && [[ -d $x && :$PATH: != *:$x:* ]] && PATH="$x:$PATH"
x=$HOME/bin && [[ -d $x && :$PATH: != *:$x:* ]] && PATH="$x:$PATH"
x=$HOME/.local/bin && [[ -d $x && :$PATH: != *:$x:* ]] && PATH="$x:$PATH"

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

# Language.
if [[ ! $LANG ]]; then
  export LANG=en_US.UTF-8
fi

# Editors.
export EDITOR=nano
export VISUAL=nano
export PAGER=less

# This.
export DOT_SHELL_BASH_LOGIN="{{ shell_bash_login }}"
export DOT_SHELL_FISH_LOGIN="{{ shell_fish_login }}"
export DOT_SHELL_ZSH_LOGIN="{{ shell_zsh_login }}"
