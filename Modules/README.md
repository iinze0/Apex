# Apex Modules

Modular structure for Apex. The main `Apex.ps1` loads every `.ps1` in this folder.

| Module | Purpose |
|--------|---------|
| `Hardware.ps1` | CPU, GPU, RAM, OS, laptop detection. Used for adaptive tweaks. |
| `Metrics.ps1` | Performance snapshot and before/after comparison (free RAM, processes, CPU, disk, uptime, responsiveness). |
| `Profiles.ps1` | Hardware-specific profiles (LowRAM, Hybrid, Laptop, DiscreteGPU, HighCore). |
| `Warnings.ps1` | Hardware-specific warnings and optional high-risk confirmation. |

Future modules can be added here and will be loaded automatically.
