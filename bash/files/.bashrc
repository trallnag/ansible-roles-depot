# ------------------------------------------------------------------------------


# If not running interactively, don't do anything.
case $- in
  *i*) ;;
  *) return ;;
esac

# Set a few options.
# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s autocd
shopt -s cdspell
shopt -s checkhash
shopt -s checkjobs
shopt -s dirspell
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob


# ------------------------------------------------------------------------------
# History


HISTIGNORE='&:[ ]*:exit:ls:bg:fg:history:clear'
HISTCONTROL='erasedups:ignoreboth'
HISTTIMEFORMAT='%F %T '
HISTSIZE=987654
HISTFILESIZE=987654

shopt -s cmdhist
shopt -s histappend
shopt -s histreedit
shopt -s histverify

# Enable incremental history search with up/down arrows.
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'


# ------------------------------------------------------------------------------
# More or less copied from default bashrc on Ubuntu.


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
    . /usr/share/bash-completion/bash_completion
  elif   [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Path for humans.
alias path='echo -e ${PATH//:/\\n}'


# ------------------------------------------------------------------------------
# Cherry pick from Bash Sensible
#
# https://github.com/mrzool/bash-sensible/blob/master/sensible.bash


# Enable history expansion with space.
# E.g. typing !!<space> will replace the !! with your last command.
bind Space:magic-space

# Perform file completion in a case insensitive fashion.
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent.
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press.
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories.
bind "set mark-symlinked-directories on"


# ------------------------------------------------------------------------------


source "$DOT_BASH_BASHRC"


# ------------------------------------------------------------------------------
