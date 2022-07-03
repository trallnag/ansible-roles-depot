# Ansible Role `asdf`

Installs asdf, several asdf plugins, several tools via the plugins, and
activates defined versions of these tools for global usage.

- <http://asdf-vm.com/>
- <https://github.com/asdf-vm/asdf>

## Included Tools

- [`shfmt`: Shell parser, formatter, and interpreter](https://github.com/mvdan/sh)
- [`shellcheck`: Static analysis tool for shell scripts](https://github.com/koalaman/shellcheck)

## Version Management

All versions are pinned in this role. This goes both for asdf itself and the
tools included in this role. To adjust versions jump into
[`tasks/main.yaml`](tasks/main.yaml) and adjust parameters.
