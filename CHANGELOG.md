# Changelog

All notable changes to this fork are documented here, following
[Conventional Commits](https://www.conventionalcommits.org/).

## Upstream history (one-line summary)

- **v1.1.1** (FireRainV, 2026-06-23) — upstream Noelle-Libraries-Pack release
  line; engineVer bumped to v0.10.0. Imported at upstream commit `f182f69`,
  folder tree `0482e7d...`. Not released by this fork yet.

## 1.0.0 (2026-08-23)


### Features

* **config:** runtime enable switch (mod.json override) ([496cbff](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/496cbff3a00254a184f80a8702ffc78e23ebd769))
* **i18n:** complete UMR content translations (turn texts, acts) ([b51a75f](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/b51a75fb2100798dee45bbecbaa256f539c36953))
* **i18n:** correct UT source keys for encounter intros; strip spacing ([9855aa8](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/9855aa8c130c905e3f85587b29d2d35437d5ac22))
* **i18n:** optional kristal-i18n adapter for UMR content ([95180ff](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/95180fff1a6eb19fb301791bcdc6b685c8fa7d14))
* **i18n:** ship monster names in the UMR lang dir ([00e172a](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/00e172a3450d1bd17f0b00b4287667a14fa5b76e))


### Bug Fixes

* **battle:** implement Moldsmal Standard X-Action ([9757806](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/97578063339599e3596d50f306230bdbdcfddaa0))
* **i18n:** drop continuation indentation from turn/low/spare texts ([8680348](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/8680348c7ca33c2094008d89771a47b53bbef4b3))
* **i18n:** drop post-name spaces again (review) ([241633c](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/241633c13ac97299134d82ecc6682dabd33af788))
* **i18n:** localize custom act results and dialogue overrides ([bf90d33](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/bf90d339db8515db40c1c1f3a7a45911ee124d13))
* **i18n:** monster names follow the name-language setting ([3086777](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/3086777995f6f797bb02f8ff96bc1eaab8a155ea))
* **i18n:** newline-safe check regeneration (same cleaning fixes) ([ce33429](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/ce334291ccfadfc37c2eff58180beac1e0802097))
* **i18n:** pass the acting member's name into ACT result templates ([46fd59c](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/46fd59cb453569c7f240c33d88e09a01fe5b82af))
* **i18n:** preserve newlines in UT-derived texts (same as MGR) ([07010fb](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/07010fbaa14d076647258bc948c06af539ff3644))
* **i18n:** purge UT markup in turn texts/checks (same cleaning) ([ee4d845](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/ee4d8452a713c31c71193ed5b9f3096350ec1f13))
* **i18n:** resolve act keys from source names ([e88e690](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/e88e690ff1133cc544e7a6a0c8c5d1aee5c5a08d))
* **i18n:** standard act result + name spacing + dialogue adapter work ([142890b](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/142890bb9d82e93ad77332975376f8a266790639))
* **i18n:** strip enemy check header (display layer re-adds '* Name - ') ([2fba3e5](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/2fba3e52140418822b91fbdff45334a4bd96b0a9))
* **i18n:** UMR zh updates + enemy dialogue refresh ([9e1ea8b](https://github.com/Bli-AIk/UndertaleMonstersRecreation/commit/9e1ea8bd6633dac33fc3d7bea3abd07f2d128585))

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
