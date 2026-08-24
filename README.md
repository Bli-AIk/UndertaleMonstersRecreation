# UndertaleMonstersRecreation

[![license](https://img.shields.io/badge/license-MIT%2FApache--2.0-blue)](LICENSE-APACHE) <img src="https://img.shields.io/github/repo-size/Bli-AIk/UndertaleMonstersRecreation.svg"/> <img src="https://img.shields.io/github/last-commit/Bli-AIk/UndertaleMonstersRecreation.svg"/> <img src="https://img.shields.io/github/v/release/Bli-AIk/UndertaleMonstersRecreation.svg"/> <br>
<img src="https://img.shields.io/badge/UNDERTALE-000000?style=for-the-badge&logo=undertale&logoColor=ff0000" /> <img src="https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white" /> <img src="https://img.shields.io/badge/Kristal-FF6B35?style=for-the-badge&logo=love2d&logoColor=white" />

**UndertaleMonstersRecreation** — UNDERTALE monsters and the Mouse Hole light-world shop as content for [MagicalGlassRedux](https://github.com/Bli-AIk/MagicalGlassRedux) and [Kristal](https://github.com/KristalTeam/Kristal).

This repository is a **maintenance fork**: upstream ([FireRainV/Noelle-Libraries-Pack](https://github.com/FireRainV/Noelle-Libraries-Pack)) targets Kristal 0.10 and is no longer actively maintained, so this fork follows the MagicalGlassRedux fork's Kristal 0.11-dev port and adds optional [kristal-i18n](https://github.com/Bli-AIk/kristal-i18n) support. See [`UPSTREAM.md`](UPSTREAM.md) and [`CHANGELOG.md`](CHANGELOG.md).

| English | 简体中文                        |
| ------- | ------------------------------- |
| English | [简体中文](./README_zh_hans.md) |

## Kristal Version Support

| Kristal version | UndertaleMonstersRecreation |
| --------------- | --------------------------- |
| [v0.11.0-dev](https://github.com/KristalTeam/Kristal/commit/f62afea63ccab02f468c24ac0d096bd8a2c9aa81) (`f62afea`, 2026-08-17) | v0.0.0 (fork), engineVer `v0.11.0-dev` |
| v0.10.0 | v1.1.1 (upstream; `f182f69`) |

`v0.0.0` is the fork's current version line in `lib.json`; there is no packaged fork release yet (see [`CHANGELOG.md`](CHANGELOG.md)).

### Upstream alignment

| Fork version | Aligned upstream | Upstream ref | Notes |
| ------------ | ---------------- | ------------ | ----- |
| v0.0.0 | UndertaleMonstersRecreation v1.1.1 | Noelle-Libraries-Pack `f182f69` (folder tree `0482e7d`) | Kristal 0.11-dev port + kristal-i18n adaption |

The pins live in `.github/upstream-facts.json`; see [`UPSTREAM.md`](UPSTREAM.md) for how they are computed.

## Install

Requires **MagicalGlassRedux** (library id `magical-glass`) — this library declares it as a hard dependency.

```sh
git submodule add https://github.com/Bli-AIk/MagicalGlassRedux.git \
  libraries/MagicalGlassRedux
git submodule add https://github.com/Bli-AIk/UndertaleMonstersRecreation.git \
  libraries/UndertaleMonstersRecreation
```

The library is content-only (no `lib.lua`): its enemies register through the `MG_EVENT` registry once MagicalGlassRedux is loaded. Keep the upstream folder name (`UndertaleMonstersRecreation`) so the engine discovers it via `lib.json` (library id `undertale_monsters_recreation`).

## Content

- `froggit` — light enemy, 3 waves (flies / leapfrog / splinter), 6 bullets, encounters `froggit`, `froggit2`
- `moldsmal` — light enemy, 2 waves (pollendrop / splinterbig), encounters `moldsmal`, `moldsmal2`, `moldsmal3`
- `mousehole` — Amelia's light-world shop, with the Mouse Hole background, shop music, Hush Puppy, and progressive TALK topics. MGR registers it automatically; enter it with `Game.world:lightShopTransition("mousehole", options)`.

## kristal-i18n Support (optional)

When kristal-i18n (`kristalI18n`) is loaded, enemy names/check texts, wave strings, and Mouse Hole shop text are localized through `Game:loc` with `Game:hasStr` guards (English fallback otherwise). Language data lives in `lang/` and is merged automatically.

Translation provenance is recorded in the comments of `lang/zh_hans.json`; see [Upstream & References](#upstream--references) for the sources.

## Upstream & References

| Source | Author |
| ------ | ------ |
| [Noelle-Libraries-Pack](https://github.com/FireRainV/Noelle-Libraries-Pack) (upstream) | FireRainV |
| Mouse Hole component from Noelle-Libraries-Pack | FireRainV |
| UT 汉化补丁 0.3.3 key-value extraction | 真是滑稽了啊 (extraction) · [Goodman 3 Localization Group \| UNDERTALE & DELTARUNE Chinese Localization](https://github.com/gm3dr/) (original UT translation) |
| [DeltaruneChinese](https://github.com/gm3dr/DeltaruneChinese) — overrides where the light-world UI overlaps | [Goodman 3 Localization Group \| UNDERTALE & DELTARUNE Chinese Localization](https://github.com/gm3dr/) |
| [kristal-i18n](https://github.com/Bli-AIk/kristal-i18n) | Bli-AIk |

## Contributing

Issues and Pull Requests are welcome. For the repo layout (upstream vs fork code), land rules and translation review requirements, see [CONTRIBUTING.md](CONTRIBUTING.md).

## License

**License split** (important — see [LICENSE-UPSTREAM.md](LICENSE-UPSTREAM.md), [LICENSE-MIT](LICENSE-MIT), [LICENSE-APACHE](LICENSE-APACHE)):

- *Upstream code* — the original UMR import and Mouse Hole component imported from Noelle-Libraries-Pack at `f182f69` — **retain all rights** © their original authors (Sam Deluxe, BrendaK7200, FireRainV); upstream published them **without a license grant**. No open-source license is claimed for them here.
- *Fork code* — port fixes, the kristal-i18n adapter, CI, and docs — is **dual-licensed MIT OR Apache-2.0, at your option**.
- The split follows `git log`: `Import UndertaleMonstersRecreation v1.1.1 ...` and `Import Mouse Hole content ...` are upstream imports; their follow-up portability changes are fork code.
- Translations derived from upstream text fall under the upstream rights; fork-original translations are covered by the fork license.
