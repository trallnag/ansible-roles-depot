Set-PSReadLineOption -Colors @{
  Command = "DarkMagenta"
  ContinuationPrompt = "DarkGray"
  Default = "DarkGray"
  Keyword = "DarkGreen"
  ListPrediction = "DarkYellow"
  ListPredictionSelected = "#778899"
  Member = "DarkGray"
  Number = "DarkGray"
  Operator = "DarkGray"
  Parameter = "DarkGreen"
  Type = "DarkGray"
  Variable = "DarkGreen"
}

$PSStyle.FileInfo.Directory = "`e[34;1m"

Set-PSReadLineOption -PredictionSource HistoryAndPlugin
