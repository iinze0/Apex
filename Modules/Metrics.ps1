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
  # Boot time (approx)
  try {
    $boot = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
    $m.UptimeHours = [math]::Round(((Get-Date) - $boot).TotalHours, 1)
  } catch { $m.UptimeHours = 0 }
  # Simple responsiveness (process start time)
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
