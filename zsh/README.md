# Ansible role `zsh`

Sets up Zsh and plugins.

Zsh is installed with APT. It is not kept up to date.

The plugins are installed directly from their source code repositories based on
pinned commits. The plugins are not kept up to date.

Here is a list of the plugins and their source code repositories:

- Powerlevel10k: <https://github.com/romkatv/powerlevel10k>
- Zsh completions: <https://github.com/zsh-users/zsh-completions>
- Zsh syntax highlighting: <https://github.com/zsh-users/zsh-syntax-highlighting>
- Zsh history substring search: <https://github.com/zsh-users/zsh-history-substring-search>
- Zsh autosuggestions: <https://github.com/zsh-users/zsh-autosuggestions>

## Maintenance

### Update

Use APT to update Zsh.

To update the plugins, check the plugin repositories on GitHub for new commits.
Bump the commit hashes in [`./tasks/main.yaml`](./tasks/main.yaml) and run this
role.
