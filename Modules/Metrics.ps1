# Apex Module: Metrics
function Get-Metrics {
  $m = @{}
  try {
    $os = Get-CimInstance Win32_OperatingSystem
    $m.FreeRAM = [math]::Round($os.FreePhysicalMemory / 1MB, 1)
    $m.TotalRAM = [math]::Round($os.TotalVisibleMemorySize / 1MB, 1)
    $m.Processes = (Get-Process -ErrorAction SilentlyContinue).Count
  } catch { $m.FreeRAM = 0; $m.TotalRAM = 0; $m.Processes = 0 }
  try {
    $cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
    $m.CPULoad = [math]::Round($cpu.LoadPercentage, 0)
  } catch { $m.CPULoad = 0 }
  try {
    $disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
    $m.FreeDisk = [math]::Round($disk.FreeSpace / 1GB, 1)
  } catch { $m.FreeDisk = 0 }
  try {
    $boot = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
    $m.UptimeHours = [math]::Round(((Get-Date) - $boot).TotalHours, 1)
  } catch { $m.UptimeHours = 0 }
  try {
    $sw = [Diagnostics.Stopwatch]::StartNew()
    $null = Get-Process -Id $PID -ErrorAction SilentlyContinue
    $sw.Stop()
    $m.RespMs = $sw.ElapsedMilliseconds
  } catch { $m.RespMs = 0 }
  $m.Timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
  return $m
}
function Write-MetricsReport([string]$label, [string]$path) {
  $m = Get-Metrics
  $line = "$($m.Timestamp)  $label  FreeRAM=$($m.FreeRAM)GB  Processes=$($m.Processes)  CPU=$($m.CPULoad)%  FreeDisk=$($m.FreeDisk)GB  Uptime=$($m.UptimeHours)h  Resp=$($m.RespMs)ms"
  Add-Content -Path $path -Value $line
  Write-Host $line -ForegroundColor DarkCyan
}
function Show-MetricsComparison([string]$path) {
  if (-not (Test-Path $path)) { Write-Host 'No metrics file yet.'; return }
  $lines = Get-Content $path -Tail 4
  $before = $lines | Where-Object { $_ -match 'before' } | Select-Object -Last 1
  $after  = $lines | Where-Object { $_ -match 'after' }  | Select-Object -Last 1
  if (-not $before -or -not $after) { Write-Host 'Need both before and after entries.'; return }
  Write-Host '--- Before / After ---' -ForegroundColor Cyan
  Write-Host $before -ForegroundColor DarkGray
  Write-Host $after  -ForegroundColor Green
  # Simple delta parse
  function Get-Val($line, $key) {
    if ($line -match "$key=([0-9.]+)") { return [double]$Matches[1] } else { return 0 }
  }
  $bRam = Get-Val $before 'FreeRAM'; $aRam = Get-Val $after 'FreeRAM'
  $bProc = Get-Val $before 'Processes'; $aProc = Get-Val $after 'Processes'
  $bResp = Get-Val $before 'Resp'; $aResp = Get-Val $after 'Resp'
  Write-Host ("FreeRAM delta: {0:+0.0;-0.0} GB" -f ($aRam - $bRam)) -ForegroundColor Cyan
  Write-Host ("Processes delta: {0:+0;-0}" -f ($aProc - $bProc)) -ForegroundColor Cyan
  Write-Host ("Resp delta: {0:+0;-0} ms" -f ($aResp - $bResp)) -ForegroundColor Cyan
}
