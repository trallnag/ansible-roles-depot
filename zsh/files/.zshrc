# Executes commands at the start of an interactive session.

# Here is how Zsh loads its configuration files:
#   1) .zshenv
#   2) .zprofile if login
#   3) .zshrc if interactive
#   4) .zlogin if login
#   5) .zlogout

# Online man page regarding Zsh options: https://linux.die.net/man/1/zshoptions

#
# ------------------------------------------------------------------------------
#

source "$DOT_ZSH_ZSHRC_INTERACTIVE"

#
# ------------------------------------------------------------------------------
#

# Initialize direnv if available. For more information, see:
# https://github.com/romkatv/powerlevel10k#how-do-i-initialize-direnv-when-using-instant-prompt
(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv export zsh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Initialize direnv if available. For more information, see:
# https://github.com/romkatv/powerlevel10k#how-do-i-initialize-direnv-when-using-instant-prompt
(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv hook zsh)"

source "$DOT_ZSH_PLUGINS_DIR/powerlevel10k/powerlevel10k.zsh-theme"
source "$ZDOTDIR/.p10k.zsh"

#
# ------------------------------------------------------------------------------
#

# Job Control.
setopt LONG_LIST_JOBS

# Changing Directories.
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS

# Few random setopt.
setopt \
    combining_chars \
    interactive_comments \
    notify \
    rc_quotes \
;

# Few random unsetopt.
unsetopt \
    mail_warning \
    list_beep \
    bg_nice \
    hup \
    check_jobs \
;

# Plugin zsh-completions.
fpath=("$DOT_ZSH_PLUGINS_DIR/zsh-completions/src" $fpath)

# Central place where I (try to) place all completions.
fpath=("$DOT_ZSH_COMPLETIONS_DIR" $fpath)

# Central place where I (try to) place all Zsh functions.
fpath=("$DOT_ZSH_FUNCTIONS_DIR" $fpath)
lines=$(find $fpath[1] -maxdepth 1 -type f | wc -l)
if [ $lines -ne 0 ]; then autoload -U $fpath[1]/*(.:t); fi

#
# ------------------------------------------------------------------------------
# History
#

# Loaded into memory from the history file.
export HISTSIZE=987654

# Stored in the zsh history file.
export SAVEHIST=987654

export HISTFILE=$ZDOTDIR/.zsh_history

setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_NO_FUNCTIONS
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt append_history
setopt bang_hist
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

export HISTORY_IGNORE="(history(| *)|cd(| *)|ls(| *))|mkdir(| *))"

alias history='fc -il 1'

#
# ------------------------------------------------------------------------------
# Completion
#
# This block is based on:
#   - f1e24d3 https://github.com/sorin-ionescu/prezto/blob/master/modules/completion/init.zsh
#   - 02d07f3 https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/completion.zsh
#

zmodload -i zsh/complist

setopt COMPLETE_IN_WORD   # Complete from both ends of a word.
setopt ALWAYS_TO_END      # Move cursor to the end of a completed word.
setopt AUTO_MENU          # Show completion menu on a successive tab press.
setopt AUTO_LIST          # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH   # If completed parameter is a directory, add a trailing slash.
setopt EXTENDED_GLOB      # Needed for file modification glob modifiers with compinit.

unsetopt MENU_COMPLETE    # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL     # Disable start/stop characters in shell editor.

# Perform path search even on command names with slashes.
#
# Unset because it slows done stuff with WSL2 dramatically. Can be activated
# when WSL does not append all Windows PATHs automatically to Linux PATHs.
#
# <https://github.com/sorin-ionescu/prezto/issues/1820>
unsetopt PATH_DIRS

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

#
# ------------------------------------------------------------------------------
# Correction
#

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

#
# ------------------------------------------------------------------------------
# zsh-syntax-highlighting
#

source "$DOT_ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Disable displaying paths with underlines.
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/573
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
ZSH_HIGHLIGHT_MAXLENGTH=512
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)

#
# ------------------------------------------------------------------------------
# zsh-history-substring-search
#
# If you want to use zsh-syntax-highlighting along with this script, then make
# sure that you load it before you load this script.
#

source "$DOT_ZSH_PLUGINS_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh"

if [[ -n "$terminfo[kcuu1]" ]]; then
  bindkey -M emacs "$terminfo[kcuu1]" history-substring-search-up
  bindkey -M viins "$terminfo[kcuu1]" history-substring-search-up
fi

if [[ -n "$terminfo[kcud1]" ]]; then
  bindkey -M emacs "$terminfo[kcud1]" history-substring-search-down
  bindkey -M viins "$terminfo[kcud1]" history-substring-search-down
fi

#
# ------------------------------------------------------------------------------
# zsh-autosuggestions
#
# Must be setup after both zsh-syntax-highlighting and
# zsh-history-substring-search to work properly.
#

source "$DOT_ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=25

ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c100,)|*/mnt/c/*"

ZSH_AUTOSUGGEST_COMPLETION_IGNORE="?(#c100,)|*/mnt/c/*"

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

#
# ------------------------------------------------------------------------------
# ohmyzsh
#

source "$DOT_ZSH_PLUGINS_DIR/ohmyzsh/lib/clipboard.zsh"
source "$DOT_ZSH_PLUGINS_DIR/ohmyzsh/lib/functions.zsh"
source "$DOT_ZSH_PLUGINS_DIR/ohmyzsh/lib/key-bindings.zsh"
source "$DOT_ZSH_PLUGINS_DIR/ohmyzsh/lib/termsupport.zsh"

#
# ------------------------------------------------------------------------------
#

source "$DOT_ZSH_ZSHRC"

#
# ------------------------------------------------------------------------------
#

source "$DOT_ZSH_ZSHRC_COMPINIT_PRE"


# ------------------------------------------------------------------------------
# Compinit & Bashcompinit


autoload -Uz compinit bashcompinit
compinit -u -d ${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump
bashcompinit

#
# ------------------------------------------------------------------------------
#

source "$DOT_ZSH_ZSHRC_COMPINIT_POST"

#
# ------------------------------------------------------------------------------
# Aliases.
#

# Path for humans.
alias path='echo -e ${PATH//:/\\n}'

alias rmi='rm -I'

source "$DOT_ZSH_ALIASES"
