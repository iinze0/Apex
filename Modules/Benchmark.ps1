# Apex Module: Benchmark
function Measure-AppLaunch([string]$exe) {
  if (-not (Test-Path $exe)) { return $null }
  $sw = [Diagnostics.Stopwatch]::StartNew()
  $p = Start-Process -FilePath $exe -PassThru -WindowStyle Hidden -ErrorAction SilentlyContinue
  if (-not $p) { return $null }
  Start-Sleep -Milliseconds 300
  try { $p.Kill() } catch {}
  $sw.Stop()
  return $sw.ElapsedMilliseconds
}
function Invoke-SimpleBenchmark {
  Write-Host '--- Simple benchmark ---' -ForegroundColor Cyan
  # Responsiveness sample
  $sw = [Diagnostics.Stopwatch]::StartNew()
  $null = Get-Process -Id $PID -ErrorAction SilentlyContinue
  $sw.Stop()
  Write-Host ("Responsiveness sample: {0} ms" -f $sw.ElapsedMilliseconds) -ForegroundColor DarkCyan
  # Optional: notepad launch if available
  $notepad = Join-Path $env:SystemRoot 'System32\notepad.exe'
  $launch = Measure-AppLaunch $notepad
  if ($launch) { Write-Host ("Notepad launch sample: {0} ms" -f $launch) -ForegroundColor DarkCyan }
  # Boot uptime
  try {
    $boot = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
    $hours = [math]::Round(((Get-Date) - $boot).TotalHours, 1)
    Write-Host ("Current uptime: {0} hours" -f $hours) -ForegroundColor DarkCyan
  } catch {}
  Write-Host 'Note: full boot time requires a reboot measurement (not available in-session).' -ForegroundColor DarkGray
}
