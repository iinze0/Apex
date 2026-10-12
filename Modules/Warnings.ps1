# Apex Module: Hardware Warnings
function Test-HardwareWarnings {
  $hw = Get-HardwareInfo
  $warn = @()
  if ($hw.RAMGB -lt 8) { $warn += 'Low RAM (<8 GB): Extreme and idle-off are strongly discouraged.' }
  elseif ($hw.RAMGB -lt 16) { $warn += 'Moderate RAM (<16 GB): memory compression stays on; avoid Extreme idle-off.' }
  if ($hw.Laptop -and $hw.Cores -le 4) { $warn += 'Low-power laptop: high idle-off or dynamic tick may reduce battery life.' }
  if (-not $hw.DiscreteGPU) { $warn += 'No discrete GPU detected: HAGS may have limited benefit.' }
  return $warn
}
function Show-HardwareWarnings {
  $w = Test-HardwareWarnings
  if ($w.Count -eq 0) { Write-Host 'No hardware warnings.' -ForegroundColor Green; return }
  Write-Host '--- Hardware warnings ---' -ForegroundColor Yellow
  foreach ($line in $w) { Write-Host "  $line" -ForegroundColor Yellow }
}
function Confirm-HighRiskOnHardware {
  $w = Test-HardwareWarnings
  if ($w.Count -eq 0) { return $true }
  Show-HardwareWarnings
  return ((Read-Host 'Continue with high-risk options anyway? Type yes') -eq 'yes')
}
