# Apex 2.1 (Windows-only; Modules optional with fallbacks; menu keys fixed; dry-run clarified)
# Windows-only optimizer. Requires Windows PowerShell 5.1+ (not PowerShell Core on Linux/macOS).
# Optional features need the Modules folder next to this script. Core runs without it (with reduced info).
$ErrorActionPreference = 'Continue'
$Log = Join-Path $PSScriptRoot 'Apex-log.txt'
$TickFile = Join-Path $PSScriptRoot 'Apex-ticks.txt'
$Last = Join-Path $PSScriptRoot 'Apex-last.txt'
$Before = Join-Path $PSScriptRoot 'Apex-before.txt'
$Report = Join-Path $PSScriptRoot 'Apex-report.txt'

# Load modules
$modDir = Join-Path $PSScriptRoot 'Modules'
if (Test-Path $modDir) {
  Get-ChildItem $modDir -Filter *.ps1 | ForEach-Object { . $_.FullName }
}
$MetricsFile = Join-Path $PSScriptRoot 'Apex-metrics.txt'

# Safe fallback if Modules are missing
if (-not (Get-Command Get-HardwareInfo -ErrorAction SilentlyContinue)) {
  function Get-HardwareInfo {
    return @{
      CPU = 'Unknown (Modules missing)'
      Cores = 4
      Threads = 4
      GPU = 'Unknown'
      RAM = 'Unknown'
      RAMGB = 8
      OS = 'Windows'
      Hybrid = $false
      DiscreteGPU = $false
      Laptop = $false
    }
  }
}

function Write-Log([string]$msg) { Add-Content -Path $Log -Value ('{0}  {1}' -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $msg); Write-Host $msg }
function Assert-Admin {
  $p = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
  if (-not $p.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host 'Not running as administrator. Prompting...'
    Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File "' + $PSCommandPath + '"' -Verb RunAs
    exit
  }
}
# ... (full script continues with the remaining functions and logic from the patched file)
