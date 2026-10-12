# Apex

Tiered Windows optimizer. Safe by default. Advanced and Extreme are opt-in. Stability and rollback are built in. Hardware-aware adaptive tweaks. Modular structure with basic metrics (v1.3).

## Philosophy

- **Safe first** — nothing destructive runs without explicit confirmation
- **Tiered control** — Safe / Advanced / Extreme
- **Customizable** — individual options, not one-click only
- **Reversible** — restore points and selective rollback
- **Hardware aware** — detects CPU, GPU, RAM, laptop; adapts service split, memory compression, hybrid policy, and HAGS notes
- **Modular** — `Modules/` folder, loaded automatically
- **Measurable** — basic metrics logged before and after apply

## Tiers

| Tier | What it does | Risk |
| --- | --- | --- |
| **Safe** | Telemetry, ads, visuals, basic privacy, mouse, sticky keys | Low |
| **Advanced** | Apps, power plan, GPU scheduling, Game DVR, Search, Xbox | Medium |
| **Extreme** | Idle-off, Defender real-time, Windows Update, IPv6, dynamic tick | High (explicit yes required) |

## Quick start

1. Download the latest release (include the `Modules` folder).
2. Keep `Apex.bat`, `Apex.ps1`, and the `Modules` folder together.
3. Right-click `Apex.bat` → Run as administrator.
4. Hardware info prints on start. Metrics are logged on apply.
5. `s` = Safe, `ad` = Advanced, `e` = Extreme.
6. `d` = dry run. `r` = revert. `a` = apply. `c` = scan.

## Modules (v1.3)

- `Modules/Hardware.ps1` — CPU, GPU, RAM, OS, laptop detection
- `Modules/Metrics.ps1` — free RAM, process count, CPU load, free disk (before/after)

New `.ps1` files dropped into `Modules/` are loaded automatically.

## Adaptive behavior

- Service split threshold scales with core count.
- Memory compression disabled only if RAM ≥ 16 GB.
- Hybrid CPUs get performance-core preference.
- Discrete GPU detection is noted when HAGS is enabled.
- Laptop detection is logged.

## Safety

- Restore point created on apply
- High-risk options require a second `yes`
- Dry-run mode shows what would change
- Revert restores services and policies (does not reinstall removed apps)

## Status

Core engine functional (v1.3). Modular structure and basic metrics present. Next: Expert mode UI, more detailed performance metrics, additional modules.

MIT License. Not affiliated with Talon or any other optimizer.
