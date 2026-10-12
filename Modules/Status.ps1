# Apex Module: Status
function Show-Status {
  Write-Host '--- System status ---' -ForegroundColor Cyan
  # Power plan
  $plan = powercfg /getactivescheme 2>$null
  Write-Host "Power: $plan" -ForegroundColor DarkCyan
  # Key services
  foreach ($svc in @('DiagTrack','SysMain','WSearch','wuauserv','WinDefend','bthserv','Spooler')) {
    try {
      $s = Get-Service -Name $svc -ErrorAction Stop
      $color = if ($s.StartType -eq 'Disabled') { 'Green' } else { 'Yellow' }
      Write-Host ("  {0,-16} {1}" -f $svc, $s.StartType) -ForegroundColor $color
    } catch {
      Write-Host ("  {0,-16} missing" -f $svc) -ForegroundColor DarkGray
    }
  }
  # Key registry
  $tel = 'unset'; $hags = 'unset'
  try { $tel = (Get-ItemProperty 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name AllowTelemetry -ErrorAction Stop).AllowTelemetry } catch {}
  try { $hags = (Get-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers' -Name HwSchMode -ErrorAction Stop).HwSchMode } catch {}
  Write-Host "Telemetry: $tel | HAGS: $hags" -ForegroundColor DarkCyan
  # Hardware summary
  if (Get-Command Get-HardwareInfo -ErrorAction SilentlyContinue) {
    $hw = Get-HardwareInfo
    Write-Host "Hardware: $($hw.Cores)c / $($hw.RAM) / DiscreteGPU=$($hw.DiscreteGPU)" -ForegroundColor DarkCyan
  }
}
