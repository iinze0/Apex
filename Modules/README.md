# Apex Modules

Modular structure for Apex. The main `Apex.ps1` loads every `.ps1` in this folder.

| Module | Purpose |
|--------|---------|
| `Hardware.ps1` | CPU, GPU, RAM, OS, laptop detection. Used for adaptive tweaks. |
| `Metrics.ps1` | Basic performance snapshot (free RAM, process count, CPU load, free disk, uptime, responsiveness). Written before and after apply. |
| `Profiles.ps1` | Hardware-specific profiles (LowRAM, Hybrid, Laptop, DiscreteGPU, HighCore). Suggests and can apply a recommended preset. |

Future modules can be added here and will be loaded automatically.
