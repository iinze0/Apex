# Apex v1.3

Modular structure and basic performance metrics.

## What's new

- **Modular architecture** — `Modules/` folder. `Hardware.ps1` and `Metrics.ps1` are loaded automatically. New modules can be dropped in.
- **Basic metrics** — Before and after each apply, Apex logs free RAM, process count, CPU load, and free disk to `Apex-metrics.txt`.
- Hardware detection and adaptive tweaks from v1.2 remain.
- Safe / Advanced / Extreme presets, restore points, dry-run, and selective revert unchanged.

## Download

- Download `Apex.bat`, `Apex.ps1`, and the `Modules` folder.
- Right-click `Apex.bat` → Run as administrator.
- `s` Safe, `ad` Advanced, `e` Extreme, then `a` to apply.

## Safety

Nothing changes until you apply. Restore point is attempted. High-risk items always ask for confirmation.

MIT License.
