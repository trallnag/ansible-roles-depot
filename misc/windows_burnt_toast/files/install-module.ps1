$Env:__SuppressAnsiEscapeSequences = "1"
$Env:NO_COLOR = "1"
$Env:TERM = "dumb"
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

$moduleName = "BurntToast"
$moduleVersion = "0.8.5"

$module = Get-InstalledModule -Name $moduleName -ErrorAction SilentlyContinue

if ($module -eq $null) {
    Install-Module `
        -Name $moduleName `
        -RequiredVersion $moduleVersion `
        -Scope CurrentUser
    Write-Output status=changed
}
elseif ($module.Version -ne $moduleVersion) {
    Uninstall-Module -Name $moduleName -AllVersions
    Install-Module `
        -Name $moduleName `
        -RequiredVersion $moduleVersion `
        -Scope CurrentUser
    Write-Output status=changed
}
