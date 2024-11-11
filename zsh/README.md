# Ansible Role `zsh`

Sets up Zsh.

## Features

### Powerlevel10k

Includes [powerlevel10k][p10k]. Powerlevel10k is a theme for Zsh. It emphasizes
speed, flexibility and out-of-the-box experience.

Cloned and placed. From the main config file used by p10k I source two custom
files where I place my own settings for p10k. I might switch to Starship.
Problem with p10k is that the project is extremly complex and run by a single
(albeit highly competent) person.

[p10k]: https://github.com/romkatv/powerlevel10k

### Zsh completions

Includes [zsh-completions][zsh-completions]. Additional completion definitions.

Cloned and source files added to `fpath` in `~/.zshrc`.

[zsh-completions]: https://github.com/zsh-users/zsh-completions

### Zsh syntax highlighting

Includes [zsh-syntax-highlighting][zsh-syntax-highlighting]. Fish shell-like
syntax highlighting for Zsh.

Cloned, compiled, sourced, and configured manually.

[zsh-syntax-highlighting]: https://github.com/zsh-users/zsh-syntax-highlighting

### Zsh history substring search

Includes [zsh-history-substring-search][zsh-history-substring-search]. This is a
clean-room implementation of the Fish shell's history search feature, where you
can type in any part of any command from history and then press chosen keys,
such as the UP and DOWN arrows, to cycle through matches.

Cloned, compiled, sourced, and configured manually.

If you want to use zsh-syntax-highlighting along with this script, then make
sure that you load it before you load this script.

[zsh-history-substring-search]:
  https://github.com/zsh-users/zsh-history-substring-search

### Zsh autosuggestions

Includes [zsh-autosuggestions][zsh-autosuggestions]. Fish-like fast/unobtrusive
autosuggestions for zsh.

This role clones the repository, compiles the Zsh script, sources it from
`~/.zshrc`, and configures it via the documented env variables to exclude
certain patterns.

Must be setup after both `zsh-syntax-highlighting` and
`zsh-history-substring-search` to work properly.

[zsh-autosuggestions]: https://github.com/zsh-users/zsh-autosuggestions
