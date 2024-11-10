# Maintenance

## Update GPG Bridge

[GnuPG Bridge][gpg-bridge] is pinned to a specific version in
[`tasks/main.yaml`](tasks/main.yaml) via the variables
`windows_gpg_bridge_target_version` and `windows_gpg_bridge_target_sha256sum`.

Check [busyjay/gpg-bridge][gpg-bridge] on GitHub for changes.
Consider updating if applicable. To update, adjust the values of the
aforementioned variables.

[gpg-bridge]: https://github.com/BusyJay/gpg-bridge
