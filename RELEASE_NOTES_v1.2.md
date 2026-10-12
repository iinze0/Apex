# Apex v1.2

Tiered Windows optimizer with hardware-aware adaptive tweaks.

## What's new

- **Hardware detection** — CPU (cores/threads), GPU, RAM, OS, laptop detection on startup and in scan.
- **Adaptive performance tweaks**:
  - Service split threshold scales with core count (higher on 8+ and 16+ core systems).
  - Memory compression disabled only if RAM ≥ 16 GB.
  - Hybrid CPUs (Intel 12th gen+, Core Ultra, high thread/core ratio) get performance-core preference.
  - Discrete GPU detection noted when HAGS is enabled.
  - Laptop detection logged; DC settings already match AC.
- Clear **Safe / Advanced / Extreme** presets.
- Restore point on apply, dry-run, selective revert.
- High-risk options (Defender, Update, IPv6, idle-off, dynamic tick) still require explicit yes.

## Download

- Download `Apex.bat` and `Apex.ps1` from this release.
- Right-click `Apex.bat` → Run as administrator.
- Type `s` for Safe, `ad` for Advanced, `e` for Extreme, then `a` to apply.

## Safety

Nothing changes until you apply. Restore point is attempted. High-risk items always ask for confirmation.

MIT License.
