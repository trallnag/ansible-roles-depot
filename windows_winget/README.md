# Ansible role `windows_winget`

Sets up WinGet on Windows and installs various packages that don't require
dedicated setups.

WinGet is not installed. It is not kept up to date.

The various packages are installed with WinGet. They are not kept up to date.

The PowerShell module `Microsoft.WinGet.Client` is installed. It is not kept up
to date.

## Maintenance

### Update

Use the Microsoft Store to update WinGet.

Use WinGet to update the various packages.

Use PowerShell to update the `Microsoft.WinGet.Client` module.
