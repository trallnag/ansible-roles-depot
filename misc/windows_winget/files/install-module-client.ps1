$Env:__SuppressAnsiEscapeSequences = "1"
$Env:NO_COLOR = "1"
$Env:TERM = "dumb"
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

function Install-ModuleWrapped {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true)]
    [string]$ModuleName
  )

  $module = Get-InstalledModule -Name $ModuleName -ErrorAction SilentlyContinue

  if ($module -eq $null) {
    Install-Module `
      -Name $ModuleName `
      -Repository PSGallery `
      -Scope CurrentUser `
      -AllowClobber

    Write-Output "status=changed"
  }
}

Install-ModuleWrapped -ModuleName Microsoft.WinGet.Client
