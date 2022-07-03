# Ansible Role `git_extras`

Installs git-extras with Homebrew and setups completion for Zsh because that is
not done automatically for whatever reason (see formula).

- <https://github.com/tj/git-extras>
- <https://github.com/Homebrew/homebrew-core/blob/master/Formula/git-extras.rb>

## Version Management

Versions and updates are not managed via Ansible. Must be done manually.

    brew update && brew upgrade
