# Apex Module: History
function Show-LastRun {
  $last = Join-Path $PSScriptRoot '..\Apex-last.txt'
  $log = Join-Path $PSScriptRoot '..\Apex-log.txt'
  Write-Host '--- Last run ---' -ForegroundColor Cyan
  if (Test-Path $last) {
    Write-Host (Get-Content $last -Raw).Trim() -ForegroundColor DarkCyan
  } else {
    Write-Host 'No last run recorded.' -ForegroundColor DarkGray
  }
  if (Test-Path $log) {
    Write-Host '--- Recent log ---' -ForegroundColor Cyan
    Get-Content $log -Tail 8 | ForEach-Object { Write-Host "  $_" }
  }
}
