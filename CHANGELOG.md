# Changelog

All notable changes to this fork are documented here, following
[Conventional Commits](https://www.conventionalcommits.org/).

## Upstream history (one-line summary)

- **v1.1.1** (FireRainV, 2026-06-23) — upstream Noelle-Libraries-Pack release
  line; engineVer bumped to v0.10.0. Imported at upstream commit `f182f69`,
  folder tree `0482e7d...`. Not released by this fork yet.

## [0.1.0](https://github.com/Bli-AIk/UndertaleMonstersRecreation/compare/v0.0.1...v0.1.0) (2026-08-24)


### chore

* force release 0.1.0 ([ba95745](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/ba95745890230761627a273b7a53e3335be5ca51))


### Features

* **config:** runtime enable switch (mod.json override) ([7216bc9](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/7216bc9edf1a6f876316837b7921bb42c27c0fd0))
* **i18n:** complete UMR content translations (turn texts, acts) ([3cf2671](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/3cf267115d83c881b75d8aa6654fd9c9957e2578))
* **i18n:** correct UT source keys for encounter intros; strip spacing ([f53d5af](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/f53d5af1891f6a0edd528fea82904691788892d5))
* **i18n:** optional kristal-i18n adapter for UMR content ([fc84779](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/fc84779b395ad09ac297a42537fe4cdd1f8318a7))
* **i18n:** ship monster names in the UMR lang dir ([2e0a1ea](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/2e0a1eaf75b7461c395339a0b1d7509dc7e2eaef))
* **lang:** complete English localization table for UMR content ([5b188c7](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/5b188c78264c64db8b289834df2c5373a31f53ee))
* **lightshop:** add localized Mouse Hole shop ([a8ea507](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/a8ea507b2cee3ca0b73f952b0e139e945023d541))


### Bug Fixes

* **battle:** implement Moldsmal Standard X-Action ([ff8cff8](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/ff8cff87cda7e7365433ce12638a45c9bd02402a))
* **i18n:** drop continuation indentation from turn/low/spare texts ([4df52f7](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/4df52f71daf39ccca59290230cbd1567b1b97764))
* **i18n:** drop post-name spaces again (review) ([8c4484f](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/8c4484f34092b07b2e8ab1f6f3a048320cddab52))
* **i18n:** follow MGR enable state in UMR adapters ([7776cdf](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/7776cdf1f78fa1cef5313ba1ffafa49ff25db823))
* **i18n:** froggit standard-act dialogue (en + zh_hans) ([c90de4e](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/c90de4e1df7cb758ddfceadefc2ea175586f87ae))
* **i18n:** localize custom act results and dialogue overrides ([4e95e65](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/4e95e65d757e06fd0bfbb18c9f734871419ed1c2))
* **i18n:** monster names follow the name-language setting ([90ae035](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/90ae035688ea43c750ba12515152f56d48c40b49))
* **i18n:** newline-safe check regeneration (same cleaning fixes) ([f8d6eda](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/f8d6eda256fd1988bd922448fb35ee5fffd61bb4))
* **i18n:** pass the acting member's name into ACT result templates ([6a60102](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/6a6010226aa9d2ffafbc88290872e839d7f826f8))
* **i18n:** preserve newlines in UT-derived texts (same as MGR) ([2d3272d](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/2d3272dde10d16ffc514789f8952cf3258e5fd87))
* **i18n:** purge UT markup in turn texts/checks (same cleaning) ([9f21ba2](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/9f21ba2c14d5e5b9ca97b10f32e14625069cfb69))
* **i18n:** resolve act keys from source names ([94c9807](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/94c9807ddbf0bcc293b6a8e4af7be61645f4293a))
* **i18n:** standard act result + name spacing + dialogue adapter work ([c131f09](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/c131f0936c96777913711bc917a2c94ee365e267))
* **i18n:** strip enemy check header (display layer re-adds '* Name - ') ([d327778](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/d327778867297ec7ae4bdc7a1bfa68b86b587746))
* **i18n:** UMR zh updates + enemy dialogue refresh ([9c9333d](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/9c9333d7fc82db9a7520ddc22160f7c64e14bc44))


### Code Refactoring

* **i18n:** scope UMR localization ([d335b0f](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/d335b0fd5aee4b6edb5a498493a7b0ce50cc125b))

## [Unreleased] — fork development

### Features

- Add the Mouse Hole light-world shop (`mousehole`): Amelia, animated
  background, shop music, Hush Puppy, progressive TALK topics, and optional
  English / Simplified Chinese localization.

### Fixes

- Implement Moldsmal's default `Standard` X-Action, preventing an unhandled
  action from leaving a light battle stuck in `ACTIONS`.
- Add a complete English localization table for the current UMR content.

### Port / i18n (in progress)

- Import UndertaleMonstersRecreation v1.1.1 from upstream tree (see `UPSTREAM.md`).
- Follow the MagicalGlassRedux fork's Kristal 0.11-dev port (content-only
  library; enemy registration through `MG_EVENT`).
- Optional kristal-i18n adapter + `lang/` data.
- Scope live localization to UMR enemy instances and keep its refresher
  private to the library.
- Remove the unsupported runtime `enabled` switch.
- CI: Kristal update check + upstream drift check.

<!-- release-please will manage fork release notes from here -->
