# Ansible Role `shell`

Contains shell commons for Bash, Zsh, and Fish. Only used from the respective
roles for the aforementioned shells.

The idea is that the three files in `templates` contain a base configuration
sourced by the individual shells.

In addition, the individual shells add content to the three scripts from within
their respective roles. The goal is that every shell has knowledge of other
shells basic config.
