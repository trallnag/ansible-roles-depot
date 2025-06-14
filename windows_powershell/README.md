# Ansible role `windows_powershell`

Sets up PowerShell (version >= 7) and related components on Windows.

PowerShell is not installed. It is not kept up to date.

Several modules from the PowerShell Gallery are installed:

- [CompletionPredictor](https://github.com/PowerShell/CompletionPredictor)
- [PSScriptTools](https://github.com/jdhitsolutions/PSScriptTools)

These modules are installed. They are not kept up to date.

## Maintenance

### Update

Use WinGet (via UniGetUI) to update PowerShell.

Use PowerShell (via UniGetUI) to update the modules.
