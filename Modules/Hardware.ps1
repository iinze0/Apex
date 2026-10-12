# Apex Module: Hardware
function Get-HardwareInfo {
  $info = @{}
  try {
    $cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
    $info.CPU = $cpu.Name.Trim()
    $info.Cores = [int]$cpu.NumberOfCores
    $info.Threads = [int]$cpu.NumberOfLogicalProcessors
    $info.Hybrid = ($cpu.Name -match '12th|13th|14th|Ultra|Core Ultra' -or $info.Threads -gt ($info.Cores * 1.5))
  } catch { $info.CPU = 'Unknown'; $info.Cores = 0; $info.Threads = 0; $info.Hybrid = $false }
  try {
    $gpu = Get-CimInstance Win32_VideoController | Where-Object { $_.Name -notmatch 'Microsoft|Remote|Virtual' } | Select-Object -First 1
    $info.GPU = if ($gpu) { $gpu.Name.Trim() } else { 'Unknown' }
    $info.DiscreteGPU = ($info.GPU -match 'NVIDIA|AMD|Radeon|GeForce|RTX|RX ')
  } catch { $info.GPU = 'Unknown'; $info.DiscreteGPU = $false }
  try {
    $ramGB = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 1)
    $info.RAM = "$ramGB GB"
    $info.RAMGB = $ramGB
  } catch { $info.RAM = 'Unknown'; $info.RAMGB = 0 }
  try {
    $os = Get-CimInstance Win32_OperatingSystem
    $info.OS = "$($os.Caption) $($os.Version)"
  } catch { $info.OS = 'Unknown' }
  try {
    $bat = Get-CimInstance Win32_Battery -ErrorAction SilentlyContinue
    $info.Laptop = [bool]$bat
  } catch { $info.Laptop = $false }
  return $info
}
