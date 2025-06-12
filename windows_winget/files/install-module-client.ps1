Set-StrictMode -Version Latest

$moduleName = "Microsoft.WinGet.Client"

$module = Get-InstalledModule -Name $moduleName -ErrorAction SilentlyContinue

if ($module -eq $null) {
  Install-Module -Name $moduleName -Scope CurrentUser
  Write-Output "status=changed"
}
