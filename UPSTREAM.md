# Upstream facts

This repository is a **maintenance fork** of UndertaleMonstersRecreation v1.1.1,
imported from the Noelle-Libraries-Pack by FireRainV. It also carries the
Mouse Hole light-world shop from the same pack. It depends on
[MagicalGlassRedux](https://github.com/Bli-AIk/MagicalGlassRedux) (hard
dependency, library id `magical-glass`).

## Pinned upstream facts

See `.github/upstream-facts.json` for machine-readable pins. Human summary:

| Fact | Value |
|---|---|
| Source repo | [FireRainV/Noelle-Libraries-Pack](https://github.com/FireRainV/Noelle-Libraries-Pack) |
| Branch | `main` |
| Path | `libraries/UndertaleMonstersRecreation` |
| Ref (last commit touching the path) | `f182f69` ("Updated engineVer to v0.10.0") |
| Folder tree SHA | `0482e7d371545ecd48ebd42bfb90b098e387dbc9` |
| Library version | `v1.1.1` |
| Library id | `undertale_monsters_recreation` |
| engineVer | `v0.10.0` |
| Dependencies | `["magical-glass"]` |

### Mouse Hole component

| Fact | Value |
| --- | --- |
| Source repo | [FireRainV/Noelle-Libraries-Pack](https://github.com/FireRainV/Noelle-Libraries-Pack) |
| Branch / ref | `main` / `f182f69` |
| Original addition | `4e4ef27` (`initial commit`, FireRainV) |
| Local import commit | `f11bfb9` (`Import Mouse Hole content ...`, authored by FireRainV) |
| Imported content | `scripts/lightshops/mousehole.lua`, Amelia's actor and sprites, Mouse Hole backgrounds, and `shop.ogg` |

The exact source blob IDs are stored in `.github/upstream-facts.json` under
`additional_sources.mousehole.blobs`. The drift check compares those blobs with
the current upstream tree alongside the primary UMR library pin.

## Extraction method

Upstream only distributes the library as a folder inside the pack repository.
This fork was created by sparse-cloning the pack at the pinned ref and importing
`libraries/UndertaleMonstersRecreation/*` into the repository **root** so the
repo itself is a valid `libraries/<id>/` for any Kristal mod.

The library is **content-only** (no `lib.lua`): enemies and the Mouse Hole shop
register through the `MG_EVENT` registry provided by MagicalGlassRedux.

## Attribution chain

- **Sam Deluxe** — Froggit
- **BrendaK7200** — Moldsmal
- **FireRainV** — QoL stuff and bug fixes
- **FireRainV** — Mouse Hole, Amelia, and associated assets

## Recomputing the pins

```sh
gh api "repos/FireRainV/Noelle-Libraries-Pack/commits?path=libraries/UndertaleMonstersRecreation&sha=main&per_page=1" --jq '.[0].sha'
gh api "repos/FireRainV/Noelle-Libraries-Pack/git/trees/main?recursive=1" \
  --jq '.tree[] | select(.path=="libraries/UndertaleMonstersRecreation") | .sha'

# Mouse Hole source blobs
gh api "repos/FireRainV/Noelle-Libraries-Pack/git/trees/main?recursive=1" \
  --jq '.tree[] | select(.path=="scripts/lightshops/mousehole.lua" or .path=="scripts/data/actors/shopkeepers/amelia.lua" or .path=="assets/music/shop.ogg" or (.path | startswith("assets/sprites/shopkeepers/amelia/")) or (.path | startswith("assets/sprites/shops/mousehole_background_"))) | [.path, .sha] | @tsv'
```

After reviewing upstream changes, update the pins in `.github/upstream-facts.json`
and re-run the drift check (`bash .github/scripts/drift-check.sh`).
