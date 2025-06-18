# PATH.
set x /usr/local/sbin && contains $x $fish_user_paths && test -d $x && set -Ua fish_user_paths $x
set x /usr/local/bin && contains $x $fish_user_paths && test -d $x && set -Ua fish_user_paths $x
set x $HOME/bin && contains $x $fish_user_paths && test -d $x && set -Ua fish_user_paths $x
set x $HOME/.local/bin && contains $x $fish_user_paths && test -d $x && set -Ua fish_user_paths $x

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
set -gx LESS "-F -i -M -R -S -W -z-4 -J -x4"

# Language.
if ! set -q LANG
  set -gx LANG en_US.UTF-8
end

# Editors.
set -gx EDITOR nano
set -gx VISUAL nano
set -gx PAGER less

# XDG base directories.
set -gx XDG_CACHE_HOME "{{ xdg_cache_home_dir_path }}"
set -gx XDG_CONFIG_HOME "{{ xdg_config_home_dir_path }}"
set -gx XDG_DATA_HOME "{{ xdg_data_home_dir_path }}"
set -gx XDG_EXE_HOME "{{ xdg_exe_home_dir_path }}"
set -gx XDG_STATE_HOME "{{ xdg_state_home_dir_path }}"

# This.
set -gx DOT_SHELL_BASH_LOGIN_SCRIPT_PATH "{{ shell_bash_login_script_path }}"
set -gx DOT_SHELL_FISH_LOGIN_SCRIPT_PATH "{{ shell_fish_login_script_path }}"
set -gx DOT_SHELL_ZSH_LOGIN_SCRIPT_PATH "{{ shell_zsh_login_script_path }}"
