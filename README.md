# UndertaleMonstersRecreation

UNDERTALE monsters (Froggit, Moldsmal) as light battle content for
[MagicalGlassRedux](https://github.com/Bli-AIk/MagicalGlassRedux) and
[Kristal](https://github.com/KristalTeam/Kristal).

This repository is a **maintenance fork**: upstream
([FireRainV/Noelle-Libraries-Pack](https://github.com/FireRainV/Noelle-Libraries-Pack))
targets Kristal 0.10 and is not actively maintained, so this repo follows the
MagicalGlassRedux fork's Kristal 0.11-dev port and adds optional
[kristal-i18n](https://github.com/Bli-AIk/kristal-i18n) support. See
[`UPSTREAM.md`](UPSTREAM.md) and [`CHANGELOG.md`](CHANGELOG.md).

## Kristal version support

| Kristal v0.11.0-dev (`f62afea`, 2026-08-22) | UndertaleMonstersRecreation v0.0.0, engineVer `v0.11.0-dev` |
|---|---|
| Kristal v0.10.0 | v1.1.1 (upstream; `f182f69`) |

### Upstream alignment

| fork 版本 | 对齐的上游 | 上游 ref | 说明 |
|---|---|---|---|
| 0.0.0 | UndertaleMonstersRecreation v1.1.1 | Noelle-Libraries-Pack `f182f69` (tree `672a97d6`) | 0.11-dev 移植 + kristal-i18n 适配 |

## Install

Requires **MagicalGlassRedux** (library id `magical-glass`) — this library
declares it as a hard dependency.

```sh
git submodule add https://github.com/Bli-AIk/MagicalGlassRedux.git \
  libraries/MagicalGlassRedux
git submodule add https://github.com/Bli-AIk/UndertaleMonstersRecreation.git \
  libraries/UndertaleMonstersRecreation
```

The library is content-only (no `lib.lua`): its enemies register through the
`MG_EVENT` registry once MagicalGlassRedux is loaded.

## Content

- `froggit` — light enemy, 3 waves (flies / leapfrog / splinter), 6 bullets,
  encounters `froggit`, `froggit2`
- `moldsmal` — light enemy, 2 waves (pollendrop / splinterbig), encounters
  `moldsmal`, `moldsmal2`, `moldsmal3`

## kristal-i18n support (optional)

When kristal-i18n (`kristalI18n`) is loaded, enemy names/check texts and wave
strings are localized through `Game:loc` with `Game:hasStr` guards (English
fallback otherwise). Language data lives in `lang/` and is merged automatically.

Translation sources (see `lang/zh_hans.json` provenance comments):

- UT string key-value extraction provided by 「真是滑稽了啊」 (UT 汉化原作: 好人汉化组)
- Deltarune 汉化: [Goodman 3 / gm3dr](https://github.com/gm3dr/DeltaruneChinese)
  — overrides where the light-world UI overlaps
- Fork-uncovered strings require maintainer review before translation

## License

**License split** (important — see `LICENSE-UPSTREAM.md`, `LICENSE-MIT`,
`LICENSE-APACHE`):

- *Upstream code* — everything originally shipped in the pack library, as
  imported at commit `249c171`, itself pinned to upstream `f182f69` —
  **retains all rights** © the original authors listed in `lib.json`
  (Sam Deluxe, BrendaK7200, FireRainV); upstream published it **without a
  license grant**. No open-source license is claimed for it here.
- *Fork code* — port fixes, the kristal-i18n adapter, CI, and docs — is
  **dual-licensed MIT OR Apache-2.0, at your option**.
- The split follows `git log`: every commit up to and including
  `Import UndertaleMonstersRecreation v1.1.1 ...` is upstream; everything after
  is fork code.
- Translations derived from upstream text fall under the upstream rights;
  fork-original translations are covered by the fork license.

Maintenance note: upstream author FireRainV has been contacted regarding this
fork (see `UPSTREAM.md`); contributions back upstream via PR are preferred to
fork-local drift.
