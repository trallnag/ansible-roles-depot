# Ansible Role `asdf`

- <http://asdf-vm.com/>
- <https://github.com/asdf-vm/asdf>

## Features

- Installs asdf.
- Installs several asdf plugins.

## Dependency on Homebrew

Having listed the `homebrew` role as an explicit dependency ensures that init
code related to Homebrew comes before asdf. Why? I want tools installed with
asdf to trump tools installed with Homebrew.

## Version Management

**Asdf** itself is pinned to a Git tag. To adjust versions jump into `main.yaml`
and adjust the version parameter. Get available versions from asdf repo on
GitHub.

The **asdf plugins** added within this role are not updated automatically.
