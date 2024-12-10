Set-StrictMode -Version Latest

# Install using installer script if not already installed.
if (-not (Test-Path "$Env:USERPROFILE\scoop\shims\scoop.exe")) {
  Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
  Write-Output "status=changed"
}

# Check that scoop is usable.
scoop --version

# Add the extras bucket if not already added.
if (-not (scoop bucket list | select Name | Select-String extras)) {
  scoop bucket add extras
  Write-Output "status=changed"
}
