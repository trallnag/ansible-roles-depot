$Env:__SuppressAnsiEscapeSequences = "1"
$Env:NO_COLOR = "1"
$Env:TERM = "dumb"
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

Get-WinGetPackage `
    | Where-Object -Property Source -eq "winget" `
    | Select-Object -ExpandProperty Id
