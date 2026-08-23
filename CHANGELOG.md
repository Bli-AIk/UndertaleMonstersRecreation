# Changelog

All notable changes to this fork are documented here, following
[Conventional Commits](https://www.conventionalcommits.org/).

## Upstream history (one-line summary)

- **v1.1.1** (FireRainV, 2026-06-23) — upstream Noelle-Libraries-Pack release
  line; engineVer bumped to v0.10.0. Imported at upstream commit `f182f69`,
  folder tree `0482e7d...`. Not released by this fork yet.

## [Unreleased] — fork development

### Fixes

- Implement Moldsmal's default `Standard` X-Action, preventing an unhandled
  action from leaving a light battle stuck in `ACTIONS`.

### Port / i18n (in progress)

- Import UndertaleMonstersRecreation v1.1.1 from upstream tree (see `UPSTREAM.md`).
- Follow the MagicalGlassRedux fork's Kristal 0.11-dev port (content-only
  library; enemy registration through `MG_EVENT`).
- Optional kristal-i18n adapter + `lang/` data.
- CI: Kristal update check + upstream drift check.

<!-- release-please will manage fork release notes from here -->
