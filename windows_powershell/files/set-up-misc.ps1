$Env:__SuppressAnsiEscapeSequences = "1"
$Env:NO_COLOR = "1"
$Env:TERM = "dumb"
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

try {
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
} catch {
  $allowedMessage = "*PowerShell updated your execution policy successfully*"
  if (($_ | Out-String) -notlike $allowedMessage) {
    throw
  }
}
