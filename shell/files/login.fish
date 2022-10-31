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

# This.
set -gx DOT_SHELL_LOGIN_BASH $HOME/.config/shell/login.bash
set -gx DOT_SHELL_LOGIN_FISH $HOME/.config/shell/login.fish
set -gx DOT_SHELL_LOGIN_ZSH $HOME/.config/shell/login.zsh
