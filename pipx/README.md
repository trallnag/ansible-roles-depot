# Ansible Role `pipx`

Installs pipx with the system Python. Also installs some packages with pipx.

- <https://github.com/pypa/pipx>
- <https://pypa.github.io/pipx/>

## Lifecycle Management

Pipx is kept up-to-date by this role.

Versions and updates of the packages installed with Pipx within this role are
not managed by this role. Must be done manually. For example with:

```shell
pipx upgrade-all
```
