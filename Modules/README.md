# Apex Modules

Modular structure for Apex. The main `Apex.ps1` loads every `.ps1` in this folder.

| Module | Purpose |
|--------|---------|
| `Hardware.ps1` | CPU, GPU, RAM, OS, laptop detection. |
| `Metrics.ps1` | Snapshot and before/after comparison. |
| `Profiles.ps1` | Hardware-specific profiles. |
| `Warnings.ps1` | Hardware warnings and high-risk confirmation. |
| `Benchmark.ps1` | Simple in-session benchmark. |
| `CustomProfiles.ps1` | Save, load, and list custom tick profiles. |
| `Status.ps1` | Quick status overview (services, power, key registry, hardware). |

Future modules can be added here and will be loaded automatically.
