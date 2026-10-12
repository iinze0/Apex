# Apex

Tiered Windows optimizer. Safe by default. Advanced and Extreme are opt-in. Stability and rollback are built in. Hardware-aware adaptive tweaks. Modular structure. Expert mode UI, expanded metrics, and hardware profiles (v1.5).

## Philosophy

- **Safe first** — nothing destructive runs without explicit confirmation
- **Tiered control** — Safe / Advanced / Extreme / Expert / Profile
- **Customizable** — individual options, not one-click only
- **Reversible** — restore points and selective rollback
- **Hardware aware** — detects CPU, GPU, RAM, laptop; adapts service split, memory compression, hybrid policy, and HAGS notes
- **Modular** — `Modules/` folder, loaded automatically
- **Measurable** — metrics logged before and after apply

## Tiers

| Tier | What it does | Risk |
| --- | --- | --- |
| **Safe** | Telemetry, ads, visuals, basic privacy, mouse, sticky keys | Low |
| **Advanced** | Apps, power plan, GPU scheduling, Game DVR, Search, Xbox | Medium |
| **Extreme** | Idle-off, Defender real-time, Windows Update, IPv6, dynamic tick | High (explicit yes required) |
| **Expert** | Focused view of high-risk options (press `x`) | High |
| **Profile** | Hardware-specific recommendation (press `p`) | Medium |

## Quick start

1. Download the latest release (include the `Modules` folder).
2. Keep `Apex.bat`, `Apex.ps1`, and the `Modules` folder together.
3. Right-click `Apex.bat` → Run as administrator.
4. Hardware info prints on start. Metrics are logged on apply.
5. `s` = Safe, `ad` = Advanced, `e` = Extreme, `x` = Expert, `p` = Profile.
6. `d` = dry run. `r` = revert. `a` = apply. `c` = scan.

## Modules

- `Modules/Hardware.ps1` — CPU, GPU, RAM, OS, laptop detection
- `Modules/Metrics.ps1` — free RAM, process count, CPU load, free disk, uptime, responsiveness
- `Modules/Profiles.ps1` — hardware profiles (LowRAM, Hybrid, Laptop, DiscreteGPU, HighCore)

## Adaptive behavior

- Service split threshold scales with core count.
- Memory compression disabled only if RAM ≥ 16 GB.
- Hybrid CPUs get performance-core preference.
- Discrete GPU detection is noted when HAGS is enabled.
- Laptop detection is logged.
- Hardware profile suggests and can apply a recommended preset.

## Safety

- Restore point created on apply
- High-risk options require a second `yes`
- Dry-run mode shows what would change
- Revert restores services and policies (does not reinstall removed apps)

## Status

Core engine functional (v1.5). Hardware profiles and further modularization present. Next: detailed before/after comparison, additional modules as needed.

MIT License. Not affiliated with Talon or any other optimizer.
