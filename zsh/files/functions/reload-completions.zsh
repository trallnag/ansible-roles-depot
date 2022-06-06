zcd=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump

rm -rf $zcd

rm -rf $zcd.zwc

autoload -Uz compinit bashcompinit

compinit -d $zcd

bashcompinit

zcompile $zcd
