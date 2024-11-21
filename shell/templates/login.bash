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

# XDG base directories.
export XDG_CACHE_HOME="{{ xdg_cache_home_dir }}"
export XDG_CONFIG_HOME="{{ xdg_config_home_dir }}"
export XDG_DATA_HOME="{{ xdg_data_home_dir }}"
export XDG_STATE_HOME="{{ xdg_state_home_dir }}"

# This.
export DOT_SHELL_BASH_LOGIN_FILE="{{ shell_bash_login_file }}"
export DOT_SHELL_FISH_LOGIN_FILE="{{ shell_fish_login_file }}"
export DOT_SHELL_ZSH_LOGIN_FILE="{{ shell_zsh_login_file }}"
