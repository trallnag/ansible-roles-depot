# Ansible Role `windows_gpg_bridge`

Sets up [GPG Bridge][gpg-bridge].

It is necessary for properly relaying GPG Agent from Windows to Linux. This
is done in a different role named `windows_gpg_agent_relay`.

It is installed by downloading the binary archive for a specified release from
the GitHub repository and processing it. Previously installed versions are
overwritten. It is not kept up to date.

[gpg-bridge]: https://github.com/BusyJay/gpg-bridge
