# Apex

Tiered Windows optimizer. Safe by default. Advanced and Extreme are opt-in. Stability and rollback are built in. Hardware-aware adaptive tweaks. Modular structure. Expert mode, hardware profiles, custom profiles, before/after comparison, hardware warnings, simple benchmark, and quick status (v1.9).

## Philosophy

- **Safe first** — nothing destructive runs without explicit confirmation
- **Tiered control** — Safe / Advanced / Extreme / Expert / Profile
- **Customizable** — individual options and custom saved profiles
- **Reversible** — restore points and selective rollback
- **Hardware aware** — detects CPU, GPU, RAM, laptop; adapts settings and warns on high-risk
- **Modular** — `Modules/` folder, loaded automatically
- **Measurable** — metrics, comparison, benchmark, and status overview

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
5. `s` = Safe, `ad` = Advanced, `e` = Extreme, `x` = Expert, `p` = Profile, `m` = Metrics, `w` = Warnings, `b` = Benchmark, `st` = Status.
6. `cs` = save custom profile, `cl` = load custom profile, `clist` = list profiles.
7. `d` = dry run. `r` = revert. `a` = apply. `c` = scan.

## Modules

- `Modules/Hardware.ps1` — detection
- `Modules/Metrics.ps1` — snapshot and comparison
- `Modules/Profiles.ps1` — hardware profiles
- `Modules/Warnings.ps1` — warnings and high-risk confirmation
- `Modules/Benchmark.ps1` — simple in-session benchmark
- `Modules/CustomProfiles.ps1` — save/load/list custom tick profiles
- `Modules/Status.ps1` — quick status overview

## Adaptive behavior and warnings

- Service split scales with core count.
- Memory compression disabled only if RAM ≥ 16 GB.
- Hybrid CPUs get performance-core preference.
- Discrete GPU noted for HAGS.
- Laptop detection logged.
- Hardware warnings can add an extra check on high-risk apply.

## Safety

- Restore point created on apply
- High-risk options require a second `yes`
- Hardware warnings add an extra check when present
- Dry-run mode shows what would change
- Revert restores services and policies (does not reinstall removed apps)

## Status

Core engine functional (v1.9). Quick status overview present. Next: refinements or additional modules as needed.

MIT License. Not affiliated with Talon or any other optimizer.
