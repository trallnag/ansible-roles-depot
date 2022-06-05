# Ansible Role `git_extras`

Installs git-extras with Homebrew and setups completion for Zsh because that is
not done automatically for some reason (see formula).

- <https://github.com/tj/git-extras>
- <https://github.com/Homebrew/homebrew-core/blob/master/Formula/git-extras.rb>

## Version Management

Not managed via Ansible. Must be done manually.

```shell
brew update && brew upgrade
```
