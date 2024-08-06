# Ansible Role `conda`

This role installs the latest version of
[Miniconda](https://docs.anaconda.com/miniconda)
if no version is already installed.

It also configures a few things.

## Lifecycle Management

Conda is not kept up-to-date by this role. This has to be done manually:

```sh
conda update conda
```
