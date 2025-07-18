#region early_exit
#
# If not running interactively, don't do anything.
#

case $- in
  *i*) ;;
  *) return ;;
esac

#endregion

#region source_dyn_top
source "$DOT_BASH_BASHRC_TOP_SCRIPT_PATH"
#endregion

#region shopt
#
# Enable various shell options that sound useful. Some might be enabled by
# default and therefore redundant. Not the only place where shopt is used!
# Reference: https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
#

# A command name that is the name of a directory is executed as if it were the
# argument to the cd command. This option is only used by interactive shells.
shopt -s autocd

# Minor errors in the spelling of a directory component in a cd command will be
# corrected. This option is only used by interactive shells.
shopt -s cdspell

# Checks that a command found in the hash table exists before trying to
# execute it. If a hashed command no longer exists, a normal path search is
# performed.
shopt -s checkhash

# Lists the status of any stopped and running jobs before exiting an
# interactive shell. If any jobs are running, this causes the exit to be
# deferred until a second exit is attempted without an intervening command
shopt -s checkjobs

# Attempts spelling correction on directory names during word completion if
# the directory name initially supplied does not exist.
shopt -s dirspell

# Includes filenames beginning with a '.' in the results of filename expansion.
shopt -s dotglob

# Extended pattern matching features enabled.
shopt -s extglob

# The pattern '**' used in a filename expansion context will match all files and
# zero or more directories and subdirectories. If the pattern is followed
# by a '/', only directories and subdirectories match.
shopt -s globstar

# Matches filenames in a case-insensitive fashion when performing expansion.
shopt -s nocaseglob

#endregion

#region history
#
# Configure history behavior. No idea where I got this from, but it works fine.
# Actually, some are taken from Sensible Bash.
# Reference: https://github.com/mrzool/bash-sensible
#

# Don't record some commands.
HISTIGNORE='&:[ ]*:exit:ls:bg:fg:history:clear:pwd'

# Avoid duplicate entries.
HISTCONTROL=erasedups:ignoreboth

# Use standard ISO 8601 timestamp.
HISTTIMEFORMAT="%F %T "

# Huge history size.
HISTSIZE=987654
HISTFILESIZE=987654

# Record each line as it gets issued.
PROMPT_COMMAND="history -a"

# Save multi-line commands as one command.
shopt -s cmdhist

# Append to the history file, don't overwrite it.
shopt -s histappend

# If Readline is being used, give opt to re-edit a failed history substitution.
shopt -s histreedit

# Enable incremental history search with up/down arrows.
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

# Enable history expansion with space.
# Typing !!<space> will replace the !! with the last command
bind Space:magic-space

#endregion

#region ubuntu
#
# Various configuration. More or less based on the default config in Ubuntu.
#

# Make less more friendly for non-text input files.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below).
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt (non-color, unless we know we "want" color).
case "$TERM" in
  xterm-color | *-256color) color_prompt=yes ;;
esac

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *) ;;
esac

# Enable programmable completion features.
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif   [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

#endregion

#region sensible
#
# Set up a few arcane improvements cherry picked from Sensible Bash.
# Reference: https://github.com/mrzool/bash-sensible
#

# Automatically trim long paths in the prompt.
PROMPT_DIRTRIM=2

# Perform file completion in a case insensitive fashion.
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent.
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press.
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories.
bind "set mark-symlinked-directories on"

#endregion

#region aliases
#
# Set up various aliases.
#

# Path, but readable for humans.
alias printpath='echo -e ${PATH//:/\\n}'

# Retry the last command with sudo.
alias pls='sudo $(history -p !!)'

# Remove, but interactive.
alias rmi='rm -i'

#endregion

#region source_dyn_aliases
source "$DOT_BASH_ALIASES_SCRIPT_PATH"
#endregion

#region source_dyn_default
source "$DOT_BASH_BASHRC_SCRIPT_PATH"
#endregion
