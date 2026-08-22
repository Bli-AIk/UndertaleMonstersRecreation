# Upstream facts

This repository is a **maintenance fork** of UndertaleMonstersRecreation v1.1.1,
imported from the Noelle-Libraries-Pack by FireRainV. It depends on
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

## Extraction method

Upstream only distributes the library as a folder inside the pack repository.
This fork was created by sparse-cloning the pack at the pinned ref and importing
`libraries/UndertaleMonstersRecreation/*` into the repository **root** so the
repo itself is a valid `libraries/<id>/` for any Kristal mod.

The library is **content-only** (no `lib.lua`): enemies register through the
`MG_EVENT` registry provided by MagicalGlassRedux.

## Attribution chain

- **Sam Deluxe** — Froggit
- **BrendaK7200** — Moldsmal
- **FireRainV** — QoL stuff and bug fixes

## Recomputing the pins

```sh
gh api "repos/FireRainV/Noelle-Libraries-Pack/commits?path=libraries/UndertaleMonstersRecreation&sha=main&per_page=1" --jq '.[0].sha'
gh api "repos/FireRainV/Noelle-Libraries-Pack/git/trees/main?recursive=1" \
  --jq '.tree[] | select(.path=="libraries/UndertaleMonstersRecreation") | .sha'
```

After reviewing upstream changes, update the pins in `.github/upstream-facts.json`
and re-run the drift check (`bash .github/scripts/drift-check.sh`).
