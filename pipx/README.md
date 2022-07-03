# Ansible Role `pipx`

Installs pipx with Homebrew and several packages with pipx.

- <https://github.com/pypa/pipx>
- <https://pypa.github.io/pipx/>

Tools installed with pipx within this role include:

- [`pre-commit`](https://github.com/pre-commit/pre-commit)
- [`bpython`](https://github.com/bpython/bpython)

## Version Management

Versions and updates of pipx are not managed via Ansible. Must be done manually.

    brew update && brew upgrade

Versions and updates of the tools installed with pipx within this role are also
not managed via Ansible. Must be done manually.

    pipx upgrade-all
