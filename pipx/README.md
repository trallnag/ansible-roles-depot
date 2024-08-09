# Ansible Role `pipx`

Manages [pipx](https://github.com/pypa/pipx) and some pipx packages.

Assumes that pipx is already installed as part of initial getting started of the
playbook. Installs some packages with pipx.

## Lifecycle Management

Pipx is kept up-to-date by this role.

Versions and updates of the packages installed with pipx within this role are
not managed by this role. Must be done manually. For example with the following
command, that will upgrade all packages managed by pipx.

```sh
pipx upgrade-all
```
