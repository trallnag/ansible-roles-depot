# Ansible role `windows_burnt_toast`

Sets up [BurntToast](https://github.com/Windos/BurntToast) on Windows.

BurntToast is installed from the PowerShell Gallery
[here](https://www.powershellgallery.com/packages/BurntToast).

BurntToast is pinned to a specific version. The version is specified in
[`./files/install-module.ps1`](./files/install-module.ps1).

A custom application is added to the registry
to improve the notification experience with BurntToast
(based on [this issue](https://github.com/Windos/BurntToast/issues/236)).

Includes tiny script that wraps creating a notification from Linux.

## Maintenance

### Update

Check the repository on GitHub for new releases of BurntToast.

New releases might contain a lot of breaking changes as indicated in some
comments by the author of BurntToast.

Bump the version in [`./files/install-module.ps1`](./files/install-module.ps1)
and run this role.
