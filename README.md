# Apex

Tiered Windows optimizer. Safe by default. Advanced and Extreme are opt-in. Stability and rollback are built in.

## Philosophy

- **Safe first** — nothing destructive runs without explicit confirmation
- **Tiered control** — Safe / Advanced / Extreme
- **Customizable** — individual options, not one-click only
- **Reversible** — restore points and selective rollback
- **Hardware aware** — detects CPU, GPU, and RAM on startup (v1.1+)

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
4. Hardware info prints on start. Use number keys to toggle options.
5. `s` = Safe, `ad` = Advanced, `e` = Extreme.
6. `d` = dry run. `r` = revert. `a` = apply. `c` = scan (includes hardware).

## Safety

- Restore point created on apply
- High-risk options require a second `yes`
- Dry-run mode shows what would change
- Revert restores services and policies (does not reinstall removed apps)

## Status

Core engine is functional (v1.1). Hardware detection present. Next phases: modular modules, adaptive tweaks based on hardware, performance metrics, Expert mode UI.

MIT License. Not affiliated with Talon or any other optimizer.
