# Ansible Role `conda`

This role installes the latest version of Miniconda if no version of Miniconda
is already installed. It also configures a few things.

- https://docs.conda.io/en/latest/miniconda.html
- https://conda.io/projects/continuumio-conda/en/latest/release-notes.html

Does not support upgrades. Upgrades have to be done manually.

It is enough to execute the following:

    conda update conda
