. "{{ windows_powershell_profile_top_script_win_path }}"

Set-PSReadLineOption -Colors @{
  Command = "`e[95m" # Bright magenta.
  Default = "`e[39m" # Default.
  InlinePrediction = "`e[38;2;176;176;176;3m" # Foreground. 24-bit. Gray. Italic.
  ListPredictionSelected = "`e[48;2;220;220;220m" # Background. 24-bit. Gray.
  ListPredictionTooltip = "`e[38;2;176;176;176;3m" # Foreground. 24-bit. Gray. Italic.
  Member = "`e[34m" # Blue.
  Number = "`e[96m" # Bright cyan.
  Operator = "`e[39m" # Default.
  Parameter = "`e[93m" # Bright yellow.
  Selection = "`e[48;2;220;220;220m" # Background. 24-bit. Gray.
  String = "`e[36m" # Cyan.
}

$PSStyle.FileInfo.Directory = "`e[94m" # Bright blue.

Set-PSReadLineOption -PredictionSource HistoryAndPlugin

Set-PSReadLineOption -PredictionViewStyle ListView

Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

Import-Module -Name CompletionPredictor

. "{{ windows_powershell_profile_middle_script_win_path }}"

. "{{ windows_powershell_profile_bottom_script_win_path }}"
