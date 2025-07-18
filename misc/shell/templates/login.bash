# PATH.
x="{{ base_dirs_fhs__opt_exe_dir_path }}" && [[ -d $x && :$PATH: != *:$x:* ]] && PATH="$x:$PATH"
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
export XDG_CACHE_HOME="{{ base_dirs_xdg__cache_dir_path }}"
export XDG_CONFIG_HOME="{{ base_dirs_xdg__config_dir_path }}"
export XDG_DATA_HOME="{{ base_dirs_xdg__data_dir_path }}"
export XDG_EXE_HOME="{{ base_dirs_xdg__exe_dir_path }}"
export XDG_STATE_HOME="{{ base_dirs_xdg__state_dir_path }}"

# This.
export DOT_SHELL_BASH_LOGIN_SCRIPT_PATH="{{ shell__bash_login_script_path }}"
export DOT_SHELL_FISH_LOGIN_SCRIPT_PATH="{{ shell__fish_login_script_path }}"
export DOT_SHELL_ZSH_LOGIN_SCRIPT_PATH="{{ shell__zsh_login_script_path }}"
