# Apex

Tiered Windows optimizer. Safe by default. Advanced and Extreme are opt-in. Stability and rollback are built in. Hardware-aware adaptive tweaks (v1.2+).

## Philosophy

- **Safe first** — nothing destructive runs without explicit confirmation
- **Tiered control** — Safe / Advanced / Extreme
- **Customizable** — individual options, not one-click only
- **Reversible** — restore points and selective rollback
- **Hardware aware** — detects CPU, GPU, RAM, laptop; adapts service split, memory compression, hybrid policy, and HAGS notes

## Tiers

| Tier | What it does | Risk |
| --- | --- | --- |
| **Safe** | Telemetry, ads, visuals, basic privacy, mouse, sticky keys | Low |
| **Advanced** | Apps, power plan, GPU scheduling, Game DVR, Search, Xbox | Medium |
| **Extreme** | Idle-off, Defender real-time, Windows Update, IPv6, dynamic tick | High (explicit yes required) |

## Quick start

1. Download the latest release.
2. Keep `Apex.bat` and `Apex.ps1` in the same folder.
3. Right-click `Apex.bat` → Run as administrator.
4. Hardware info prints on start. Adaptive decisions are logged when CPU or HAGS is applied.
5. `s` = Safe, `ad` = Advanced, `e` = Extreme.
6. `d` = dry run. `r` = revert. `a` = apply. `c` = scan.

## Adaptive behavior (v1.2)

- Service split threshold scales with core count (higher on 8+ and 16+ core CPUs).
- Memory compression is disabled only if RAM ≥ 16 GB.
- Hybrid CPUs (Intel 12th gen+, Core Ultra, or high thread/core ratio) get performance-core preference.
- Discrete GPU detection is noted when HAGS is enabled.
- Laptop detection is logged; DC power settings already match AC.

## Safety

- Restore point created on apply
- High-risk options require a second `yes`
- Dry-run mode shows what would change
- Revert restores services and policies (does not reinstall removed apps)

## Status

Core engine functional (v1.2). Hardware detection and adaptive tweaks present. Next: modular modules, performance metrics, Expert mode UI.

MIT License. Not affiliated with Talon or any other optimizer.
