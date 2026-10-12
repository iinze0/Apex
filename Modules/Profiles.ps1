# Apex Module: Hardware Profiles
function Get-HardwareProfile {
  $hw = Get-HardwareInfo
  $profile = 'Standard'
  $notes = @()
  if ($hw.RAMGB -lt 16) { $profile = 'LowRAM'; $notes += 'Low RAM (<16 GB): memory compression left on' }
  if ($hw.Hybrid) { $profile = 'Hybrid'; $notes += 'Hybrid CPU: performance cores preferred' }
  if ($hw.Laptop) { $profile = 'Laptop'; $notes += 'Laptop: DC settings matched to AC' }
  if ($hw.DiscreteGPU) { $notes += 'Discrete GPU: HAGS recommended' }
  if ($hw.Cores -ge 16) { $notes += 'High core count: elevated service split' }
  return @{ Name = $profile; Notes = $notes; Hardware = $hw }
}
function Show-HardwareProfile {
  $p = Get-HardwareProfile
  Write-Host "--- Hardware profile: $($p.Name) ---" -ForegroundColor Cyan
  foreach ($n in $p.Notes) { Write-Host "  $n" -ForegroundColor DarkCyan }
  Write-Host 'Recommended: Advanced preset for most systems. Extreme only if you confirm high-risk items.'
}
function Apply-RecommendedProfile {
  $p = Get-HardwareProfile
  Write-Host "Applying recommended profile for $($p.Name)..."
  # Default to Advanced; user can still change
  Set-Preset 'advanced'
  Write-Log "Hardware profile applied: $($p.Name) (Advanced preset)"
  Show-HardwareProfile
}
