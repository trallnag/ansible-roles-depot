# ------------------------------------------------------------------------------
# Fileinfo


# Executes commands at the start of an interactive session.

# Here is how Zsh loads its configuration files:
#   1) .zshenv
#   2) .zprofile if login
#   3) .zshrc if interactive
#   4) .zlogin if login
#   5) .zlogout

# Online man page regarding Zsh options: https://linux.die.net/man/1/zshoptions


# ------------------------------------------------------------------------------


source "$ZSH_ZSHRC_TOP_INTERACTIVE"


# ------------------------------------------------------------------------------


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ------------------------------------------------------------------------------


source "$ZSH_ZSHRC_TOP_NON_INTERACTIVE"


# ------------------------------------------------------------------------------
# Misc


# Few random setopt.
setopt \
    combining_chars \
    interactive_comments \
    long_list_jobs \
    auto_resume \
    notify \
    rc_quotes \
    auto_pushd \
    pushd_ignore_dups \
    pushdminus \
    completealiases \
;

# Few random unsetopt.
unsetopt \
    mail_warning \
    list_beep \
    bg_nice \
    hup \
    check_jobs \
;

# Path for humans.
alias path='echo -e ${PATH//:/\\n}'

# Plugin zsh-completions.
fpath=("$ZSH_MODULES/zsh-completions/src" $fpath)

# Central place where I (try to) place all completions.
fpath=("$ZSH_COMPLETIONS" $fpath)

# Central place where I (try to) place all Zsh functions.
fpath=("$ZSH_FUNCTIONS" $fpath)
lines=$(find $fpath[1] -maxdepth 1 -type f | wc -l)
if [ $lines -ne 0 ]; then autoload -U $fpath[1]/*(.:t); fi


# ------------------------------------------------------------------------------
# Prompt


source "$ZSH_MODULES/powerlevel10k/powerlevel10k.zsh-theme"
source "$ZSH_DYNRC/.p10k.zsh"


# ------------------------------------------------------------------------------
# History


setopt \
    bang_hist \
    extended_history \
    hist_find_no_dups \
    hist_ignore_dups \
    hist_ignore_all_dups \
    hist_expire_dups_first \
    hist_ignore_space \
    hist_save_no_dups \
    hist_reduce_blanks \
    hist_verify \
    hist_no_functions \
    share_history \
    inc_append_history \
    interactivecomments \
    ;

unsetopt \
    hist_beep \
    ;

export HISTFILE=$ZDOTDIR/.zsh_history

export HISTSIZE=256789
export SAVEHIST=256789

export HIST_STAMPS=yyyy-mm-dd

export HISTORY_IGNORE="(history(| *)|cd(| *)|ls(| *))|mkdir(| *))"


# ------------------------------------------------------------------------------
# Completion
#
# This block is based on:
#   - f1e24d3 https://github.com/sorin-ionescu/prezto/blob/master/modules/completion/init.zsh
#   - 02d07f3 https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/completion.zsh


zmodload -i zsh/complist

setopt \
    complete_in_word \
    always_to_end \
    auto_menu \
    auto_list \
    auto_param_slash \
    extended_glob \
;

unsetopt \
    menu_complete \
    flowcontrol \
;

bindkey -M menuselect '^o' accept-and-infer-next-history

# Defaults.
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Use caching to make completion for commands such as dpkg and apt usable.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Increase the number of errors based on the length of the typed word. But make
# sure to cap (at 7) the max-errors to avoid hanging.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directories
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Environment Variables
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
    adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
    clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
    gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
    ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
    named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
    operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
    rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
    usbmux uucp vcsa wwwrun xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

# Ignore multiple entries.
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# Kill
zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

expand-or-complete-with-dots() {
    print -Pn "%F{red}…%f"
    zle expand-or-complete
    zle redisplay
}
zle -N expand-or-complete-with-dots
# Set the function as the default tab completion widget.
bindkey -M emacs "^I" expand-or-complete-with-dots
bindkey -M viins "^I" expand-or-complete-with-dots
bindkey -M vicmd "^I" expand-or-complete-with-dots


# ------------------------------------------------------------------------------
# Correction


setopt correct

# Disable correction.
alias ack='nocorrect ack'
alias cd='nocorrect cd'
alias cp='nocorrect cp'
alias ebuild='nocorrect ebuild'
alias gcc='nocorrect gcc'
alias gist='nocorrect gist'
alias grep='nocorrect grep'
alias heroku='nocorrect heroku'
alias ln='nocorrect ln'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias rm='nocorrect rm'

# Disable globbing.
alias bower='noglob bower'
alias fc='noglob fc'
alias find='noglob find'
alias ftp='noglob ftp'
alias history='noglob history'
alias locate='noglob locate'
alias rake='noglob rake'
alias rsync='noglob rsync'
alias scp='noglob scp'
alias sftp='noglob sftp'

# Safe ops. Ask the user before doing anything destructive.
alias cpi="${aliases[cp]:-cp} -i"
alias lni="${aliases[ln]:-ln} -i"
alias mvi="${aliases[mv]:-mv} -i"
alias rmi="${aliases[rm]:-rm} -i"


# ------------------------------------------------------------------------------
# Grep


exc_folders="{.bzr,CVS,.git,.hg,.svn,.idea,.tox,node_modules}"
grep_options="--color=auto --exclude-dir=$exc_folders"

alias grep="grep $grep_options"
alias egrep="egrep $grep_options"
alias fgrep="fgrep $grep_options"


# ------------------------------------------------------------------------------
# OMZ libary scripts
#
# Source a few useful scripts from Oh My Zsh forked by me. This block can be
# placed everywhere in '~/.zshrc'.


_omz="$ZSH_MODULES/oh-my-zsh"

source $_omz/lib/clipboard.zsh
source $_omz/lib/key-bindings.zsh
source $_omz/lib/spectrum.zsh

unset _omz


# ------------------------------------------------------------------------------
# zsh-syntax-highlighting


source "$ZSH_MODULES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Disable displaying paths with underlines.
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/573
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

ZSH_HIGHLIGHT_MAXLENGTH=512

SH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)


# ------------------------------------------------------------------------------
# zsh-history-substring-search
#
# If you want to use zsh-syntax-highlighting along with this script, then make
# sure that you load it before you load this script.


source "$ZSH_MODULES/zsh-history-substring-search/zsh-history-substring-search.zsh"

if [[ -n "$terminfo[kcuu1]" ]]; then
  bindkey -M emacs "$terminfo[kcuu1]" history-substring-search-up
  bindkey -M viins "$terminfo[kcuu1]" history-substring-search-up
fi

if [[ -n "$terminfo[kcud1]" ]]; then
  bindkey -M emacs "$terminfo[kcud1]" history-substring-search-down
  bindkey -M viins "$terminfo[kcud1]" history-substring-search-down
fi


# ------------------------------------------------------------------------------
# zsh-autosuggestions
#
# Must be setup after both zsh-syntax-highlighting and
# zsh-history-substring-search to work properly.


source "$ZSH_MODULES/zsh-autosuggestions/zsh-autosuggestions.zsh"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=25

ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c100,)|*/mnt/c/*"

ZSH_AUTOSUGGEST_COMPLETION_IGNORE="?(#c100,)|*/mnt/c/*"

ZSH_AUTOSUGGEST_MANUAL_REBIND=1


# ------------------------------------------------------------------------------
# Terminal Title. Taken from:
# https://github.com/jreese/zsh-titles/blob/master/titles.plugin.zsh


# Copyright 2015 John Reese
# Licensed under the MIT license
#
# Update terminal/tmux window titles based on location/command

function update_title() {
  local a
  # escape '%' in $1, make nonprintables visible
  a=${(V)1//\%/\%\%}
  print -nz "%20>...>$a"
  read -rz a
  # remove newlines
  a=${a//$'\n'/}
  if [[ -n "$TMUX" ]] && [[ $TERM == screen* || $TERM == tmux* ]]; then
    print -n "\ek${(%)a}:${(%)2}\e\\"
  elif [[ "$TERM" =~ "screen*" ]]; then
    print -n "\ek${(%)a}:${(%)2}\e\\"
  elif [[ "$TERM" =~ "xterm*" || "$TERM" = "alacritty" || "$TERM" =~ "st*" ]]; then
    print -n "\e]0;${(%)a}:${(%)2}\a"
  elif [[ "$TERM" =~ "^rxvt-unicode.*" ]]; then
    printf '\33]2;%s:%s\007' ${(%)a} ${(%)2}
  fi
}

# called just before the prompt is printed
function _zsh_title__precmd() {
  update_title "zsh" "%20<...<%~"
}

# called just before a command is executed
function _zsh_title__preexec() {
  local -a cmd
  
  # Escape '\'
  1=${1//\\/\\\\\\\\}

  cmd=(${(z)1})             # Re-parse the command line

  # Construct a command that will output the desired job number.
  case $cmd[1] in
    fg)	cmd="${(z)jobtexts[${(Q)cmd[2]:-%+}]}" ;;
    %*)	cmd="${(z)jobtexts[${(Q)cmd[1]:-%+}]}" ;;
  esac
  update_title "$cmd" "%20<...<%~"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _zsh_title__precmd
add-zsh-hook preexec _zsh_title__preexec


# ------------------------------------------------------------------------------


source "$ZSH_ZSHRC_MIDDLE"


# ------------------------------------------------------------------------------


source "$ZSH_ZSHRC_BOTTOM_BEFORE_COMP_INIT"


# ------------------------------------------------------------------------------
# Compinit & Bashcompinit


autoload -Uz compinit bashcompinit
compinit -d ${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump
bashcompinit


# ------------------------------------------------------------------------------


source "$ZSH_ZSHRC_BOTTOM_AFTER_COMP_INIT"


# ------------------------------------------------------------------------------
