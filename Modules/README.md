# Apex Modules

Modular structure for Apex. The main `Apex.ps1` loads every `.ps1` in this folder.

| Module | Purpose |
|--------|---------|
| `Hardware.ps1` | CPU, GPU, RAM, OS, laptop detection. Used for adaptive tweaks. |
| `Metrics.ps1` | Performance snapshot and before/after comparison. |
| `Profiles.ps1` | Hardware-specific profiles. |
| `Warnings.ps1` | Hardware-specific warnings and high-risk confirmation. |
| `Benchmark.ps1` | Simple in-session benchmark (responsiveness, optional app launch sample, uptime). |

Future modules can be added here and will be loaded automatically.
