Set-StrictMode -Version Latest

Get-WinGetPackage `
    | Where-Object -Property Source -eq "winget" `
    | Select -ExpandProperty Id
