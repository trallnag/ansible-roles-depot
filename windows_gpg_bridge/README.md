# Ansible role `windows_gpg_bridge`

Sets up [gpg-bridge](https://github.com/BusyJay/gpg-bridge) on Windows.

It is necessary for properly relaying the GnuPG agent from Windows to Linux.
This is done in a different role named `windows_gpg_agent_relay`.

Gpg-bridge is installed by downloading the binary archive for a specified
release from the GitHub repository and processing it. Previously installed
versions are overwritten. It is not kept up to date.

## Maintenance

### Update

Gpg-bridge is pinned to a specific version in
[`tasks/main.yaml`](tasks/main.yaml) via the variables
`windows_gpg_bridge_target_version` and `windows_gpg_bridge_target_digest`.

Check the [busyjay/gpg-bridge][gpg-bridge] repository on GitHub for changes.

Adjust the values of the aforementioned variables to update gpg-bridge.
