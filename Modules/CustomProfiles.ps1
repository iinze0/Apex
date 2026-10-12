# Apex Module: Custom Profiles
$ProfileDir = Join-Path $PSScriptRoot '..\Profiles'
if (-not (Test-Path $ProfileDir)) { New-Item -Path $ProfileDir -ItemType Directory -Force | Out-Null }

function Save-CustomProfile([string]$name) {
  if (-not $name) { $name = Read-Host 'Profile name' }
  if (-not $name) { return }
  $on = @($opts.Keys | Where-Object { $opts[$_] })
  $path = Join-Path $ProfileDir "$name.txt"
  Set-Content -Path $path -Value ($on -join ',')
  Write-Log "Custom profile saved: $name"
  Write-Host "Saved profile: $name" -ForegroundColor Green
}

function Load-CustomProfile([string]$name) {
  if (-not $name) { $name = Read-Host 'Profile name' }
  if (-not $name) { return }
  $path = Join-Path $ProfileDir "$name.txt"
  if (-not (Test-Path $path)) { Write-Host "Profile not found: $name"; return }
  foreach ($k in @($opts.Keys)) { $opts[$k] = $false }
  foreach ($k in ((Get-Content $path -Raw) -split ',')) {
    $n = $k.Trim()
    if ($opts.Contains($n)) { $opts[$n] = $true }
  }
  Write-Log "Custom profile loaded: $name"
  Write-Host "Loaded profile: $name" -ForegroundColor Green
}

function List-CustomProfiles {
  $files = Get-ChildItem $ProfileDir -Filter *.txt -ErrorAction SilentlyContinue
  if (-not $files) { Write-Host 'No custom profiles.'; return }
  Write-Host '--- Custom profiles ---' -ForegroundColor Cyan
  foreach ($f in $files) { Write-Host ("  {0}" -f $f.BaseName) }
}
