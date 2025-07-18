#!/usr/bin/zsh

# Wrapper for compiling files.
compile() {
  for file in $@; do
    if [[ -s $file && ( ! -s $file.zwc || $file -nt $file.zwc) ]]; then
      zcompile $file
    fi
  done
}

compile ${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump
