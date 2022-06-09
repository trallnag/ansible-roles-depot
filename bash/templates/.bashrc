# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac


# ------------------------------------------------------------------------------
# History


HISTIGNORE='&:[ ]*:exit:ls:bg:fg:history:clear'
HISTCONTROL='erasedups:ignoreboth'
HISTTIMEFORMAT='%F %T '
HISTSIZE=256789
HISTFILESIZE=256789
shopt -s histappend

# Save multi-line commands as one command.
shopt -s cmdhist

# Enable incremental history search with up/down arrows.
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'


# ------------------------------------------------------------------------------


# Check the window size after each command and, if necessary, Update the
# values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below).
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt.
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
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
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Alias for directories.
alias md='mkdir -p'
alias rd=rmdir

# Path for humans.
alias path='echo -e ${PATH//:/\\n}'


# ------------------------------------------------------------------------------
# Grep


exc_folders="{.bzr,CVS,.git,.hg,.svn,.idea,.tox,node_modules}"
grep_options="--color=auto --exclude-dir=$exc_folders"

alias grep="grep $grep_options"
alias egrep="egrep $grep_options"
alias fgrep="fgrep $grep_options"


# ------------------------------------------------------------------------------
# Cherry pick from Bash Sensible
#
# https://github.com/mrzool/bash-sensible/blob/master/sensible.bash


# Enable history expansion with space.
# E.g. typing !!<space> will replace the !! with your last command.
bind Space:magic-space

# Turn on recursive globbing (enables ** to recurse all directories).
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion).
shopt -s nocaseglob

# Perform file completion in a case insensitive fashion.
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent.
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press.
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories.
bind "set mark-symlinked-directories on"

# Prepend cd to directory names automatically.
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion.
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd.
shopt -s cdspell 2> /dev/null


# ------------------------------------------------------------------------------


for file in $BASH_FUNCTIONS/*.bash; do
  source "$file"
done

source "$BASH_BASHRC_TOP"
source "$BASH_BASHRC_MIDDLE"
source "$BASH_BASHRC_BOTTOM"


# ------------------------------------------------------------------------------
