# Ansible Role `zsh`

Sets up Zsh and plugins.

- Zsh: <https://www.zsh.org>
- Powerlevel10k: <https://github.com/romkatv/powerlevel10k>
- Zsh completions: <https://github.com/zsh-users/zsh-completions>
- Zsh syntax highlighting: <https://github.com/zsh-users/zsh-syntax-highlighting>
- Zsh history substring search: <https://github.com/zsh-users/zsh-history-substring-search>
- Zsh autosuggestions: <https://github.com/zsh-users/zsh-autosuggestions>

Zsh is installed with APT. Zsh is not kept up to date.

Plugins are installed directly from their source code repositories based on the
latest commits of their default branches. Already checked out repositories are
are synchronized their remotes and therefore kept up to date.
